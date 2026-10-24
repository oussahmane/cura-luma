import 'package:cura_luma/features/backup/backup_codec.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, Object?> medicine() {
    return {
      'id': 'med',
      'name': 'Vitamin D',
      'doseAmount': '1',
      'doseUnit': 'tablet',
      'form': 'tablet',
      'notes': '',
      'instructions': '',
      'startDate': '2026-06-15',
      'endDate': null,
      'weekdayMask': 127,
      'color': 0xFF1F6B4A,
      'photoPath': null,
      'supplyQuantity': 10,
      'refillThreshold': 2,
      'refillAlertActive': false,
      'scheduleRevisedAt': '2026-06-15T08:00:00.000Z',
      'archivedAt': null,
      'createdAt': '2026-06-15T08:00:00.000Z',
      'updatedAt': '2026-06-15T08:00:00.000Z',
    };
  }

  test('accepts a valid bundle and rejects a bad schema or id', () {
    final bundle = BackupBundle(
      exportedAt: '2026-06-15T08:00:00.000Z',
      preferences: {
        'onboardingComplete': true,
        'localeCode': 'en',
        'themeMode': 'system',
        'notificationsEnabled': true,
        'postponeMinutes': 15,
        'lastTimezone': 'UTC',
      },
      medicines: [medicine()],
      slots: [
        {'id': 'slot', 'medicineId': 'med', 'minutesFromMidnight': 480},
      ],
      pauses: const [],
      occurrences: [
        {
          'id': 'med|2026-06-15|480',
          'medicineId': 'med',
          'localDate': '2026-06-15',
          'minutesFromMidnight': 480,
          'scheduledAt': '2026-06-15T08:00:00.000Z',
          'status': 'taken',
          'statusSource': 'user',
          'recordedAt': '2026-06-15T08:05:00.000Z',
          'postponeUntil': null,
          'supplyApplied': true,
        },
      ],
      photos: const [],
    );

    final decoded = decodeBackup(bundle.encode());
    expect(decoded.medicines.single['name'], 'Vitamin D');
    expect(decoded.occurrences.single['status'], 'taken');

    expect(() => decodeBackup('{"schemaVersion": 2}'), throwsA(isA<BackupException>()));
    final broken = bundle.encode().replaceAll('med|2026-06-15|480', 'other');
    expect(() => decodeBackup(broken), throwsA(isA<BackupException>()));
  });
}
