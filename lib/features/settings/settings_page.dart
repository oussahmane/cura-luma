import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../app/providers.dart';
import '../../core/dose_policy.dart';
import '../../features/backup/backup_codec.dart';
import '../../l10n/app_localizations.dart';
import '../../shared/widgets/common.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final prefs = ref.watch(preferencesProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsHeading)),
      body: prefs.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => EmptyState(title: l10n.actionFailed, body: l10n.notMedicalShort),
        data: (value) => MaxWidth(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              SectionLabel(l10n.sectionAppearance),
              SegmentedButton<String>(
                segments: [
                  ButtonSegment(value: 'system', label: Text(l10n.themeSystem)),
                  ButtonSegment(value: 'light', label: Text(l10n.themeLight)),
                  ButtonSegment(value: 'dark', label: Text(l10n.themeDark)),
                ],
                selected: {value.themeMode},
                onSelectionChanged: (selection) {
                  _save(ref, value, themeMode: selection.first);
                },
              ),
              SectionLabel(l10n.sectionLanguage),
              RadioGroup<String?>(
                groupValue: value.localeCode,
                onChanged: (code) => _save(ref, value, localeCode: code, clearLocale: code == null),
                child: Column(
                  children: [
                    RadioListTile<String?>(value: null, title: Text(l10n.languageSystem)),
                    RadioListTile<String?>(value: 'en', title: Text(l10n.languageEnglish)),
                    RadioListTile<String?>(value: 'fr', title: Text(l10n.languageFrench)),
                    RadioListTile<String?>(value: 'ar', title: Text(l10n.languageArabic)),
                  ],
                ),
              ),
              SectionLabel(l10n.sectionNotifications),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.notificationsEnabled),
                value: value.notificationsEnabled,
                onChanged: (enabled) async {
                  if (enabled) {
                    await ref.read(notificationGatewayProvider).requestNotificationsPermission();
                  }
                  await _save(ref, value, notificationsEnabled: enabled, reschedule: true);
                },
              ),
              Text(l10n.postponeLabel, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              SegmentedButton<int>(
                segments: [
                  ButtonSegment(value: 15, label: Text(l10n.postpone15)),
                  ButtonSegment(value: 30, label: Text(l10n.postpone30)),
                  ButtonSegment(value: 60, label: Text(l10n.postpone60)),
                ],
                selected: {DosePolicy.postponeChoices.contains(value.postponeMinutes) ? value.postponeMinutes : 15},
                onSelectionChanged: (selection) => _save(ref, value, postponeMinutes: selection.first),
              ),
              const SizedBox(height: 12),
              Text(l10n.reliabilityTitle, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(l10n.reliabilityBody, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 8),
              Text(l10n.horizonNote, style: Theme.of(context).textTheme.bodyMedium),
              Text(l10n.bootRecoveryNote, style: Theme.of(context).textTheme.bodyMedium),
              Text(l10n.clockChangeNote, style: Theme.of(context).textTheme.bodyMedium),
              if (value.lastTimezone != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(l10n.timezoneLabel(value.lastTimezone!)),
                ),
              const SizedBox(height: 8),
              FutureBuilder<bool>(
                future: ref.read(notificationGatewayProvider).canScheduleExactNotifications(),
                builder: (context, snapshot) {
                  final allowed = snapshot.data ?? false;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.exactAlarmTitle, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text(allowed ? l10n.exactAlarmGranted : l10n.exactAlarmMissing),
                      TextButton(
                        onPressed: () => ref.read(notificationGatewayProvider).requestExactAlarmsPermission(),
                        child: Text(l10n.exactAlarmAction),
                      ),
                    ],
                  );
                },
              ),
              SectionLabel(l10n.sectionData),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.privacyTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/settings/privacy'),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.exportAction),
                onTap: () => _export(context, ref),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.importAction),
                onTap: () => _import(context, ref),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.deleteAllAction),
                onTap: () => _deleteAll(context, ref),
              ),
              SectionLabel(l10n.sectionAbout),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.helpTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/settings/help'),
              ),
              const SizedBox(height: 8),
              Text(l10n.notMedicalShort, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 8),
              Text(l10n.aboutPaid, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  final version = snapshot.data == null
                      ? '1.0.0'
                      : '${snapshot.data!.version}+${snapshot.data!.buildNumber}';
                  return Text(l10n.aboutVersion(version));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save(
    WidgetRef ref,
    AppPreferences current, {
    String? themeMode,
    String? localeCode,
    bool clearLocale = false,
    bool? notificationsEnabled,
    int? postponeMinutes,
    bool reschedule = false,
  }) {
    return ref.read(preferencesProvider.notifier).save(
      AppPreferences(
        onboardingComplete: current.onboardingComplete,
        localeCode: clearLocale ? null : (localeCode ?? current.localeCode),
        themeMode: themeMode ?? current.themeMode,
        notificationsEnabled: notificationsEnabled ?? current.notificationsEnabled,
        postponeMinutes: postponeMinutes ?? current.postponeMinutes,
        lastTimezone: current.lastTimezone,
      ),
      reschedule: reschedule,
    );
  }

  Future<void> _export(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    try {
      final raw = await ref.read(reminderServiceProvider).exportBackup();
      final uri = await FilePicker.saveFile(
        fileName: 'curaluma-backup.json',
        bytes: Uint8List.fromList(utf8.encode(raw)),
        mimeType: 'application/json',
      );
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(uri == null ? l10n.exportCancelled : l10n.exportSuccess)),
      );
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.actionFailed)));
      }
    }
  }

  Future<void> _import(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.importReplaceTitle),
        content: Text(l10n.importReplaceBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.actionCancel)),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.actionConfirm)),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) {
      return;
    }
    final file = await FilePicker.pickFile(type: FileType.custom, allowedExtensions: ['json']);
    if (file == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.importCancelled)));
      }
      return;
    }
    try {
      final bundle = decodeBackup(utf8.decode(await file.readAsBytes()));
      await ref.read(reminderServiceProvider).importBackup(bundle);
      ref.invalidate(preferencesProvider);
      ref.invalidate(todayProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.importSuccess)));
      }
    } on BackupException {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.importInvalid)));
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.actionFailed)));
      }
    }
  }

  Future<void> _deleteAll(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteAllTitle),
        content: Text(l10n.deleteAllBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.actionCancel)),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.actionDelete)),
        ],
      ),
    );
    if (confirmed != true) {
      return;
    }
    await ref.read(reminderServiceProvider).deleteAllData();
    ref.invalidate(preferencesProvider);
    ref.invalidate(todayProvider);
  }
}
