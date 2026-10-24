import '../../core/dose_policy.dart';
import '../../core/ids.dart';
import '../scheduling/dose_status.dart';

class ReminderCandidate {
  const ReminderCandidate({
    required this.occurrenceId,
    required this.when,
    required this.title,
    required this.body,
    required this.status,
  });

  final String occurrenceId;
  final DateTime when;
  final String title;
  final String body;
  final DoseStatus status;
}

class RefillCandidate {
  const RefillCandidate({
    required this.medicineId,
    required this.title,
    required this.body,
  });

  final String medicineId;
  final String title;
  final String body;
}

class PlannedNotification {
  const PlannedNotification({
    required this.id,
    required this.when,
    required this.title,
    required this.body,
    required this.payload,
    required this.channelId,
    required this.channelName,
    required this.channelDescription,
    required this.actions,
    required this.highPriority,
  });

  final int id;
  final DateTime when;
  final String title;
  final String body;
  final String payload;
  final String channelId;
  final String channelName;
  final String channelDescription;
  final List<({String id, String title})> actions;
  final bool highPriority;
}

class NotificationPlan {
  const NotificationPlan({required this.notifications});

  final List<PlannedNotification> notifications;
}

/// Selects a bounded set of future reminders.
///
/// Only pending and postponed doses inside the horizon are scheduled.
/// Taken, skipped, missed, and paused doses are omitted. The result is capped
/// so the app does not register an unbounded alarm list.
NotificationPlan planNotifications({
  required List<ReminderCandidate> reminders,
  required List<RefillCandidate> refills,
  required DateTime now,
  required String reminderChannelName,
  required String reminderChannelDescription,
  required String refillChannelName,
  required String refillChannelDescription,
  required String takenLabel,
  required String skipLabel,
  Duration horizon = DosePolicy.scheduleHorizon,
  int limit = DosePolicy.maxScheduledNotifications,
}) {
  final start = now.toUtc();
  final end = start.add(horizon);
  final upcoming = reminders.where((candidate) {
    if (candidate.status != DoseStatus.pending && candidate.status != DoseStatus.postponed) {
      return false;
    }
    final when = candidate.when.toUtc();
    return when.isAfter(start) && when.isBefore(end);
  }).toList()
    ..sort((a, b) => a.when.compareTo(b.when));

  final selected = upcoming.take(limit);
  final usedIds = <int>{};
  final planned = <PlannedNotification>[];

  for (final candidate in selected) {
    planned.add(
      PlannedNotification(
        id: _uniqueId(notificationIdFor(candidate.occurrenceId), usedIds),
        when: candidate.when.toUtc(),
        title: candidate.title,
        body: candidate.body,
        payload: 'open:${candidate.occurrenceId}',
        channelId: 'curaluma.reminders',
        channelName: reminderChannelName,
        channelDescription: reminderChannelDescription,
        actions: [
          (id: 'taken', title: takenLabel),
          (id: 'skipped', title: skipLabel),
        ],
        highPriority: true,
      ),
    );
  }

  final refillWhen = start.add(const Duration(seconds: 5));
  for (final refill in refills) {
    planned.add(
      PlannedNotification(
        id: _uniqueId(notificationIdFor('refill:${refill.medicineId}'), usedIds),
        when: refillWhen,
        title: refill.title,
        body: refill.body,
        payload: 'refill:${refill.medicineId}',
        channelId: 'curaluma.refills',
        channelName: refillChannelName,
        channelDescription: refillChannelDescription,
        actions: const [],
        highPriority: false,
      ),
    );
  }

  return NotificationPlan(notifications: planned);
}

int _uniqueId(int preferred, Set<int> used) {
  var id = preferred;
  while (used.contains(id)) {
    id = id == 0x7fffffff ? 1 : id + 1;
  }
  used.add(id);
  return id;
}
