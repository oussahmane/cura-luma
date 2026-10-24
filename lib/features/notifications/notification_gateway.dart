import 'notification_planner.dart';

class NotificationResponseData {
  const NotificationResponseData({this.actionId, this.payload});

  final String? actionId;
  final String? payload;
}

abstract class NotificationGateway {
  Future<void> initialize({
    required void Function(NotificationResponseData response) onResponse,
  });

  Future<NotificationResponseData?> launchResponse();

  Future<bool> requestNotificationsPermission();

  Future<bool> canScheduleExactNotifications();

  Future<void> requestExactAlarmsPermission();

  Future<void> replaceScheduled(
    List<PlannedNotification> planned, {
    required bool exact,
  });

  Future<void> cancelAll();
}

class UnavailableNotificationGateway implements NotificationGateway {
  final List<List<PlannedNotification>> scheduled = [];
  bool exact = false;
  NotificationResponseData? pending;

  @override
  Future<void> cancelAll() async {
    scheduled.clear();
  }

  @override
  Future<bool> canScheduleExactNotifications() async => false;

  @override
  Future<void> initialize({
    required void Function(NotificationResponseData response) onResponse,
  }) async {}

  @override
  Future<NotificationResponseData?> launchResponse() async => pending;

  @override
  Future<void> replaceScheduled(
    List<PlannedNotification> planned, {
    required bool exact,
  }) async {
    this.exact = exact;
    scheduled
      ..clear()
      ..add(planned);
  }

  @override
  Future<void> requestExactAlarmsPermission() async {}

  @override
  Future<bool> requestNotificationsPermission() async => false;
}
