import 'package:flutter/material.dart';

import '../../features/scheduling/dose_status.dart';
import '../../l10n/app_localizations.dart';
import '../format.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.display});

  final DoseDisplay display;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final (background, foreground) = switch (display) {
      DoseDisplay.due => (scheme.primaryContainer, scheme.onPrimaryContainer),
      DoseDisplay.taken => (scheme.primary, scheme.onPrimary),
      DoseDisplay.missed => (scheme.errorContainer, scheme.onErrorContainer),
      DoseDisplay.skipped => (scheme.surfaceContainer, scheme.onSurfaceVariant),
      DoseDisplay.paused => (scheme.surfaceContainer, scheme.onSurfaceVariant),
      DoseDisplay.postponed => (scheme.secondaryContainer, scheme.onSecondaryContainer),
      DoseDisplay.upcoming => (scheme.surfaceContainerLow, scheme.onSurface),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        statusLabel(AppLocalizations.of(context), display),
        style: theme.textTheme.labelLarge?.copyWith(color: foreground, fontSize: 13),
      ),
    );
  }
}
