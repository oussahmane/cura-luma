import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../core/dose_policy.dart';
import '../../core/ids.dart';
import '../../core/local_dates.dart';
import '../../database/app_database.dart';
import '../backup/backup_codec.dart';
import '../medicines/medicine_draft.dart';
import '../notifications/notification_gateway.dart';
import '../notifications/notification_planner.dart';
import '../refills/refill_estimator.dart';
import 'adherence.dart' as calc;
import 'dose_actions.dart';
import 'dose_status.dart';
import 'reconciler.dart';
import 'views.dart';

class NotificationCopy {
  const NotificationCopy({
    required this.reminderChannelName,
    required this.reminderChannelDescription,
    required this.refillChannelName,
    required this.refillChannelDescription,
    required this.reminderTitle,
    required this.reminderBody,
    required this.takenLabel,
    required this.skipLabel,
    required this.refillTitle,
    required this.refillBody,
  });

  final String reminderChannelName;
  final String reminderChannelDescription;
  final String refillChannelName;
  final String refillChannelDescription;
  final String reminderTitle;
  final String Function(String name, String dose) reminderBody;
  final String takenLabel;
  final String skipLabel;
  final String refillTitle;
  final String Function(String name, String remaining) refillBody;
}

class ReminderService {
  ReminderService({
    required this.database,
    required this.gateway,
    required this.clock,
    required this.location,
    required this.copy,
  });

  final AppDatabase database;
  final NotificationGateway gateway;
  final DateTime Function() clock;
  final tz.Location Function() location;
  final NotificationCopy Function(String? localeCode) copy;

  DateTime get now => clock().toUtc();

  Future<AppSetting> settings() async {
    final row = await (database.select(database.appSettings)..where((row) => row.id.equals(1))).getSingleOrNull();
    if (row != null) {
      return row;
    }
    await database.into(database.appSettings).insert(AppSettingsCompanion.insert(id: const Value(1)));
    return (database.select(database.appSettings)..where((row) => row.id.equals(1))).getSingle();
  }

  Future<void> saveSettings(AppSettingsCompanion companion) {
    return (database.update(database.appSettings)..where((row) => row.id.equals(1))).write(companion);
  }

  Future<void> reconcileAndSchedule() async {
    await _reconcile(backfillMedicineId: null);
    await _schedule();
  }

  Future<String?> saveMedicine(MedicineDraft draft) async {
    final error = validateMedicineDraft(draft);
    if (error != null) {
      return error;
    }
    final moment = now;
    final existing = draft.id == null
        ? null
        : await (database.select(database.medicines)..where((row) => row.id.equals(draft.id!))).getSingleOrNull();
    if (draft.id != null && existing == null) {
      return 'missing';
    }
    final id = existing?.id ?? createId();
    final previousSlots = existing == null
        ? <ScheduleSlot>[]
        : await (database.select(database.scheduleSlots)..where((row) => row.medicineId.equals(id))).get();
    final scheduleChanged = existing == null ||
        _scheduleChanged(existing, previousSlots, draft);
    final revisedAt = existing == null || scheduleChanged ? moment : existing.scheduleRevisedAt;
    final wasLow = _isLow(existing?.supplyQuantity, existing?.refillThreshold);
    final nowLow = _isLow(draft.supplyQuantity, draft.refillThreshold);
    final keepAlert = nowLow && (!wasLow || (existing?.refillAlertActive ?? false));
    var photoPath = existing?.photoPath;
    if (draft.removePhoto) {
      await _deletePhoto(photoPath);
      photoPath = null;
    }
    if (draft.photoBytes != null) {
      photoPath = await _writePhoto(id, draft.photoBytes!);
    }

    await database.transaction(() async {
      final companion = MedicinesCompanion(
        id: Value(id),
        name: Value(draft.name.trim()),
        doseAmount: Value(draft.doseAmount.trim()),
        doseUnit: Value(draft.doseUnit.trim()),
        form: Value(draft.form),
        notes: Value(draft.notes.trim()),
        instructions: Value(draft.instructions.trim()),
        startDate: Value(formatLocalDate(draft.startDate)),
        endDate: Value(draft.endDate == null ? null : formatLocalDate(draft.endDate!)),
        weekdayMask: Value(draft.weekdayMask),
        color: Value(draft.color),
        photoPath: Value(photoPath),
        supplyQuantity: Value(draft.supplyQuantity),
        refillThreshold: Value(draft.refillThreshold),
        refillAlertActive: Value(keepAlert),
        scheduleRevisedAt: Value(revisedAt),
        archivedAt: Value(existing?.archivedAt),
        createdAt: Value(existing?.createdAt ?? moment),
        updatedAt: Value(moment),
      );
      if (existing == null) {
        await database.into(database.medicines).insert(companion);
      } else {
        await (database.update(database.medicines)..where((row) => row.id.equals(id))).write(companion);
      }
      await (database.delete(database.scheduleSlots)..where((row) => row.medicineId.equals(id))).go();
      for (final minutes in draft.times.toSet()) {
        await database.into(database.scheduleSlots).insert(
          ScheduleSlotsCompanion.insert(
            id: createId(),
            medicineId: id,
            minutesFromMidnight: minutes,
          ),
        );
      }
    });

    await _reconcile(backfillMedicineId: existing == null ? id : null);
    await _schedule();
    return null;
  }

