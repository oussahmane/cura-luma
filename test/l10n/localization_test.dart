import 'package:cura_luma/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('English, French, and Arabic expose the same navigation copy', () {
    final english = lookupAppLocalizations(const Locale('en'));
    final french = lookupAppLocalizations(const Locale('fr'));
    final arabic = lookupAppLocalizations(const Locale('ar'));

    expect(english.appTitle, 'CuraLuma');
    expect(french.tagline, 'Un peu de soin, chaque jour.');
    expect(arabic.tagline, 'قليل من العناية، كل يوم.');
    expect(french.navToday, isNot(english.navToday));
    expect(arabic.navSettings, 'الإعدادات');
    expect(english.notificationBody('Name', '1 tablet'), 'Name · 1 tablet');
    expect(arabic.onboardingDisclaimer, contains('لا'));
  });
}
