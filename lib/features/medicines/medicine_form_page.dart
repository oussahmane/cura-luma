import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/providers.dart';
import '../../app/theme.dart';
import '../../core/local_dates.dart';
import '../../core/script_direction.dart';
import '../../features/medicines/medicine_draft.dart';
import '../../features/refills/refill_estimator.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/format.dart';
import '../../shared/widgets/common.dart';
import '../scheduling/views.dart';

class MedicineDetailPage extends ConsumerWidget {
  const MedicineDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final details = ref.watch(medicineDetailsProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.medicineDetailsTitle),
        actions: [
          IconButton(
            tooltip: l10n.actionEdit,
            onPressed: () => context.push('/medicines/$id/edit'),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: details.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => EmptyState(title: l10n.actionFailed, body: l10n.notMedicalShort),
        data: (item) {
          if (item == null) {
            return EmptyState(title: l10n.actionFailed, body: l10n.medicinesEmptyBody);
          }
          return _Detail(details: item);
        },
      ),
    );
  }
}

class _Detail extends ConsumerWidget {
  const _Detail({required this.details});

  final MedicineDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = localeName(context);
    final summary = details.summary;
    final times = summary.times.map((minutes) => formatClock(minutes, locale)).join(' · ');
    return MaxWidth(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: Color(summary.color), radius: 18),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  summary.name,
                  textDirection: directionForText(summary.name),
                  style: theme.textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(l10n.doseLabel(summary.amount, summary.unit), style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(_formLabel(l10n, summary.form), style: theme.textTheme.bodyLarge),
          const SizedBox(height: 16),
          if (summary.paused) Text(l10n.pausedBanner, style: theme.textTheme.bodyLarge),
          if (summary.archived) Text(l10n.archivedHeading, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 8),
          Text('${l10n.fieldTimes}: $times', style: theme.textTheme.bodyLarge),
          Text('${l10n.fieldStartDate}: ${formatShortDay(details.startDate, locale)}', style: theme.textTheme.bodyLarge),
          Text(
            details.endDate == null
                ? l10n.fieldNoEndDate
                : '${l10n.fieldEndDate}: ${formatShortDay(details.endDate!, locale)}',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          if (details.photoPath != null && File(details.photoPath!).existsSync())
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(File(details.photoPath!), height: 180, width: double.infinity, fit: BoxFit.cover),
            ),
          if (details.instructions.isNotEmpty) ...[
            SectionLabel(l10n.instructionsHeading),
            Text(details.instructions, style: theme.textTheme.bodyLarge),
          ],
          if (details.notes.isNotEmpty) ...[
            SectionLabel(l10n.notesHeading),
            Text(details.notes, style: theme.textTheme.bodyLarge),
          ],
          SectionLabel(l10n.refillHeading),
          Text(l10n.refillExplanation, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          if (details.supply == null)
            Text(l10n.manualSupplyLabel, style: theme.textTheme.bodyLarge)
          else ...[
            Text(l10n.refillRemaining(formatQuantity(details.supply!)), style: theme.textTheme.titleMedium),
            if (!details.doseAmountParses)
              Text(l10n.refillCannotEstimate, style: theme.textTheme.bodyMedium)
            else if (details.projection.dosesLeft != null)
              Text(l10n.dosesLeft(details.projection.dosesLeft!), style: theme.textTheme.bodyLarge),
            if (summary.lowSupply)
              Text(l10n.refillLow, style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.error)),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => _correctSupply(context, ref),
              child: Text(l10n.refillCorrect),
            ),
          ],
          const SizedBox(height: 20),
          if (!summary.archived)
            OutlinedButton(
              onPressed: () async {
                if (summary.paused) {
                  await ref.read(reminderServiceProvider).resumeMedicine(summary.id);
                } else {
                  await ref.read(reminderServiceProvider).pauseMedicine(summary.id);
                }
                ref.invalidate(todayProvider);
              },
              child: Text(summary.paused ? l10n.resumeMedicine : l10n.pauseMedicine),
            ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () async {
              final confirmed = await _confirm(
                context,
                title: summary.archived ? l10n.actionUnarchive : l10n.archiveMedicineTitle,
                body: l10n.archiveMedicineBody(summary.name),
                action: summary.archived ? l10n.actionUnarchive : l10n.actionArchive,
              );
              if (!confirmed) {
                return;
              }
              await ref.read(reminderServiceProvider).archiveMedicine(summary.id, archived: !summary.archived);
              ref.invalidate(todayProvider);
            },
            child: Text(summary.archived ? l10n.actionUnarchive : l10n.actionArchive),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () async {
              final confirmed = await _confirm(
                context,
                title: l10n.deleteMedicineTitle,
                body: l10n.deleteMedicineBody(summary.name),
                action: l10n.actionDelete,
              );
              if (!confirmed || !context.mounted) {
                return;
              }
              await ref.read(reminderServiceProvider).deleteMedicine(summary.id);
              ref.invalidate(todayProvider);
              if (context.mounted) {
                context.pop();
              }
            },
            child: Text(l10n.actionDelete),
          ),
        ],
      ),
    );
  }

  Future<void> _correctSupply(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController(text: details.supply == null ? '' : formatQuantity(details.supply!));
    final saved = await showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.refillCorrect),
        content: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(labelText: l10n.fieldSupply),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.actionCancel)),
          FilledButton(
            onPressed: () {
              final value = double.tryParse(controller.text.trim().replaceAll(',', '.'));
              if (value == null || value < 0) {
                return;
              }
              Navigator.pop(context, value);
            },
            child: Text(l10n.actionSave),
          ),
        ],
      ),
    );
    controller.dispose();
    if (saved == null) {
      return;
    }
    await ref.read(reminderServiceProvider).correctSupply(details.summary.id, saved);
    ref.invalidate(todayProvider);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.refillSaved)));
    }
  }
}

