import 'package:cura_luma/app/cura_app.dart';
import 'package:cura_luma/app/providers.dart';
import 'package:cura_luma/database/app_database.dart';
import 'package:cura_luma/features/notifications/notification_gateway.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class _FixedTimezone extends TimezoneController {
  _FixedTimezone(this.location);

  final tz.Location location;

  @override
  tz.Location build() => location;
}

Future<void> pumpCura(
  WidgetTester tester, {
  DateTime Function()? clock,
  String? localeCode,
  bool onboarded = true,
}) async {
  tzdata.initializeTimeZones();
  final zone = tz.UTC;
  tz.setLocalLocation(zone);
  final database = AppDatabase(NativeDatabase.memory());
  addTearDown(database.close);
  await database.customSelect('SELECT 1').get();
  await (database.update(database.appSettings)..where((row) => row.id.equals(1))).write(
    AppSettingsCompanion(
      onboardingComplete: Value(onboarded),
      localeCode: Value(localeCode),
    ),
  );
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
        notificationGatewayProvider.overrideWithValue(UnavailableNotificationGateway()),
        clockProvider.overrideWithValue(clock ?? () => DateTime.utc(2026, 6, 15, 7, 30)),
        timezoneProvider.overrideWith(() => _FixedTimezone(zone)),
      ],
      child: const CuraApp(),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));
}

void main() {
  testWidgets('today explains the empty schedule', (tester) async {
    await pumpCura(tester);
    expect(find.text('Nothing scheduled yet'), findsOneWidget);
    expect(find.text('Add a medicine'), findsOneWidget);
  });

  testWidgets('onboarding introduces the app without an account', (tester) async {
    await pumpCura(tester, onboarded: false);
    expect(find.textContaining('There is no account'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('Arabic uses a right-to-left layout', (tester) async {
    await pumpCura(tester, localeCode: 'ar');
    expect(find.text('اليوم'), findsWidgets);
    final context = tester.element(find.text('اليوم').first);
    expect(Directionality.of(context), TextDirection.rtl);
  });

  testWidgets('medicine form requires a name before saving', (tester) async {
    await pumpCura(tester);
    await tester.tap(find.text('Medicines'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(find.byTooltip('Add a medicine'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(find.text('Save'));
    await tester.pump();
    expect(find.text('Enter a name.'), findsOneWidget);
    await tester.pump();
    expect(find.text('Enter a name.'), findsOneWidget);
  });

  testWidgets('a saved dose can be recorded once from Today', (tester) async {
    await pumpCura(tester);
    await tester.tap(find.text('Medicines'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(find.byTooltip('Add a medicine'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'Vitamin D');
    await tester.enterText(fields.at(1), '1');
    await tester.enterText(fields.at(2), 'tablet');
    await tester.ensureVisible(find.text('Save'));
    await tester.tap(find.text('Save'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    await tester.tap(find.text('Today'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('Vitamin D'), findsWidgets);
    ScaffoldMessenger.of(tester.element(find.text('Vitamin D').first)).clearSnackBars();
    await tester.pump();
    final taken = find.widgetWithText(FilledButton, 'Taken').hitTestable();
    await tester.tap(taken.first);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Dose recorded.'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Taken'), findsNothing);
  });
}
