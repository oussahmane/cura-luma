import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import 'app/cura_app.dart';
import 'app/providers.dart';
import 'core/time_zone.dart';
import 'features/notifications/flutter_notification_gateway.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tzdata.initializeTimeZones();
  try {
    final info = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(locationFor(info.identifier));
  } catch (_) {
    tz.setLocalLocation(tz.UTC);
  }

  final gateway = FlutterNotificationGateway();
  final container = ProviderContainer(
    overrides: [notificationGatewayProvider.overrideWithValue(gateway)],
  );
  await gateway.initialize(
    onResponse: (response) async {
      await container.read(reminderServiceProvider).handleNotification(response);
      container.invalidate(todayProvider);
    },
  );

  runApp(UncontrolledProviderScope(container: container, child: const CuraApp()));
}
