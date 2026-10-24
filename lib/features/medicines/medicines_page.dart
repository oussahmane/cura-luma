import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../core/script_direction.dart';
import '../../features/scheduling/views.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/format.dart';
import '../../shared/widgets/common.dart';

class MedicinesPage extends ConsumerWidget {
  const MedicinesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final medicines = ref.watch(medicinesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.medicinesHeading),
        actions: [
          IconButton(
            tooltip: l10n.actionAddMedicine,
            onPressed: () => context.push('/medicines/new'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: medicines.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => EmptyState(title: l10n.actionFailed, body: l10n.notMedicalShort),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              title: l10n.medicinesEmptyTitle,
              body: l10n.medicinesEmptyBody,
              action: FilledButton(
                onPressed: () => context.push('/medicines/new'),
                child: Text(l10n.actionAddMedicine),
              ),
            );
          }
          final active = items.where((item) => !item.archived).toList();
          final archived = items.where((item) => item.archived).toList();
          final locale = localeName(context);
          return MaxWidth(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              children: [
                if (active.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(l10n.medicinesEmptyTitle, style: Theme.of(context).textTheme.titleMedium),
                  ),
                for (final item in active) _MedicineTile(item: item, locale: locale),
                if (archived.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  SectionLabel(l10n.archivedHeading),
                  for (final item in archived) _MedicineTile(item: item, locale: locale),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MedicineTile extends StatelessWidget {
  const _MedicineTile({required this.item, required this.locale});

  final MedicineSummary item;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final times = item.times.map((int minutes) => formatClock(minutes, locale)).join(' · ');
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(backgroundColor: Color(item.color), radius: 16),
          title: Text(item.name, textDirection: directionForText(item.name)),
          subtitle: Text('${l10n.doseLabel(item.amount, item.unit)}\n$times'),
          isThreeLine: true,
          trailing: item.lowSupply ? Icon(Icons.inventory_2_outlined, color: theme.colorScheme.error) : null,
          onTap: () => context.push('/medicines/${item.id}'),
        ),
      ),
    );
  }
}
