import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/onboarding/onboarding_page.dart';
import '../features/history/history_page.dart';
import '../features/medicines/medicine_form_page.dart';
import '../features/medicines/medicines_page.dart';
import '../features/settings/help_page.dart';
import '../features/settings/privacy_page.dart';
import '../features/settings/settings_page.dart';
import '../features/today/today_page.dart';
import '../shared/shell/app_shell.dart';
import 'providers.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(preferencesProvider, (_, _) => refresh.value++);
  ref.onDispose(refresh.dispose);
  final rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  return GoRouter(
    navigatorKey: rootKey,
    initialLocation: '/today',
    refreshListenable: refresh,
    redirect: (context, state) {
      final prefs = ref.read(preferencesProvider);
      final path = state.matchedLocation;
      if (prefs.isLoading) {
        return path == '/splash' ? null : '/splash';
      }
      if (prefs.hasError) {
        return path == '/splash' ? null : '/splash';
      }
      final onboarded = prefs.requireValue.onboardingComplete;
      final atGate = path == '/onboarding' || path == '/splash';
      if (!onboarded && path != '/onboarding') {
        return '/onboarding';
      }
      if (onboarded && atGate) {
        return '/today';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const _SplashPage()),
      GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [GoRoute(path: '/today', builder: (context, state) => const TodayPage())]),
          StatefulShellBranch(routes: [GoRoute(path: '/medicines', builder: (context, state) => const MedicinesPage())]),
          StatefulShellBranch(routes: [GoRoute(path: '/history', builder: (context, state) => const HistoryPage())]),
          StatefulShellBranch(routes: [GoRoute(path: '/settings', builder: (context, state) => const SettingsPage())]),
        ],
      ),
      GoRoute(path: '/medicines/new', builder: (context, state) => const MedicineFormPage()),
      GoRoute(
        path: '/medicines/:id',
        builder: (context, state) => MedicineDetailPage(id: state.pathParameters['id']!),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (context, state) => MedicineFormPage(id: state.pathParameters['id']),
          ),
        ],
      ),
      GoRoute(path: '/settings/privacy', builder: (context, state) => const PrivacyPage()),
      GoRoute(path: '/settings/help', builder: (context, state) => const HelpPage()),
    ],
  );
});

class _SplashPage extends StatelessWidget {
  const _SplashPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset('assets/branding/app_icon.png', width: 88, height: 88),
            ),
            const SizedBox(height: 20),
            Text('CuraLuma', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
