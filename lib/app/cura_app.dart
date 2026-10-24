import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

import '../core/time_zone.dart';
import '../l10n/app_localizations.dart';
import 'providers.dart';
import 'router.dart';
import 'theme.dart';

class CuraApp extends ConsumerStatefulWidget {
  const CuraApp({super.key});

  @override
  ConsumerState<CuraApp> createState() => _CuraAppState();
}

class _CuraAppState extends ConsumerState<CuraApp> with WidgetsBindingObserver {
  var _handledLaunch = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleLaunch());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshTimezone();
    }
  }

  Future<void> _refreshTimezone() async {
    try {
      final info = await FlutterTimezone.getLocalTimezone();
      final location = locationFor(info.identifier);
      ref.read(timezoneProvider.notifier).update(location);
    } catch (_) {
      // Keep the last known location. Reminders still reconcile on resume.
    }
    ref.invalidate(todayProvider);
  }

  Future<void> _handleLaunch() async {
    if (_handledLaunch) {
      return;
    }
    _handledLaunch = true;
    final response = await ref.read(notificationGatewayProvider).launchResponse();
    if (response == null) {
      return;
    }
    await ref.read(reminderServiceProvider).handleNotification(response);
    ref.invalidate(todayProvider);
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final prefs = ref.watch(preferencesProvider);
    final themeMode = prefs.asData?.value.flutterThemeMode ?? ThemeMode.system;
    final code = prefs.asData?.value.localeCode;
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      routerConfig: router,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: themeMode,
      locale: code == null ? null : Locale(code),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: (locale, supported) {
        if (code != null) {
          return Locale(code);
        }
        for (final item in supported) {
          if (item.languageCode == locale?.languageCode) {
            return item;
          }
        }
        return const Locale('en');
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
