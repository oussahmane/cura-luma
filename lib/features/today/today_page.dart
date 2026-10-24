import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../app/providers.dart';
import '../../core/script_direction.dart';
import '../../features/scheduling/views.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/format.dart';
import '../../shared/widgets/common.dart';
import '../../shared/widgets/status_chip.dart';

class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final today = ref.watch(todayProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.todayHeading)),
      body: today.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => EmptyState(
          title: l10n.actionFailed,
          body: l10n.reliabilityBody,
          action: FilledButton(
            onPressed: () => ref.invalidate(todayProvider),
            child: Text(l10n.actionContinue),
          ),
        ),
        data: (view) => _TodayBody(view: view),
      ),
    );
  }
}

class _TodayBody extends ConsumerWidget {
  const _TodayBody({required this.view});

  final TodayView view;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = localeName(context);
    final zone = ref.watch(timezoneProvider);
    if (view.doses.isEmpty) {
      return EmptyState(
        title: l10n.todayEmptyTitle,
        body: l10n.todayEmptyBody,
        action: FilledButton(
          onPressed: () => context.push('/medicines/new'),
          child: Text(l10n.actionAddMedicine),
        ),
      );
    }
    return MaxWidth(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(formatDay(view.day, locale), style: theme.textTheme.bodyLarge),
          const SizedBox(height: 12),
          if (!view.notificationsEnabled)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.todayNotificationsOff, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () => context.go('/settings'),
                      child: Text(l10n.actionEnableNotifications),
                    ),
                  ],
                ),
              ),
            ),
          if (view.doses.any((dose) => dose.lowSupply))
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                l10n.lowSupplyBanner(view.doses.firstWhere((dose) => dose.lowSupply).name),
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
              ),
            ),
          const SizedBox(height: 16),
          SectionLabel(l10n.nextDoseTitle),
          if (view.next == null)
            Text(l10n.noNextDose, style: theme.textTheme.bodyLarge)
          else
            _DoseCard(dose: view.next!, locale: locale, zone: zone, emphasize: true),
          const SizedBox(height: 20),
          SectionLabel(l10n.scheduleHeading),
          Text(l10n.dueWindowExplain, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          for (final dose in view.doses) ...[
            _DoseCard(dose: dose, locale: locale, zone: zone),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _DoseCard extends ConsumerStatefulWidget {
  const _DoseCard({
    required this.dose,
    required this.locale,
    required this.zone,
    this.emphasize = false,
  });

  final TodayDoseView dose;
  final String locale;
  final tz.Location zone;
  final bool emphasize;

  @override
  ConsumerState<_DoseCard> createState() => _DoseCardState();
}

class _DoseCardState extends ConsumerState<_DoseCard> {
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final dose = widget.dose;
    final time = formatInstant(dose.effectiveAt, widget.locale, widget.zone);
    return Card(
      color: widget.emphasize ? theme.colorScheme.primaryContainer.withValues(alpha: 0.35) : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Color(dose.color),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(time, style: theme.textTheme.titleLarge),
                      Text(
                        dose.name,
                        textDirection: directionForText(dose.name),
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(l10n.doseLabel(dose.amount, dose.unit), style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
                StatusChip(display: dose.display),
              ],
            ),
            if (dose.canTake || dose.canSkip || dose.canPostpone) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (dose.canTake)
                    Semantics(
                      button: true,
                      label: l10n.semanticsTaken(dose.name),
                      child: FilledButton(
                        onPressed: _busy ? null : () => _act(ref.read(reminderServiceProvider).markTaken),
                        child: Text(l10n.actionTaken),
                      ),
                    ),
                  if (dose.canSkip)
                    Semantics(
                      button: true,
                      label: l10n.semanticsSkip(dose.name),
                      child: OutlinedButton(
                        onPressed: _busy ? null : () => _act(ref.read(reminderServiceProvider).markSkipped),
                        child: Text(l10n.actionSkip),
                      ),
                    ),
                  if (dose.canPostpone)
                    Semantics(
                      button: true,
                      label: l10n.semanticsPostpone(dose.name),
                      child: TextButton(
                        onPressed: _busy ? null : () => _act(ref.read(reminderServiceProvider).postpone),
                        child: Text(l10n.actionPostpone),
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _act(Future<RecordResult> Function(String id) action) async {
    setState(() => _busy = true);
    final result = await action(widget.dose.occurrenceId);
    if (!mounted) {
      return;
    }
    final l10n = AppLocalizations.of(context);
    final message = switch (result) {
      RecordResult.applied => l10n.doseRecorded,
      RecordResult.unchanged => l10n.alreadyRecorded,
      RecordResult.rejected => l10n.actionRejected,
      RecordResult.missing => l10n.actionFailed,
    };
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    ref.invalidate(todayProvider);
    setState(() => _busy = false);
  }
}
