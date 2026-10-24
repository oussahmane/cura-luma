import '../../core/dose_policy.dart';
import '../../core/local_dates.dart';
import 'dose_status.dart';
import 'schedule_engine.dart';
import 'package:timezone/timezone.dart' as tz;

class PauseSpan {
  const PauseSpan({required this.startedAt, this.endedAt});

  final DateTime startedAt;
  final DateTime? endedAt;

  bool covers(DateTime instant) {
    final start = startedAt.toUtc();
    final moment = instant.toUtc();
    if (moment.isBefore(start)) {
      return false;
    }
    final end = endedAt?.toUtc();
    return end == null || moment.isBefore(end);
  }
}

class ScheduleDefinition {
  const ScheduleDefinition({
    required this.medicineId,
    required this.startDate,
    required this.endDate,
    required this.weekdayMask,
    required this.times,
    required this.scheduleRevisedAt,
    required this.archivedAt,
    required this.pauses,
    required this.backfillFromStart,
  });

  final String medicineId;
  final DateTime startDate;
  final DateTime? endDate;
  final int weekdayMask;
  final List<int> times;
  final DateTime scheduleRevisedAt;
  final DateTime? archivedAt;
  final List<PauseSpan> pauses;

  /// True only when the medicine is first saved. Past doses are then created
  /// from the start date. Later edits set this to false so a new time cannot
  /// invent missed history.
  final bool backfillFromStart;
}

class StoredDose {
  const StoredDose({
    required this.id,
    required this.medicineId,
    required this.localDate,
    required this.minutesFromMidnight,
    required this.scheduledAt,
    required this.status,
    required this.source,
    required this.postponeUntil,
    required this.supplyApplied,
  });

  final String id;
  final String medicineId;
  final String localDate;
  final int minutesFromMidnight;
  final DateTime scheduledAt;
  final DoseStatus status;
  final StatusSource source;
  final DateTime? postponeUntil;
  final bool supplyApplied;

  StoredDose copyWith({
    DateTime? scheduledAt,
    DoseStatus? status,
    StatusSource? source,
    DateTime? postponeUntil,
    bool clearPostpone = false,
  }) {
    return StoredDose(
      id: id,
      medicineId: medicineId,
      localDate: localDate,
      minutesFromMidnight: minutesFromMidnight,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
      source: source ?? this.source,
      postponeUntil: clearPostpone ? null : (postponeUntil ?? this.postponeUntil),
      supplyApplied: supplyApplied,
    );
  }
}

enum DoseWriteKind { insert, update }

class DoseWrite {
  const DoseWrite({required this.kind, required this.dose});

  final DoseWriteKind kind;
  final StoredDose dose;
}

class ReconcilePlan {
  const ReconcilePlan({required this.writes, required this.deleteIds});

  final List<DoseWrite> writes;
  final List<String> deleteIds;
}

bool _userLocked(StoredDose dose) {
  if (dose.source != StatusSource.user) {
    return false;
  }
  return dose.status == DoseStatus.taken ||
      dose.status == DoseStatus.skipped ||
      dose.status == DoseStatus.missed;
}

