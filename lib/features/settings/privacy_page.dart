import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../shared/widgets/common.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final paragraphs = [
      l10n.privacyIntro,
      l10n.privacyLocal,
      l10n.privacyNoAccount,
      l10n.privacyNoCloud,
      l10n.privacyNoAds,
      l10n.privacyNoEncryption,
      l10n.privacyNotifications,
      l10n.notMedicalShort,
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.privacyTitle)),
      body: MaxWidth(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
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
