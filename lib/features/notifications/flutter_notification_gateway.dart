import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import 'notification_gateway.dart';
import 'notification_planner.dart';

class FlutterNotificationGateway implements NotificationGateway {
  FlutterNotificationGateway({FlutterLocalNotificationsPlugin? plugin})
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  void Function(NotificationResponseData response)? _onResponse;

  @override
  Future<void> initialize({
    required void Function(NotificationResponseData response) onResponse,
  }) async {
    _onResponse = onResponse;
    const android = AndroidInitializationSettings('@drawable/ic_notification');
    const settings = InitializationSettings(android: android);
    await _plugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (response) {
        _onResponse?.call(
          NotificationResponseData(
            actionId: response.actionId,
            payload: response.payload,
          ),
        );
      },
    );
  }

  @override
  Future<NotificationResponseData?> launchResponse() async {
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (details == null || !details.didNotificationLaunchApp) {
      return null;
    }
    final response = details.notificationResponse;
    if (response == null) {
      return null;
    }
    return NotificationResponseData(
      actionId: response.actionId,
      payload: response.payload,
    );
  }

  @override
  Future<bool> requestNotificationsPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    final granted = await android?.requestNotificationsPermission();
    return granted ?? false;
  }

  @override
  Future<bool> canScheduleExactNotifications() async {
    final android = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    final allowed = await android?.canScheduleExactNotifications();
    return allowed ?? false;
  }

  @override
  Future<void> requestExactAlarmsPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await android?.requestExactAlarmsPermission();
  }

  @override
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  @override
  Future<void> replaceScheduled(
    List<PlannedNotification> planned, {
    required bool exact,
  }) async {
    await _plugin.cancelAllPendingNotifications();
    final mode = exact
        ? AndroidScheduleMode.exactAllowWhileIdle
        : AndroidScheduleMode.inexactAllowWhileIdle;
    for (final item in planned) {
      final details = NotificationDetails(
        android: AndroidNotificationDetails(
          item.channelId,
          item.channelName,
          channelDescription: item.channelDescription,
          importance: item.highPriority ? Importance.high : Importance.defaultImportance,
          priority: item.highPriority ? Priority.high : Priority.defaultPriority,
          category: AndroidNotificationCategory.reminder,
          actions: [
            for (final action in item.actions)
              AndroidNotificationAction(
                action.id,
                action.title,
                showsUserInterface: true,
                cancelNotification: true,
              ),
          ],
        ),
      );
      final when = tz.TZDateTime.from(item.when.toUtc(), tz.UTC);
      try {
        await _plugin.zonedSchedule(
          id: item.id,
          title: item.title,
          body: item.body,
          scheduledDate: when,
          notificationDetails: details,
          androidScheduleMode: mode,
          payload: _payload(item),
        );
      } catch (_) {
        if (!exact) {
          rethrow;
        }
        await _plugin.zonedSchedule(
          id: item.id,
          title: item.title,
          body: item.body,
          scheduledDate: when,
          notificationDetails: details,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          payload: _payload(item),
        );
      }
    }
  }

  String _payload(PlannedNotification item) {
    if (item.actions.isEmpty) {
      return item.payload;
    }
    return item.payload;
  }
}
