import 'package:cura_luma/core/dose_policy.dart';
import 'package:cura_luma/features/scheduling/dose_status.dart';
import 'package:cura_luma/features/scheduling/reconciler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(tzdata.initializeTimeZones);

  const medicineId = 'med';
  final revised = DateTime.utc(2026, 6, 1);

  ScheduleDefinition schedule({
    List<int> times = const [8 * 60],
    bool backfill = false,
    List<PauseSpan> pauses = const [],
    DateTime? archivedAt,
  }) {
    return ScheduleDefinition(
      medicineId: medicineId,
      startDate: DateTime(2026, 6, 1),
      endDate: null,
      weekdayMask: 0x7f,
      times: times,
      scheduleRevisedAt: revised,
      archivedAt: archivedAt,
      pauses: pauses,
      backfillFromStart: backfill,
    );
  }

  StoredDose stored({
    required String localDate,
    required int minutes,
    required DateTime scheduledAt,
    DoseStatus status = DoseStatus.pending,
    StatusSource source = StatusSource.none,
  }) {
    return StoredDose(
      id: '$medicineId|$localDate|$minutes',
      medicineId: medicineId,
      localDate: localDate,
      minutesFromMidnight: minutes,
      scheduledAt: scheduledAt,
      status: status,
      source: source,
      postponeUntil: null,
      supplyApplied: false,
    );
  }

  test('keeps a user-recorded dose when the time zone changes', () {
    final taken = stored(
      localDate: '2026-06-15',
      minutes: 8 * 60,
      scheduledAt: DateTime.utc(2026, 6, 15, 12),
      status: DoseStatus.taken,
      source: StatusSource.user,
    );
    final plan = reconcileSchedules(
      schedules: [schedule()],
      existing: [taken],
      nowUtc: DateTime.utc(2026, 6, 15, 13),
      location: tz.getLocation('America/New_York'),
    );

    expect(plan.writes.where((write) => write.dose.id == taken.id), isEmpty);
    expect(plan.deleteIds, isNot(contains(taken.id)));
  });

  test('a system miss returns to pending when the clock moves backward', () {
    final missed = stored(
      localDate: '2026-06-15',
      minutes: 8 * 60,
      scheduledAt: DateTime.utc(2026, 6, 15, 8),
      status: DoseStatus.missed,
      source: StatusSource.system,
    );
    final plan = reconcileSchedules(
      schedules: [schedule()],
      existing: [missed],
      nowUtc: DateTime.utc(2026, 6, 15, 8, 30),
      location: tz.UTC,
      dueGrace: DosePolicy.dueGrace,
    );
    final update = plan.writes.singleWhere((write) => write.dose.id == missed.id);

    expect(update.dose.status, DoseStatus.pending);
  });

  test('a user-marked miss stays missed when the clock moves backward', () {
    final missed = stored(
      localDate: '2026-06-15',
      minutes: 8 * 60,
      scheduledAt: DateTime.utc(2026, 6, 15, 8),
      status: DoseStatus.missed,
      source: StatusSource.user,
    );
    final plan = reconcileSchedules(
      schedules: [schedule()],
      existing: [missed],
      nowUtc: DateTime.utc(2026, 6, 15, 7),
      location: tz.UTC,
    );

    expect(plan.writes.where((write) => write.dose.id == missed.id), isEmpty);
  });

  test('removing a future time deletes only that pending dose', () {
    final keep = stored(
      localDate: '2026-06-16',
      minutes: 8 * 60,
      scheduledAt: DateTime.utc(2026, 6, 16, 8),
    );
    final drop = stored(
      localDate: '2026-06-16',
      minutes: 20 * 60,
      scheduledAt: DateTime.utc(2026, 6, 16, 20),
    );
    final past = stored(
      localDate: '2026-06-14',
      minutes: 20 * 60,
      scheduledAt: DateTime.utc(2026, 6, 14, 20),
      status: DoseStatus.taken,
      source: StatusSource.user,
    );
    final plan = reconcileSchedules(
      schedules: [schedule(times: const [8 * 60])],
      existing: [keep, drop, past],
      nowUtc: DateTime.utc(2026, 6, 15, 12),
      location: tz.UTC,
    );

    expect(plan.deleteIds, contains(drop.id));
    expect(plan.deleteIds, isNot(contains(keep.id)));
    expect(plan.deleteIds, isNot(contains(past.id)));
  });

  test('a pause is not turned into a miss', () {
    final plan = reconcileSchedules(
      schedules: [
        schedule(
          backfill: true,
          pauses: [PauseSpan(startedAt: DateTime.utc(2026, 6, 14), endedAt: DateTime.utc(2026, 6, 16))],
        ),
      ],
      existing: const [],
      nowUtc: DateTime.utc(2026, 6, 15, 12),
      location: tz.UTC,
      lookback: const Duration(days: 3),
      horizon: const Duration(days: 1),
    );
    final paused = plan.writes.where((write) => write.dose.localDate == '2026-06-15');

    expect(paused, isNotEmpty);
    expect(paused.every((write) => write.dose.status == DoseStatus.paused), isTrue);
  });

  test('editing the schedule does not invent missed history for a new time', () {
    final now = DateTime.utc(2026, 6, 15, 22);
    final plan = reconcileSchedules(
      schedules: [
        ScheduleDefinition(
          medicineId: medicineId,
          startDate: DateTime(2026, 6, 1),
          endDate: null,
          weekdayMask: 0x7f,
          times: const [21 * 60],
          scheduleRevisedAt: now,
          archivedAt: null,
          pauses: const [],
          backfillFromStart: false,
        ),
      ],
      existing: const [],
      nowUtc: now,
      location: tz.UTC,
      horizon: const Duration(days: 1),
    );

    expect(plan.writes.where((write) => write.dose.localDate == '2026-06-15'), isEmpty);
    expect(plan.writes.any((write) => write.dose.localDate == '2026-06-16'), isTrue);
  });
}