  Future<void> archiveMedicine(String id, {required bool archived}) async {
    final moment = now;
    await (database.update(database.medicines)..where((row) => row.id.equals(id))).write(
      MedicinesCompanion(
        archivedAt: Value(archived ? moment : null),
        updatedAt: Value(moment),
      ),
    );
    await _reconcile(backfillMedicineId: null);
    await _schedule();
  }

  Future<void> deleteMedicine(String id) async {
    final medicine = await (database.select(database.medicines)..where((row) => row.id.equals(id))).getSingleOrNull();
    await _deletePhoto(medicine?.photoPath);
    await (database.delete(database.medicines)..where((row) => row.id.equals(id))).go();
    await _schedule();
  }

  Future<void> pauseMedicine(String id) async {
    final open = await (database.select(database.pauseIntervals)
          ..where((row) => row.medicineId.equals(id) & row.endedAt.isNull()))
        .getSingleOrNull();
    if (open != null) {
      return;
    }
    await database.into(database.pauseIntervals).insert(
      PauseIntervalsCompanion.insert(
        id: createId(),
        medicineId: id,
        startedAt: now,
      ),
    );
    await _reconcile(backfillMedicineId: null);
    await _schedule();
  }

  Future<void> resumeMedicine(String id) async {
    await (database.update(database.pauseIntervals)
          ..where((row) => row.medicineId.equals(id) & row.endedAt.isNull()))
        .write(PauseIntervalsCompanion(endedAt: Value(now)));
    await _reconcile(backfillMedicineId: null);
    await _schedule();
  }

  Future<void> correctSupply(String id, double quantity) async {
    if (quantity < 0) {
      return;
    }
    final medicine = await (database.select(database.medicines)..where((row) => row.id.equals(id))).getSingleOrNull();
    if (medicine == null) {
      return;
    }
    final wasLow = _isLow(medicine.supplyQuantity, medicine.refillThreshold);
    final nowLow = _isLow(quantity, medicine.refillThreshold);
    await (database.update(database.medicines)..where((row) => row.id.equals(id))).write(
      MedicinesCompanion(
        supplyQuantity: Value(quantity),
        refillAlertActive: Value(nowLow && !wasLow || (medicine.refillAlertActive && nowLow)),
        updatedAt: Value(now),
      ),
    );
    await _schedule();
  }

  Future<RecordResult> markTaken(String occurrenceId) {
    return _record(occurrenceId, DoseCommand.take);
  }

  Future<RecordResult> markSkipped(String occurrenceId) {
    return _record(occurrenceId, DoseCommand.skip);
  }

  Future<RecordResult> postpone(String occurrenceId) {
    return _record(occurrenceId, DoseCommand.postpone);
  }