/// Builds the database changes for one reconciliation pass.
///
/// User-recorded taken, skipped, and missed rows are never rewritten.
/// Pending rows keep their occurrence id and may receive a new UTC instant
/// when the time zone changes, because the id is the local wall-clock slot.
/// A system missed row returns to pending if the device clock moves backward
/// and the slot is inside the due window again.
ReconcilePlan reconcileSchedules({
  required List<ScheduleDefinition> schedules,
  required List<StoredDose> existing,
  required DateTime nowUtc,
  required tz.Location location,
  Duration dueGrace = DosePolicy.dueGrace,
  Duration horizon = DosePolicy.scheduleHorizon,
  Duration lookback = DosePolicy.lookback,
}) {
  final now = nowUtc.toUtc();
  final today = localToday(location, now);
  final horizonEnd = today.add(horizon);
  final lookbackStart = today.subtract(lookback);
  final existingById = {for (final dose in existing) dose.id: dose};
  final writes = <DoseWrite>[];
  final deleteIds = <String>[];
  final generatedIds = <String>{};

  for (final schedule in schedules) {
    final revisedLocal = localDateOf(location, schedule.scheduleRevisedAt);
    final from = schedule.backfillFromStart
        ? _laterDate(dateOnly(schedule.startDate), lookbackStart)
        : _laterDate(revisedLocal, lookbackStart);
    final planned = expandSchedule(
      medicineId: schedule.medicineId,
      startDate: schedule.startDate,
      endDate: schedule.endDate,
      weekdayMask: schedule.weekdayMask,
      times: schedule.times,
      from: from,
      to: horizonEnd,
      location: location,
      archivedAt: schedule.archivedAt,
    );

    for (final occurrence in planned) {
      generatedIds.add(occurrence.id);
      final current = existingById[occurrence.id];
      if (current == null) {
        final revised = schedule.scheduleRevisedAt.toUtc();
        if (!schedule.backfillFromStart && occurrence.scheduledAt.isBefore(revised)) {
          continue;
        }
        writes.add(
          DoseWrite(
            kind: DoseWriteKind.insert,
            dose: _freshDose(occurrence, schedule.pauses, now, dueGrace),
          ),
        );
        continue;
      }
      if (_userLocked(current)) {
        continue;
      }
      final updated = _advance(
        current: current,
        scheduledAt: occurrence.scheduledAt,
        pauses: schedule.pauses,
        now: now,
        dueGrace: dueGrace,
      );
      if (!_sameMutable(current, updated)) {
        writes.add(DoseWrite(kind: DoseWriteKind.update, dose: updated));
      }
    }

    if (schedule.archivedAt != null) {
      for (final dose in existing.where((dose) => dose.medicineId == schedule.medicineId)) {
        if (generatedIds.contains(dose.id) || _userLocked(dose)) {
          continue;
        }
        if (!dose.scheduledAt.toUtc().isBefore(schedule.archivedAt!)) {
          if (dose.status == DoseStatus.pending ||
              dose.status == DoseStatus.postponed ||
              dose.status == DoseStatus.paused) {
            deleteIds.add(dose.id);
          }
        }
      }
    }
  }

  for (final dose in existing) {
    if (generatedIds.contains(dose.id) || deleteIds.contains(dose.id)) {
      continue;
    }
    if (_userLocked(dose)) {
      continue;
    }
    final removedFromFuture = dose.scheduledAt.toUtc().isAfter(now) &&
        (dose.status == DoseStatus.pending ||
            dose.status == DoseStatus.postponed ||
            dose.status == DoseStatus.paused);
    if (removedFromFuture) {
      deleteIds.add(dose.id);
    }
  }

  return ReconcilePlan(writes: writes, deleteIds: deleteIds);
}

StoredDose _freshDose(
  PlannedOccurrence occurrence,
  List<PauseSpan> pauses,
  DateTime now,
  Duration dueGrace,
) {
  final paused = pauses.any((span) => span.covers(occurrence.scheduledAt));
  late final DoseStatus status;
  late final StatusSource source;
  if (paused) {
    status = DoseStatus.paused;
    source = StatusSource.system;
  } else if (now.difference(occurrence.scheduledAt) > dueGrace) {
    status = DoseStatus.missed;
    source = StatusSource.system;
  } else {
    status = DoseStatus.pending;
    source = StatusSource.none;
  }
  return StoredDose(
    id: occurrence.id,
    medicineId: occurrence.medicineId,
    localDate: occurrence.localDate,
    minutesFromMidnight: occurrence.minutesFromMidnight,
    scheduledAt: occurrence.scheduledAt,
    status: status,
    source: source,
    postponeUntil: null,
    supplyApplied: false,
  );
}

StoredDose _advance({
  required StoredDose current,
  required DateTime scheduledAt,
  required List<PauseSpan> pauses,
  required DateTime now,
  required Duration dueGrace,
}) {
  final paused = pauses.any((span) => span.covers(scheduledAt));
  if (paused) {
    return current.copyWith(
      scheduledAt: scheduledAt,
      status: DoseStatus.paused,
      source: StatusSource.system,
    );
  }

  if (current.status == DoseStatus.postponed) {
    final until = current.postponeUntil ?? scheduledAt;
    if (now.difference(until) > dueGrace) {
      return current.copyWith(
        scheduledAt: scheduledAt,
        status: DoseStatus.missed,
        source: StatusSource.system,
      );
    }
    return current.copyWith(scheduledAt: scheduledAt);
  }

  final expired = now.difference(scheduledAt) > dueGrace;
  if (expired) {
    return current.copyWith(
      scheduledAt: scheduledAt,
      status: DoseStatus.missed,
      source: StatusSource.system,
    );
  }

  return current.copyWith(
    scheduledAt: scheduledAt,
    status: DoseStatus.pending,
    source: StatusSource.none,
    clearPostpone: true,
  );
}

bool _sameMutable(StoredDose left, StoredDose right) {
  return left.scheduledAt.toUtc() == right.scheduledAt.toUtc() &&
      left.status == right.status &&
      left.source == right.source &&
      left.postponeUntil?.toUtc() == right.postponeUntil?.toUtc();
}

DateTime _laterDate(DateTime left, DateTime right) {
  return left.isAfter(right) ? left : right;
}
