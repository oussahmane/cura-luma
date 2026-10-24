import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

import '../features/scheduling/dose_status.dart';
import '../l10n/app_localizations.dart';

String statusLabel(AppLocalizations l10n, DoseDisplay display) {
  return switch (display) {
    DoseDisplay.upcoming => l10n.statusUpcoming,
    DoseDisplay.due => l10n.statusDue,
    DoseDisplay.taken => l10n.statusTaken,
    DoseDisplay.skipped => l10n.statusSkipped,
    DoseDisplay.missed => l10n.statusMissed,
    DoseDisplay.postponed => l10n.statusPostponed,
    DoseDisplay.paused => l10n.statusPaused,
  };
}

String validationMessage(AppLocalizations l10n, String code) {
  return switch (code) {
    'name' => l10n.validationName,
    'dose' => l10n.validationDose,
    'unit' => l10n.validationUnit,
    'time' => l10n.validationTime,
    'duplicateTime' => l10n.validationDuplicateTime,
    'weekday' => l10n.validationWeekday,
    'endDate' => l10n.validationEndDate,
    'supply' => l10n.validationSupply,
    'threshold' => l10n.validationThreshold,
    'length' => l10n.validationLength,
    _ => l10n.actionFailed,
  };
}

String formatDay(DateTime date, String locale) {
  return DateFormat.yMMMMEEEEd(locale).format(date);
}

String formatShortDay(DateTime date, String locale) {
  return DateFormat.MMMd(locale).format(date);
}

String formatClock(int minutes, String locale) {
  final date = DateTime(2020, 1, 1, minutes ~/ 60, minutes % 60);
  return DateFormat.jm(locale).format(date);
}

String formatInstant(DateTime instant, String locale, tz.Location location) {
  final local = tz.TZDateTime.from(instant.toUtc(), location);
  return DateFormat.jm(locale).format(local);
}

String localeName(BuildContext context) {
  return Localizations.localeOf(context).toLanguageTag();
}
