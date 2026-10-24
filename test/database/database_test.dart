import 'dart:io';

import 'package:cura_luma/database/app_database.dart';
import 'package:cura_luma/features/medicines/medicine_draft.dart';
import 'package:cura_luma/features/notifications/notification_gateway.dart';
import 'package:cura_luma/features/scheduling/reminder_service.dart';
import 'package:cura_luma/features/scheduling/views.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(tzdata.initializeTimeZones);

  test('persists a medicine across a reopened database and cascades delete', () async {
    final file = File('${Directory.systemTemp.path}/curaluma_${DateTime.now().microsecondsSinceEpoch}.sqlite');
    final first = AppDatabase(NativeDatabase(file));
    await first.into(first.medicines).insert(
      MedicinesCompanion.insert(
        id: 'med',
        name: 'Vitamin D',
        doseAmount: '1',
        doseUnit: 'tablet',
        form: 'tablet',
        startDate: '2026-06-15',
        weekdayMask: 127,
        color: 1,
        scheduleRevisedAt: DateTime.utc(2026, 6, 15),
        createdAt: DateTime.utc(2026, 6, 15),
        updatedAt: DateTime.utc(2026, 6, 15),
      ),
    );
    await first.into(first.scheduleSlots).insert(
      ScheduleSlotsCompanion.insert(id: 'slot', medicineId: 'med', minutesFromMidnight: 480),
    );
    await first.close();

    final second = AppDatabase(NativeDatabase(file));
    final version = await second.customSelect('PRAGMA user_version').getSingle();
    expect(version.data.values.single, 1);
    expect(await second.select(second.medicines).get(), hasLength(1));
    await (second.delete(second.medicines)..where((row) => row.id.equals('med'))).go();
    expect(await second.select(second.scheduleSlots).get(), isEmpty);
    await second.close();
    if (file.existsSync()) {
      file.deleteSync();
    }
  });

  test('a failed transaction does not leave a medicine behind', () async {
    final database = AppDatabase(NativeDatabase.memory());
    try {
      await database.transaction(() async {
        await database.into(database.medicines).insert(
          MedicinesCompanion.insert(
            id: 'med',
            name: 'Vitamin D',
            doseAmount: '1',
            doseUnit: 'tablet',
            form: 'tablet',
            startDate: '2026-06-15',
            weekdayMask: 127,
            color: 1,
            scheduleRevisedAt: DateTime.utc(2026, 6, 15),
            createdAt: DateTime.utc(2026, 6, 15),
            updatedAt: DateTime.utc(2026, 6, 15),
          ),
        );
        throw StateError('fail');
      });
    } on StateError {
      // Expected.
    }

    expect(await database.select(database.medicines).get(), isEmpty);
    await database.close();
  });

  test('recording a dose once decrements supply and a repeat does not', () async {
    final database = AppDatabase(NativeDatabase.memory());
    final gateway = UnavailableNotificationGateway();
    final now = DateTime.utc(2026, 6, 15, 7);
    final service = ReminderService(
      database: database,
      gateway: gateway,
      clock: () => now,
      location: () => tz.UTC,
      copy: (_) => const NotificationCopy(
        reminderChannelName: 'Reminders',
        reminderChannelDescription: 'Times you saved',
        refillChannelName: 'Supply',
        refillChannelDescription: 'Threshold',
        reminderTitle: 'Medication reminder',
        reminderBody: _body,
        takenLabel: 'Taken',
        skipLabel: 'Skip',
        refillTitle: 'Supply',
        refillBody: _refill,
      ),
    );

    final error = await service.saveMedicine(
      MedicineDraft(
        name: 'Vitamin D',
        doseAmount: '1',
        doseUnit: 'tablet',
        form: 'tablet',
        notes: '',
        instructions: '',
        startDate: DateTime(2026, 6, 15),
        endDate: null,
        weekdayMask: 127,
        times: const [8 * 60],
        color: 1,
        photoBytes: null,
        removePhoto: false,
        supplyQuantity: 10,
        refillThreshold: 2,
      ),
    );
    expect(error, isNull);

    final today = await service.loadToday();
    expect(today.doses, hasLength(1));
    final id = today.doses.single.occurrenceId;
    expect(await service.markTaken(id), RecordResult.applied);
    expect(await service.markTaken(id), RecordResult.unchanged);
    final medicine = await service.loadMedicine(today.doses.single.medicineId);
    expect(medicine!.supply, 9);
    expect(await database.select(database.doseOccurrences).get(), hasLength(greaterThan(0)));
    final recorded = await (database.select(database.doseOccurrences)..where((row) => row.id.equals(id))).getSingle();
    expect(recorded.status, 'taken');
    expect(recorded.supplyApplied, isTrue);
    expect(gateway.scheduled, isNotEmpty);
    await database.close();
  });
}

String _body(String name, String dose) => '$name $dose';

String _refill(String name, String remaining) => '$name $remaining';
