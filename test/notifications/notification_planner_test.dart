import 'package:cura_luma/features/notifications/notification_planner.dart';
import 'package:cura_luma/features/scheduling/dose_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime.utc(2026, 6, 15, 8);

  ReminderCandidate reminder(String id, DateTime when, DoseStatus status) {
    return ReminderCandidate(
      occurrenceId: id,
      when: when,
      title: 'Medication reminder',
      body: 'Name',
      status: status,
    );
  }

  test('schedules only future actionable doses inside the cap', () {
    final reminders = [
      for (var index = 0; index < 70; index++)
        reminder('dose-$index', now.add(Duration(hours: index + 1)), DoseStatus.pending),
      reminder('taken', now.add(const Duration(hours: 2)), DoseStatus.taken),
      reminder('past', now.subtract(const Duration(minutes: 5)), DoseStatus.pending),
      reminder('paused', now.add(const Duration(hours: 3)), DoseStatus.paused),
    ];

    final plan = planNotifications(
      reminders: reminders,
      refills: const [],
      now: now,
      reminderChannelName: 'Reminders',
      reminderChannelDescription: 'Saved times',
      refillChannelName: 'Supply',
      refillChannelDescription: 'Threshold',
      takenLabel: 'Taken',
      skipLabel: 'Skip',
      horizon: const Duration(days: 30),
      limit: 64,
    );

    expect(plan.notifications, hasLength(64));
    expect(plan.notifications.every((item) => item.when.isAfter(now)), isTrue);
    expect(plan.notifications.map((item) => item.id).toSet(), hasLength(64));
    expect(plan.notifications.first.actions.map((action) => action.id), ['taken', 'skipped']);
  });

  test('includes a supply notice without dropping the dose id space', () {
    final plan = planNotifications(
      reminders: [reminder('dose', now.add(const Duration(hours: 1)), DoseStatus.pending)],
      refills: const [
        RefillCandidate(medicineId: 'med', title: 'Supply', body: 'Low'),
      ],
      now: now,
      reminderChannelName: 'Reminders',
      reminderChannelDescription: 'Saved times',
      refillChannelName: 'Supply',
      refillChannelDescription: 'Threshold',
      takenLabel: 'Taken',
      skipLabel: 'Skip',
    );

    expect(plan.notifications, hasLength(2));
    expect(plan.notifications.last.channelId, 'curaluma.refills');
    expect(plan.notifications.last.actions, isEmpty);
  });
}