Future<bool> _confirm(
  BuildContext context, {
  required String title,
  required String body,
  required String action,
}) async {
  final l10n = AppLocalizations.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.actionCancel)),
        FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(action)),
      ],
    ),
  );
  return result ?? false;
}

String _formLabel(AppLocalizations l10n, String form) {
  return switch (form) {
    'capsule' => l10n.formCapsule,
    'liquid' => l10n.formLiquid,
    'drops' => l10n.formDrops,
    'injection' => l10n.formInjection,
    'other' => l10n.formOther,
    _ => l10n.formTablet,
  };
}

class MedicineFormPage extends ConsumerStatefulWidget {
  const MedicineFormPage({super.key, this.id});

  final String? id;

  @override
  ConsumerState<MedicineFormPage> createState() => _MedicineFormPageState();
}

class _MedicineFormPageState extends ConsumerState<MedicineFormPage> {
  final _name = TextEditingController();
  final _amount = TextEditingController();
  final _unit = TextEditingController();
  final _notes = TextEditingController();
  final _instructions = TextEditingController();
  final _supply = TextEditingController();
  final _threshold = TextEditingController();
  String _form = 'tablet';
  DateTime _start = DateTime(2020);
  DateTime? _end;
  int _mask = allWeekdaysMask;
  final List<int> _times = [8 * 60];
  int _color = medicinePalette.first;
  List<int>? _photoBytes;
  bool _removePhoto = false;
  String? _existingPhoto;
  bool _dirty = false;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _start = dateOnly(ref.read(clockProvider)());
    final id = widget.id;
    if (id != null) {
      Future.microtask(() async {
        final details = await ref.read(reminderServiceProvider).loadMedicine(id);
        if (!mounted || details == null) {
          return;
        }
        setState(() {
          _name.text = details.summary.name;
          _amount.text = details.summary.amount;
          _unit.text = details.summary.unit;
          _notes.text = details.notes;
          _instructions.text = details.instructions;
          _form = details.summary.form;
          _start = details.startDate;
          _end = details.endDate;
          _mask = details.summary.weekdayMask;
          _times
            ..clear()
            ..addAll(details.summary.times);
          _color = details.summary.color;
          _existingPhoto = details.photoPath;
          if (details.supply != null) {
            _supply.text = formatQuantity(details.supply!);
          }
          if (details.threshold != null) {
            _threshold.text = formatQuantity(details.threshold!);
          }
          _dirty = false;
        });
      });
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _amount.dispose();
    _unit.dispose();
    _notes.dispose();
    _instructions.dispose();
    _supply.dispose();
    _threshold.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = localeName(context);
    final creating = widget.id == null;
    return PopScope(
      canPop: !_dirty,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop || !_dirty) {
          return;
        }
        final discard = await _confirm(
          context,
          title: l10n.discardTitle,
          body: l10n.discardBody,
          action: l10n.actionDiscard,
        );
        if (discard && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(creating ? l10n.medicineNewTitle : l10n.medicineEditTitle)),
        body: MaxWidth(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              Text(l10n.requiredLegend, style: Theme.of(context).textTheme.bodyMedium),
              if (!creating) ...[
                const SizedBox(height: 8),
                Text(l10n.scheduleEditNote, style: Theme.of(context).textTheme.bodyMedium),
              ],
              const SizedBox(height: 16),
              TextField(
                controller: _name,
                textDirection: directionForText(_name.text),
                decoration: InputDecoration(labelText: l10n.fieldName, hintText: l10n.nameHint),
                onChanged: (_) => _mark(),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _amount,
                decoration: InputDecoration(labelText: l10n.fieldDoseAmount, hintText: l10n.amountHint),
                onChanged: (_) => _mark(),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _unit,
                decoration: InputDecoration(labelText: l10n.fieldDoseUnit, hintText: l10n.unitHint),
                onChanged: (_) => _mark(),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _form,
                decoration: InputDecoration(labelText: l10n.fieldForm),
                items: [
                  for (final form in medicineForms)
                    DropdownMenuItem(value: form, child: Text(_formLabel(l10n, form))),
                ],
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _form = value;
                    _dirty = true;
                  });
                },
              ),
              const SizedBox(height: 16),
              SectionLabel(l10n.fieldTimes),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final minutes in _times)
                    InputChip(
                      label: Text(formatClock(minutes, locale)),
                      onDeleted: _times.length == 1
                          ? null
                          : () => setState(() {
                              _times.remove(minutes);
                              _dirty = true;
                            }),
                    ),
                  ActionChip(
                    label: Text(l10n.actionAddTime),
                    onPressed: _addTime,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SectionLabel(l10n.fieldWeekdays),
              Wrap(
                spacing: 8,
                children: [
                  for (final entry in _weekdays(l10n))
                    FilterChip(
                      label: Text(entry.$2),
                      selected: (_mask & entry.$1) != 0,
                      onSelected: (selected) {
                        setState(() {
                          _mask = selected ? _mask | entry.$1 : _mask & ~entry.$1;
                          _dirty = true;
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.fieldStartDate),
                subtitle: Text(formatShortDay(_start, locale)),
                onTap: () => _pickDate(start: true),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.fieldEndDate),
                subtitle: Text(_end == null ? l10n.fieldNoEndDate : formatShortDay(_end!, locale)),
                trailing: _end == null
                    ? null
                    : IconButton(
                        tooltip: l10n.clearEndDate,
                        onPressed: () => setState(() {
                          _end = null;
                          _dirty = true;
                        }),
                        icon: const Icon(Icons.close),
                      ),
                onTap: () => _pickDate(start: false),
              ),
              SectionLabel(l10n.fieldColor),
              Wrap(
                spacing: 10,
                children: [
                  for (var index = 0; index < medicinePalette.length; index++)
                    Semantics(
                      button: true,
                      selected: _color == medicinePalette[index],
                      label: l10n.semanticsColor(index + 1),
                      child: InkWell(
                        onTap: () => setState(() {
                          _color = medicinePalette[index];
                          _dirty = true;
                        }),
                        customBorder: const CircleBorder(),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Color(medicinePalette[index]),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _color == medicinePalette[index]
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              OutlinedButton(onPressed: _pickPhoto, child: Text(l10n.actionChoosePhoto)),
              if (_existingPhoto != null || _photoBytes != null)
                TextButton(
                  onPressed: () => setState(() {
                    _photoBytes = null;
                    _existingPhoto = null;
                    _removePhoto = true;
                    _dirty = true;
                  }),
                  child: Text(l10n.actionRemovePhoto),
                ),
              const SizedBox(height: 12),
              TextField(
                controller: _notes,
                minLines: 2,
                maxLines: 4,
                decoration: InputDecoration(labelText: l10n.fieldNotes, hintText: l10n.notesHint),
                onChanged: (_) => _mark(),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _instructions,
                minLines: 2,
                maxLines: 4,
                decoration: InputDecoration(labelText: l10n.fieldInstructions, hintText: l10n.instructionsHint),
                onChanged: (_) => _mark(),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _supply,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
                decoration: InputDecoration(labelText: l10n.fieldSupply, hintText: l10n.supplyHint),
                onChanged: (_) => _mark(),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _threshold,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
                decoration: InputDecoration(labelText: l10n.fieldRefillThreshold, hintText: l10n.thresholdHint),
                onChanged: (_) => _mark(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_error != null) ...[
                  Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
                  const SizedBox(height: 8),
                ],
                FilledButton(
                  onPressed: _saving ? null : _save,
                  child: Text(l10n.actionSave),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mark() {
    if (!_dirty) {
      setState(() => _dirty = true);
    }
  }

  Future<void> _addTime() async {
    final picked = await showTimePicker(context: context, initialTime: const TimeOfDay(hour: 8, minute: 0));
    if (picked == null) {
      return;
    }
    final minutes = picked.hour * 60 + picked.minute;
    setState(() {
      if (!_times.contains(minutes)) {
        _times.add(minutes);
        _times.sort();
      }
      _dirty = true;
      _error = _times.contains(minutes) && _times.where((time) => time == minutes).length > 1
          ? AppLocalizations.of(context).validationDuplicateTime
          : null;
    });
  }

  Future<void> _pickDate({required bool start}) async {
    final initial = start ? _start : (_end ?? _start);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) {
      return;
    }
    setState(() {
      if (start) {
        _start = picked;
      } else {
        _end = picked;
      }
      _dirty = true;
    });
  }

  Future<void> _pickPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 1600, imageQuality: 85);
    if (image == null) {
      return;
    }
    final bytes = await image.readAsBytes();
    setState(() {
      _photoBytes = bytes;
      _removePhoto = false;
      _dirty = true;
    });
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    final draft = MedicineDraft(
      id: widget.id,
      name: _name.text,
      doseAmount: _amount.text,
      doseUnit: _unit.text,
      form: _form,
      notes: _notes.text,
      instructions: _instructions.text,
      startDate: _start,
      endDate: _end,
      weekdayMask: _mask,
      times: _times,
      color: _color,
      photoBytes: _photoBytes,
      removePhoto: _removePhoto,
      supplyQuantity: _optionalNumber(_supply.text),
      refillThreshold: _optionalNumber(_threshold.text),
    );
    final validation = validateMedicineDraft(draft);
    if (validation != null) {
      setState(() => _error = validationMessage(l10n, validation));
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    final error = await ref.read(reminderServiceProvider).saveMedicine(draft);
    if (!mounted) {
      return;
    }
    if (error != null) {
      setState(() {
        _saving = false;
        _error = validationMessage(l10n, error);
      });
      return;
    }
    ref.invalidate(todayProvider);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.medicineSaved)));
    setState(() => _dirty = false);
    context.pop();
  }

  double? _optionalNumber(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) {
      return null;
    }
    return double.tryParse(trimmed.replaceAll(',', '.'));
  }
}

List<(int, String)> _weekdays(AppLocalizations l10n) {
  return [
    (1 << 0, l10n.weekdayMon),
    (1 << 1, l10n.weekdayTue),
    (1 << 2, l10n.weekdayWed),
    (1 << 3, l10n.weekdayThu),
    (1 << 4, l10n.weekdayFri),
    (1 << 5, l10n.weekdaySat),
    (1 << 6, l10n.weekdaySun),
  ];
}
