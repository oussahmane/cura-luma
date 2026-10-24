import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;

import '../database/app_database.dart';
import '../features/notifications/flutter_notification_gateway.dart';
import '../features/notifications/notification_gateway.dart';
import '../features/scheduling/reminder_service.dart';
import '../features/scheduling/views.dart';
import '../l10n/app_localizations.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final notificationGatewayProvider = Provider<NotificationGateway>((ref) {
  return FlutterNotificationGateway();
});

final clockProvider = Provider<DateTime Function()>((ref) => DateTime.now);

class TimezoneController extends Notifier<tz.Location> {
  @override
  tz.Location build() => tz.local;

  void update(tz.Location location) {
    tz.setLocalLocation(location);
    state = location;
  }
}

final timezoneProvider = NotifierProvider<TimezoneController, tz.Location>(TimezoneController.new);

class AppPreferences {
  const AppPreferences({
    required this.onboardingComplete,
    required this.localeCode,
    required this.themeMode,
    required this.notificationsEnabled,
    required this.postponeMinutes,
    required this.lastTimezone,
  });

  final bool onboardingComplete;
  final String? localeCode;
  final String themeMode;
  final bool notificationsEnabled;
  final int postponeMinutes;
  final String? lastTimezone;

  ThemeMode get flutterThemeMode {
    return switch (themeMode) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }
}

NotificationCopy notificationCopyFor(String? localeCode) {
  final requested = switch (localeCode) {
    'fr' => const Locale('fr'),
    'ar' => const Locale('ar'),
    'en' => const Locale('en'),
    _ => Locale(WidgetsBinding.instance.platformDispatcher.locale.languageCode),
  };
  final supported = lookupAppLocalizations(
    const {'en', 'fr', 'ar'}.contains(requested.languageCode) ? requested : const Locale('en'),
  );
  return NotificationCopy(
    reminderChannelName: supported.notificationChannelReminders,
    reminderChannelDescription: supported.notificationChannelRemindersDescription,
    refillChannelName: supported.notificationChannelRefills,
    refillChannelDescription: supported.notificationChannelRefillsDescription,
    reminderTitle: supported.notificationTitle,
    reminderBody: (name, dose) => supported.notificationBody(name, dose),
    takenLabel: supported.notificationActionTaken,
    skipLabel: supported.notificationActionSkip,
    refillTitle: supported.refillNotificationTitle,
    refillBody: (name, remaining) => supported.refillNotificationBody(name, remaining),
  );
}

final reminderServiceProvider = Provider<ReminderService>((ref) {
  return ReminderService(
    database: ref.watch(databaseProvider),
    gateway: ref.watch(notificationGatewayProvider),
    clock: ref.watch(clockProvider),
    location: () => ref.read(timezoneProvider),
    copy: notificationCopyFor,
  );
});

class PreferencesController extends AsyncNotifier<AppPreferences> {
  @override
  Future<AppPreferences> build() async {
    final row = await ref.watch(reminderServiceProvider).settings();
    return AppPreferences(
      onboardingComplete: row.onboardingComplete,
      localeCode: row.localeCode,
      themeMode: row.themeMode,
      notificationsEnabled: row.notificationsEnabled,
      postponeMinutes: row.postponeMinutes,
      lastTimezone: row.lastTimezone,
    );
  }

  Future<void> save(AppPreferences preferences, {bool reschedule = false}) async {
    final service = ref.read(reminderServiceProvider);
    await service.saveSettings(
      AppSettingsCompanion(
        onboardingComplete: Value(preferences.onboardingComplete),
        localeCode: Value(preferences.localeCode),
        themeMode: Value(preferences.themeMode),
        notificationsEnabled: Value(preferences.notificationsEnabled),
        postponeMinutes: Value(preferences.postponeMinutes),
        lastTimezone: Value(preferences.lastTimezone),
      ),
    );
    state = AsyncData(preferences);
    if (reschedule) {
      await service.reconcileAndSchedule();
    }
  }
}

final preferencesProvider = AsyncNotifierProvider<PreferencesController, AppPreferences>(
  PreferencesController.new,
);

final todayProvider = FutureProvider<TodayView>((ref) async {
  ref.watch(timezoneProvider);
  final service = ref.watch(reminderServiceProvider);
  await service.reconcileAndSchedule();
  return service.loadToday();
});

final medicinesProvider = FutureProvider<List<MedicineSummary>>((ref) async {
  ref.watch(todayProvider);
  return ref.watch(reminderServiceProvider).loadMedicines();
});

final medicineDetailsProvider = FutureProvider.family<MedicineDetails?, String>((ref, id) async {
  ref.watch(todayProvider);
  return ref.watch(reminderServiceProvider).loadMedicine(id);
});
