import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/widgets/common.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final paragraphs = [
      l10n.helpAdd,
      l10n.helpRecord,
      l10n.helpReminders,
      l10n.helpReliability,
      l10n.helpRefill,
      l10n.helpNotMedical,
      l10n.horizonNote,
      l10n.bootRecoveryNote,
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.helpTitle)),
      body: MaxWidth(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            Text(l10n.disclaimerTitle, style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            for (final paragraph in paragraphs) ...[
              Text(paragraph, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }
}
