import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../core/script_direction.dart';
import '../../features/scheduling/views.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/format.dart';
import '../../shared/widgets/common.dart';
import '../../shared/widgets/status_chip.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  String? _medicineId;
  late DateTime _from;
  late DateTime _to;
  HistoryView? _view;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    _to = DateTime(today.year, today.month, today.day);
    _from = _to.subtract(const Duration(days: 30));
    Future.microtask(_load);
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final view = await ref.read(reminderServiceProvider).loadHistory(
      medicineId: _medicineId,
      from: _from,
      to: _to,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _view = view;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(todayProvider, (previous, next) {
      if (next.hasValue && previous?.asData?.value != next.asData?.value) {
        Future<void>.microtask(_load);
      }
    });
    final l10n = AppLocalizations.of(context);
    final locale = localeName(context);
    final zone = ref.watch(timezoneProvider);
    final view = _view;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.historyHeading)),
      body: _loading || view == null
          ? const Center(child: CircularProgressIndicator())
          : MaxWidth(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  Row(
                    children: [
                      Expanded(child: _SummaryCard(title: l10n.summaryWeek, summary: view.week)),
                      const SizedBox(width: 12),
                      Expanded(child: _SummaryCard(title: l10n.summaryMonth, summary: view.month)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.adherenceExplanation, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String?>(
                    initialValue: _medicineId,
                    decoration: InputDecoration(labelText: l10n.filterMedicine),
                    items: [
                      DropdownMenuItem(value: null, child: Text(l10n.filterAllMedicines)),
                      for (final medicine in view.medicines)
                        DropdownMenuItem(
                          value: medicine.id,
                          child: Text(medicine.name, textDirection: directionForText(medicine.name)),
                        ),
                    ],
                    onChanged: (value) {
                      _medicineId = value;
                      _load();
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _DateButton(label: l10n.filterFrom, date: _from, locale: locale, onPick: (date) {
                        setState(() => _from = date);
                        _load();
                      })),
                      const SizedBox(width: 12),
                      Expanded(child: _DateButton(label: l10n.filterTo, date: _to, locale: locale, onPick: (date) {
                        setState(() => _to = date);
                        _load();
                      })),
                    ],
                  ),
                  if (_from.isAfter(_to))
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(l10n.validationEndDate, style: TextStyle(color: Theme.of(context).colorScheme.error)),
                    ),
                  const SizedBox(height: 16),
                  if (view.entries.isEmpty)
                    EmptyState(title: l10n.historyEmptyTitle, body: l10n.historyEmptyBody)
                  else
                    for (final entry in view.entries)
                      Card(
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: Color(entry.color), radius: 12),
                          title: Text(entry.name, textDirection: directionForText(entry.name)),
                          subtitle: Text(
                            '${formatShortDay(entry.scheduledAt.toLocal(), locale)} · ${formatInstant(entry.scheduledAt, locale, zone)}\n${l10n.doseLabel(entry.amount, entry.unit)}',
                          ),
                          isThreeLine: true,
                          trailing: StatusChip(display: entry.display),
                        ),
                      ),
                ],
              ),
            ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.title, required this.summary});

  final String title;
  final AdherenceSummary summary;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final percent = summary.percent == null ? l10n.adherenceEmpty : l10n.adherenceValue((summary.percent! * 100).round().toString());
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(percent, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(l10n.countTaken(summary.taken)),
            Text(l10n.countSkipped(summary.skipped)),
            Text(l10n.countMissed(summary.missed)),
          ],
        ),
      ),
    );
  }
}

class _DateButton extends StatelessWidget {
  const _DateButton({required this.label, required this.date, required this.locale, required this.onPick});

  final String label;
  final DateTime date;
  final String locale;
  final ValueChanged<DateTime> onPick;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          onPick(DateTime(picked.year, picked.month, picked.day));
        }
      },
      child: Text('$label\n${formatShortDay(date, locale)}', textAlign: TextAlign.center),
    );
  }
}