  Future<TodayView> loadToday() async {
    final zone = location();
    final moment = now;
    final today = localToday(zone, moment);
    final todayKey = formatLocalDate(today);
    final prefs = await settings();
    final medicines = await database.select(database.medicines).get();
    final byId = {for (final medicine in medicines) medicine.id: medicine};
    final doses = await (database.select(database.doseOccurrences)
          ..where((row) => row.localDate.equals(todayKey) | row.status.equals(DoseStatus.postponed.name)))
        .get();
    final views = <TodayDoseView>[];
    for (final dose in doses) {
      final medicine = byId[dose.medicineId];
      if (medicine == null || medicine.archivedAt != null) {
        continue;
      }
      final postponedToday = dose.status == DoseStatus.postponed.name &&
          dose.postponeUntil != null &&
          formatLocalDate(localDateOf(zone, dose.postponeUntil!)) == todayKey;
      if (dose.localDate != todayKey && !postponedToday) {
        continue;
      }
      final status = doseStatusFromName(dose.status);
      final display = displayFor(
        status: status,
        scheduledAt: dose.scheduledAt,
        postponeUntil: dose.postponeUntil,
        now: moment,
        dueGrace: DosePolicy.dueGrace,
      );
      final effective = status == DoseStatus.postponed && dose.postponeUntil != null
          ? dose.postponeUntil!
          : dose.scheduledAt;
      views.add(
        TodayDoseView(
          occurrenceId: dose.id,
          medicineId: medicine.id,
          name: medicine.name,
          amount: medicine.doseAmount,
          unit: medicine.doseUnit,
          color: medicine.color,
          effectiveAt: effective,
          display: display,
          lowSupply: _isLow(medicine.supplyQuantity, medicine.refillThreshold),
        ),
      );
    }
    views.sort((a, b) => a.effectiveAt.compareTo(b.effectiveAt));
    TodayDoseView? next;
    for (final view in views) {
      if (view.display == DoseDisplay.due ||
          view.display == DoseDisplay.upcoming ||
          view.display == DoseDisplay.postponed) {
        next = view;
        break;
      }
    }
    return TodayView(
      day: today,
      doses: views,
      next: next,
      notificationsEnabled: prefs.notificationsEnabled,
    );
  }

