import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/common.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _controller = PageController();
  int _index = 0;
  String? _language;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: MaxWidth(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Row(
                  children: [
                    Text(l10n.onboardingStep(_index + 1, 3), style: theme.textTheme.labelLarge),
                    const Spacer(),
                    Text(l10n.appTitle, style: theme.textTheme.titleMedium),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (value) => setState(() => _index = value),
                  children: [
                    _Welcome(l10n: l10n),
                    _Notifications(l10n: l10n),
                    _Language(
                      l10n: l10n,
                      selected: _language,
                      onSelected: (value) async {
                        setState(() => _language = value);
                        final current = ref.read(preferencesProvider).requireValue;
                        await ref.read(preferencesProvider.notifier).save(
                          AppPreferences(
                            onboardingComplete: current.onboardingComplete,
                            localeCode: value,
                            themeMode: current.themeMode,
                            notificationsEnabled: current.notificationsEnabled,
                            postponeMinutes: current.postponeMinutes,
                            lastTimezone: current.lastTimezone,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Row(
                  children: [
                    if (_index > 0)
                      TextButton(
                        onPressed: () => _controller.previousPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                        ),
                        child: Text(l10n.actionBack),
                      ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () => _advance(l10n),
                      child: Text(_index == 2 ? l10n.actionStart : l10n.actionContinue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _advance(AppLocalizations l10n) async {
    if (_index == 1) {
      await ref.read(notificationGatewayProvider).requestNotificationsPermission();
    }
    if (_index < 2) {
      await _controller.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
      return;
    }
    final current = ref.read(preferencesProvider).requireValue;
    await ref.read(preferencesProvider.notifier).save(
      AppPreferences(
        onboardingComplete: true,
        localeCode: _language,
        themeMode: current.themeMode,
        notificationsEnabled: current.notificationsEnabled,
        postponeMinutes: current.postponeMinutes,
        lastTimezone: current.lastTimezone,
      ),
      reschedule: true,
    );
    if (mounted) {
      context.go('/today');
    }
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Image.asset('assets/branding/app_icon.png', width: 96, height: 96),
        ),
        const SizedBox(height: 24),
        Text(l10n.onboardingWelcomeTitle, style: theme.textTheme.headlineMedium),
        const SizedBox(height: 12),
        Text(l10n.onboardingWelcomeBody, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text(l10n.onboardingDisclaimer, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}

class _Notifications extends StatelessWidget {
  const _Notifications({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Icon(Icons.notifications_none, size: 40, color: theme.colorScheme.primary),
        const SizedBox(height: 16),
        Text(l10n.onboardingNotificationsTitle, style: theme.textTheme.headlineMedium),
        const SizedBox(height: 12),
        Text(l10n.onboardingNotificationsBody, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text(l10n.onboardingNotificationsLimit, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}

class _Language extends StatelessWidget {
  const _Language({required this.l10n, required this.selected, required this.onSelected});

  final AppLocalizations l10n;
  final String? selected;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final options = <(String?, String)>[
      (null, l10n.languageSystem),
      ('en', l10n.languageEnglish),
      ('fr', l10n.languageFrench),
      ('ar', l10n.languageArabic),
    ];
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(l10n.onboardingLanguageTitle, style: theme.textTheme.headlineMedium),
        const SizedBox(height: 12),
        Text(l10n.onboardingLanguageBody, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 16),
        RadioGroup<String?>(
          groupValue: selected,
          onChanged: onSelected,
          child: Column(
            children: [
              for (final option in options)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: RadioListTile<String?>(
                    value: option.$1,
                    title: Text(option.$2, style: theme.textTheme.titleMedium),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    tileColor: theme.colorScheme.surfaceContainerLowest,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