  Future<List<MedicineSummary>> loadMedicines() async {
    final medicines = await database.select(database.medicines).get();
    final slots = await database.select(database.scheduleSlots).get();
    final pauses = await database.select(database.pauseIntervals).get();
    return [
      for (final medicine in medicines)
        _summary(medicine, slots, pauses),
    ]..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  Future<MedicineDetails?> loadMedicine(String id) async {
    final medicine = await (database.select(database.medicines)..where((row) => row.id.equals(id))).getSingleOrNull();
    if (medicine == null) {
      return null;
    }
    final slots = await (database.select(database.scheduleSlots)..where((row) => row.medicineId.equals(id))).get();
    final pauses = await database.select(database.pauseIntervals).get();
    final summary = _summary(medicine, slots, pauses);
    final future = await _futureDoseInstants(id);
    final amount = parseDoseAmount(medicine.doseAmount);
    return MedicineDetails(
      summary: summary,
      notes: medicine.notes,
      instructions: medicine.instructions,
      startDate: parseLocalDate(medicine.startDate) ?? DateTime.now(),
      endDate: medicine.endDate == null ? null : parseLocalDate(medicine.endDate!),
      photoPath: medicine.photoPath,
      supply: medicine.supplyQuantity,
      threshold: medicine.refillThreshold,
      doseAmountParses: amount != null,
      projection: projectSupply(
        remaining: medicine.supplyQuantity,
        doseAmount: amount,
        futureDoses: future,
      ),
    );
  }

  Future<HistoryView> loadHistory({
    String? medicineId,
    required DateTime from,
    required DateTime to,
  }) async {
    final zone = location();
    final moment = now;
    final fromKey = formatLocalDate(from);
    final toKey = formatLocalDate(to);
    final medicines = await loadMedicines();
    final doses = await (database.select(database.doseOccurrences)
          ..where((row) => row.localDate.isBiggerOrEqualValue(fromKey) & row.localDate.isSmallerOrEqualValue(toKey)))
        .get();
    final byId = {for (final medicine in medicines) medicine.id: medicine};
    final entries = <HistoryEntry>[];
    for (final dose in doses) {
      if (medicineId != null && dose.medicineId != medicineId) {
        continue;
      }
      final medicine = byId[dose.medicineId];
      if (medicine == null) {
        continue;
      }
      final status = doseStatusFromName(dose.status);
      if (status == DoseStatus.pending || status == DoseStatus.postponed) {
        final display = displayFor(
          status: status,
          scheduledAt: dose.scheduledAt,
          postponeUntil: dose.postponeUntil,
          now: moment,
          dueGrace: DosePolicy.dueGrace,
        );
        if (display == DoseDisplay.upcoming || display == DoseDisplay.postponed || display == DoseDisplay.due) {
          continue;
        }
      }
      entries.add(
        HistoryEntry(
          occurrenceId: dose.id,
          medicineId: dose.medicineId,
          name: medicine.name,
          amount: medicine.amount,
          unit: medicine.unit,
          color: medicine.color,
          scheduledAt: dose.scheduledAt,
          display: displayFor(
            status: status,
            scheduledAt: dose.scheduledAt,
            postponeUntil: dose.postponeUntil,
            now: moment,
            dueGrace: DosePolicy.dueGrace,
          ),
        ),
      );
    }
    entries.sort((a, b) => b.scheduledAt.compareTo(a.scheduledAt));
    final all = await database.select(database.doseOccurrences).get();
    final filtered = [
      for (final dose in all)
        if (medicineId == null || dose.medicineId == medicineId)
          calc.AdherenceDose(
            scheduledAt: dose.scheduledAt,
            status: doseStatusFromName(dose.status),
            postponeUntil: dose.postponeUntil,
          ),
    ];
    final today = localToday(zone, moment);
    final weekStart = today.subtract(Duration(days: today.weekday - 1));
    final monthStart = DateTime(today.year, today.month);
    final nextMonth = DateTime(today.year, today.month + 1);
    return HistoryView(
      entries: entries,
      medicines: medicines,
      week: _adherence(filtered, _boundary(zone, weekStart), _boundary(zone, weekStart.add(const Duration(days: 7))), moment),
      month: _adherence(filtered, _boundary(zone, monthStart), _boundary(zone, nextMonth), moment),
    );
  }

  Future<String> exportBackup() async {
    final prefs = await settings();
    final medicines = await database.select(database.medicines).get();
    final slots = await database.select(database.scheduleSlots).get();
    final pauses = await database.select(database.pauseIntervals).get();
    final doses = await database.select(database.doseOccurrences).get();
    final photos = <Map<String, Object?>>[];
    for (final medicine in medicines) {
      final path = medicine.photoPath;
      if (path == null) {
        continue;
      }
      final file = File(path);
      if (await file.exists()) {
        photos.add({
          'medicineId': medicine.id,
          'base64': base64Encode(await file.readAsBytes()),
        });
      }
    }
    return BackupBundle(
      exportedAt: now.toIso8601String(),
      preferences: {
        'onboardingComplete': prefs.onboardingComplete,
        'localeCode': prefs.localeCode,
        'themeMode': prefs.themeMode,
        'notificationsEnabled': prefs.notificationsEnabled,
        'postponeMinutes': prefs.postponeMinutes,
        'lastTimezone': prefs.lastTimezone,
      },
      medicines: [for (final medicine in medicines) _medicineMap(medicine)],
      slots: [
        for (final slot in slots)
          {
            'id': slot.id,
            'medicineId': slot.medicineId,
            'minutesFromMidnight': slot.minutesFromMidnight,
          },
      ],
      pauses: [
        for (final pause in pauses)
          {
            'id': pause.id,
            'medicineId': pause.medicineId,
            'startedAt': pause.startedAt.toUtc().toIso8601String(),
            'endedAt': pause.endedAt?.toUtc().toIso8601String(),
          },
      ],
      occurrences: [for (final dose in doses) _doseMap(dose)],
      photos: photos,
    ).encode();
  }

  Future<void> importBackup(BackupBundle bundle) async {
    final photoDir = await _photoDirectory();
    await database.transaction(() async {
      await database.delete(database.doseOccurrences).go();
      await database.delete(database.scheduleSlots).go();
      await database.delete(database.pauseIntervals).go();
      await database.delete(database.medicines).go();
      for (final medicine in bundle.medicines) {
        await database.into(database.medicines).insert(
          MedicinesCompanion.insert(
            id: medicine['id']! as String,
            name: medicine['name']! as String,
            doseAmount: medicine['doseAmount']! as String,
            doseUnit: medicine['doseUnit']! as String,
            form: medicine['form']! as String,
            notes: Value((medicine['notes'] as String?) ?? ''),
            instructions: Value((medicine['instructions'] as String?) ?? ''),
            startDate: medicine['startDate']! as String,
            endDate: Value(medicine['endDate'] as String?),
            weekdayMask: medicine['weekdayMask']! as int,
            color: medicine['color']! as int,
            photoPath: Value(medicine['photoPath'] as String?),
            supplyQuantity: Value((medicine['supplyQuantity'] as num?)?.toDouble()),
            refillThreshold: Value((medicine['refillThreshold'] as num?)?.toDouble()),
            refillAlertActive: Value(medicine['refillAlertActive']! as bool),
            scheduleRevisedAt: DateTime.parse(medicine['scheduleRevisedAt']! as String),
            archivedAt: Value(_optionalDate(medicine['archivedAt'])),
            createdAt: DateTime.parse(medicine['createdAt']! as String),
            updatedAt: DateTime.parse(medicine['updatedAt']! as String),
          ),
        );
      }
      for (final slot in bundle.slots) {
        await database.into(database.scheduleSlots).insert(
          ScheduleSlotsCompanion.insert(
            id: slot['id']! as String,
            medicineId: slot['medicineId']! as String,
            minutesFromMidnight: slot['minutesFromMidnight']! as int,
          ),
        );
      }
      for (final pause in bundle.pauses) {
        await database.into(database.pauseIntervals).insert(
          PauseIntervalsCompanion.insert(
            id: pause['id']! as String,
            medicineId: pause['medicineId']! as String,
            startedAt: DateTime.parse(pause['startedAt']! as String),
            endedAt: Value(_optionalDate(pause['endedAt'])),
          ),
        );
      }
      for (final dose in bundle.occurrences) {
        await database.into(database.doseOccurrences).insert(
          DoseOccurrencesCompanion.insert(
            id: dose['id']! as String,
            medicineId: dose['medicineId']! as String,
            localDate: dose['localDate']! as String,
            minutesFromMidnight: dose['minutesFromMidnight']! as int,
            scheduledAt: DateTime.parse(dose['scheduledAt']! as String),
            status: dose['status']! as String,
            statusSource: Value(dose['statusSource']! as String),
            recordedAt: Value(_optionalDate(dose['recordedAt'])),
            postponeUntil: Value(_optionalDate(dose['postponeUntil'])),
            supplyApplied: Value(dose['supplyApplied']! as bool),
          ),
        );
      }
      final preferences = bundle.preferences;
      await saveSettings(
        AppSettingsCompanion(
          onboardingComplete: Value(preferences['onboardingComplete']! as bool),
          localeCode: Value(preferences['localeCode'] as String?),
          themeMode: Value(preferences['themeMode']! as String),
          notificationsEnabled: Value(preferences['notificationsEnabled']! as bool),
          postponeMinutes: Value(preferences['postponeMinutes']! as int),
          lastTimezone: Value(preferences['lastTimezone'] as String?),
        ),
      );
    });
    for (final photo in bundle.photos) {
      final id = photo['medicineId']! as String;
      final bytes = base64Decode(photo['base64']! as String);
      final path = await _writePhoto(id, bytes, directory: photoDir);
      await (database.update(database.medicines)..where((row) => row.id.equals(id))).write(
        MedicinesCompanion(photoPath: Value(path)),
      );
    }
    await _schedule();
  }

  Future<void> deleteAllData() async {
    final dir = await _photoDirectory();
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
    await database.transaction(() async {
      await database.delete(database.doseOccurrences).go();
      await database.delete(database.scheduleSlots).go();
      await database.delete(database.pauseIntervals).go();
      await database.delete(database.medicines).go();
      await saveSettings(
        const AppSettingsCompanion(
          onboardingComplete: Value(false),
          localeCode: Value(null),
          themeMode: Value('system'),
          notificationsEnabled: Value(true),
          postponeMinutes: Value(DosePolicy.defaultPostponeMinutes),
          lastTimezone: Value(null),
        ),
      );
    });
    await gateway.cancelAll();
  }

  Future<RecordResult> handleNotification(NotificationResponseData response) async {
    final payload = response.payload ?? '';
    final action = response.actionId;
    if (payload.startsWith('refill:')) {
      return RecordResult.unchanged;
    }
    if (!payload.startsWith('open:')) {
      return RecordResult.missing;
    }
    final occurrenceId = payload.substring(5);
    if (action == 'taken') {
      return markTaken(occurrenceId);
    }
    if (action == 'skipped') {
      return markSkipped(occurrenceId);
    }
    return RecordResult.unchanged;
  }

  Future<RecordResult> _record(String occurrenceId, DoseCommand command) async {
    final prefs = await settings();
    final result = await database.transaction(() async {
      final dose = await (database.select(database.doseOccurrences)..where((row) => row.id.equals(occurrenceId)))
          .getSingleOrNull();
      if (dose == null) {
        return RecordResult.missing;
      }
      final decision = applyDoseCommand(
        status: doseStatusFromName(dose.status),
        source: statusSourceFromName(dose.statusSource),
        supplyApplied: dose.supplyApplied,
        postponeUntil: dose.postponeUntil,
        command: command,
        now: now,
        postponeBy: Duration(minutes: prefs.postponeMinutes),
      );
      if (decision.outcome == DoseActionOutcome.unchanged) {
        return RecordResult.unchanged;
      }
      if (decision.outcome == DoseActionOutcome.rejected) {
        return RecordResult.rejected;
      }
      var supplyApplied = dose.supplyApplied;
      if (decision.applySupply) {
        final medicine = await (database.select(database.medicines)..where((row) => row.id.equals(dose.medicineId)))
            .getSingleOrNull();
        final amount = medicine == null ? null : parseDoseAmount(medicine.doseAmount);
        if (medicine != null && amount != null && medicine.supplyQuantity != null) {
          final remaining = decrementSupply(medicine.supplyQuantity!, amount);
          final wasLow = _isLow(medicine.supplyQuantity, medicine.refillThreshold);
          final nowLow = _isLow(remaining, medicine.refillThreshold);
          supplyApplied = true;
          await (database.update(database.medicines)..where((row) => row.id.equals(medicine.id))).write(
            MedicinesCompanion(
              supplyQuantity: Value(remaining),
              refillAlertActive: Value(nowLow && !wasLow),
              updatedAt: Value(now),
            ),
          );
        }
      }
      await (database.update(database.doseOccurrences)..where((row) => row.id.equals(occurrenceId))).write(
        DoseOccurrencesCompanion(
          status: Value(decision.status.name),
          statusSource: Value(decision.source.name),
          postponeUntil: decision.clearPostpone ? const Value(null) : Value(decision.postponeUntil),
          recordedAt: Value(decision.recordedAt),
          supplyApplied: Value(supplyApplied),
        ),
      );
      return RecordResult.applied;
    });
    if (result == RecordResult.applied) {
      await _schedule();
    }
    return result;
  }

  Future<void> _reconcile({required String? backfillMedicineId}) async {
    final zone = location();
    final moment = now;
    final medicines = await database.select(database.medicines).get();
    final slots = await database.select(database.scheduleSlots).get();
    final pauses = await database.select(database.pauseIntervals).get();
    final existing = await database.select(database.doseOccurrences).get();
    final definitions = [
      for (final medicine in medicines)
        ScheduleDefinition(
          medicineId: medicine.id,
          startDate: parseLocalDate(medicine.startDate) ?? localToday(zone, moment),
          endDate: medicine.endDate == null ? null : parseLocalDate(medicine.endDate!),
          weekdayMask: medicine.weekdayMask,
          times: [
            for (final slot in slots)
              if (slot.medicineId == medicine.id) slot.minutesFromMidnight,
          ],
          scheduleRevisedAt: medicine.scheduleRevisedAt,
          archivedAt: medicine.archivedAt,
          pauses: [
            for (final pause in pauses)
              if (pause.medicineId == medicine.id)
                PauseSpan(startedAt: pause.startedAt, endedAt: pause.endedAt),
          ],
          backfillFromStart: medicine.id == backfillMedicineId,
        ),
    ];
    final plan = reconcileSchedules(
      schedules: definitions,
      existing: [
        for (final dose in existing)
          StoredDose(
            id: dose.id,
            medicineId: dose.medicineId,
            localDate: dose.localDate,
            minutesFromMidnight: dose.minutesFromMidnight,
            scheduledAt: dose.scheduledAt,
            status: doseStatusFromName(dose.status),
            source: statusSourceFromName(dose.statusSource),
            postponeUntil: dose.postponeUntil,
            supplyApplied: dose.supplyApplied,
          ),
      ],
      nowUtc: moment,
      location: zone,
    );
    await database.transaction(() async {
      for (final id in plan.deleteIds.toSet()) {
        await (database.delete(database.doseOccurrences)..where((row) => row.id.equals(id))).go();
      }
      for (final write in plan.writes) {
        final dose = write.dose;
        if (write.kind == DoseWriteKind.insert) {
          await database.into(database.doseOccurrences).insert(
            DoseOccurrencesCompanion.insert(
              id: dose.id,
              medicineId: dose.medicineId,
              localDate: dose.localDate,
              minutesFromMidnight: dose.minutesFromMidnight,
              scheduledAt: dose.scheduledAt,
              status: dose.status.name,
              statusSource: Value(dose.source.name),
              postponeUntil: Value(dose.postponeUntil),
              supplyApplied: Value(dose.supplyApplied),
            ),
            mode: InsertMode.insertOrIgnore,
          );
        } else {
          await (database.update(database.doseOccurrences)..where((row) => row.id.equals(dose.id))).write(
            DoseOccurrencesCompanion(
              scheduledAt: Value(dose.scheduledAt),
              status: Value(dose.status.name),
              statusSource: Value(dose.source.name),
              postponeUntil: Value(dose.postponeUntil),
            ),
          );
        }
      }
      await saveSettings(AppSettingsCompanion(lastTimezone: Value(zone.name)));
    });
  }

  Future<void> _schedule() async {
    final prefs = await settings();
    if (!prefs.notificationsEnabled) {
      await gateway.cancelAll();
      return;
    }
    final text = copy(prefs.localeCode);
    final moment = now;
    final medicines = await database.select(database.medicines).get();
    final byId = {for (final medicine in medicines) medicine.id: medicine};
    final doses = await database.select(database.doseOccurrences).get();
    final reminders = <ReminderCandidate>[];
    for (final dose in doses) {
      final medicine = byId[dose.medicineId];
      if (medicine == null || medicine.archivedAt != null) {
        continue;
      }
      final status = doseStatusFromName(dose.status);
      final when = status == DoseStatus.postponed && dose.postponeUntil != null
          ? dose.postponeUntil!
          : dose.scheduledAt;
      reminders.add(
        ReminderCandidate(
          occurrenceId: dose.id,
          when: when,
          title: text.reminderTitle,
          body: text.reminderBody(medicine.name, '${medicine.doseAmount} ${medicine.doseUnit}'),
          status: status,
        ),
      );
    }
    final refills = <RefillCandidate>[];
    final notified = <String>[];
    for (final medicine in medicines) {
      if (!medicine.refillAlertActive || medicine.archivedAt != null) {
        continue;
      }
      if (!_isLow(medicine.supplyQuantity, medicine.refillThreshold)) {
        continue;
      }
      notified.add(medicine.id);
      refills.add(
        RefillCandidate(
          medicineId: medicine.id,
          title: text.refillTitle,
          body: text.refillBody(
            medicine.name,
            formatQuantity(medicine.supplyQuantity ?? 0),
          ),
        ),
      );
    }
    final plan = planNotifications(
      reminders: reminders,
      refills: refills,
      now: moment,
      reminderChannelName: text.reminderChannelName,
      reminderChannelDescription: text.reminderChannelDescription,
      refillChannelName: text.refillChannelName,
      refillChannelDescription: text.refillChannelDescription,
      takenLabel: text.takenLabel,
      skipLabel: text.skipLabel,
    );
    final exact = await gateway.canScheduleExactNotifications();
    await gateway.replaceScheduled(plan.notifications, exact: exact);
    if (notified.isNotEmpty) {
      await (database.update(database.medicines)..where((row) => row.id.isIn(notified))).write(
        const MedicinesCompanion(refillAlertActive: Value(false)),
      );
    }
  }

  Future<List<DateTime>> _futureDoseInstants(String medicineId) async {
    final doses = await (database.select(database.doseOccurrences)
          ..where((row) => row.medicineId.equals(medicineId) & row.scheduledAt.isBiggerThanValue(now)))
        .get();
    final instants = [
      for (final dose in doses)
        if (dose.status == DoseStatus.pending.name || dose.status == DoseStatus.postponed.name) dose.scheduledAt,
    ]..sort();
    return instants;
  }

  MedicineSummary _summary(Medicine medicine, List<ScheduleSlot> slots, List<PauseInterval> pauses) {
    final times = [
      for (final slot in slots)
        if (slot.medicineId == medicine.id) slot.minutesFromMidnight,
    ]..sort();
    final paused = pauses.any((pause) => pause.medicineId == medicine.id && pause.endedAt == null);
    return MedicineSummary(
      id: medicine.id,
      name: medicine.name,
      amount: medicine.doseAmount,
      unit: medicine.doseUnit,
      form: medicine.form,
      color: medicine.color,
      archived: medicine.archivedAt != null,
      paused: paused,
      times: times,
      weekdayMask: medicine.weekdayMask,
      lowSupply: _isLow(medicine.supplyQuantity, medicine.refillThreshold),
    );
  }

  AdherenceSummary _adherence(
    List<calc.AdherenceDose> doses,
    DateTime from,
    DateTime to,
    DateTime moment,
  ) {
    final summary = calc.summarizeAdherence(
      doses: doses,
      from: from,
      to: to,
      now: moment,
      dueGrace: DosePolicy.dueGrace,
    );
    return AdherenceSummary(
      eligible: summary.eligible,
      taken: summary.taken,
      skipped: summary.skipped,
      missed: summary.missed,
      percent: summary.percent,
    );
  }

  DateTime _boundary(tz.Location zone, DateTime date) {
    return tz.TZDateTime(zone, date.year, date.month, date.day).toUtc();
  }

  bool _scheduleChanged(Medicine medicine, List<ScheduleSlot> slots, MedicineDraft draft) {
    final times = slots.map((slot) => slot.minutesFromMidnight).toSet();
    final nextTimes = draft.times.toSet();
    final end = medicine.endDate;
    final draftEnd = draft.endDate == null ? null : formatLocalDate(draft.endDate!);
    return medicine.weekdayMask != draft.weekdayMask ||
        medicine.startDate != formatLocalDate(draft.startDate) ||
        end != draftEnd ||
        times.length != nextTimes.length ||
        !times.containsAll(nextTimes);
  }

  bool _isLow(double? supply, double? threshold) =>
      supplyReachedThreshold(remaining: supply, threshold: threshold);

  Map<String, Object?> _medicineMap(Medicine medicine) {
    return {
      'id': medicine.id,
      'name': medicine.name,
      'doseAmount': medicine.doseAmount,
      'doseUnit': medicine.doseUnit,
      'form': medicine.form,
      'notes': medicine.notes,
      'instructions': medicine.instructions,
      'startDate': medicine.startDate,
      'endDate': medicine.endDate,
      'weekdayMask': medicine.weekdayMask,
      'color': medicine.color,
      'photoPath': medicine.photoPath,
      'supplyQuantity': medicine.supplyQuantity,
      'refillThreshold': medicine.refillThreshold,
      'refillAlertActive': medicine.refillAlertActive,
      'scheduleRevisedAt': medicine.scheduleRevisedAt.toUtc().toIso8601String(),
      'archivedAt': medicine.archivedAt?.toUtc().toIso8601String(),
      'createdAt': medicine.createdAt.toUtc().toIso8601String(),
      'updatedAt': medicine.updatedAt.toUtc().toIso8601String(),
    };
  }

  Map<String, Object?> _doseMap(DoseOccurrence dose) {
    return {
      'id': dose.id,
      'medicineId': dose.medicineId,
      'localDate': dose.localDate,
      'minutesFromMidnight': dose.minutesFromMidnight,
      'scheduledAt': dose.scheduledAt.toUtc().toIso8601String(),
      'status': dose.status,
      'statusSource': dose.statusSource,
      'recordedAt': dose.recordedAt?.toUtc().toIso8601String(),
      'postponeUntil': dose.postponeUntil?.toUtc().toIso8601String(),
      'supplyApplied': dose.supplyApplied,
    };
  }

  DateTime? _optionalDate(Object? value) {
    if (value is! String || value.isEmpty) {
      return null;
    }
    return DateTime.parse(value);
  }

  Future<Directory> _photoDirectory() async {
    final root = await getApplicationDocumentsDirectory();
    final directory = Directory(p.join(root.path, 'medicine_photos'));
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return directory;
  }

  Future<String> _writePhoto(String id, List<int> bytes, {Directory? directory}) async {
    final dir = directory ?? await _photoDirectory();
    final file = File(p.join(dir.path, '$id.jpg'));
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  Future<void> _deletePhoto(String? path) async {
    if (path == null) {
      return;
    }
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
