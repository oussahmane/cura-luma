import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Medicines, ScheduleSlots, PauseIntervals, DoseOccurrences, AppSettings])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? driftDatabase(name: 'curaluma'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator migrator) async {
        await migrator.createAll();
        await into(appSettings).insert(AppSettingsCompanion.insert(id: const Value(1)));
        await customStatement(
          'CREATE INDEX IF NOT EXISTS idx_doses_medicine_date ON dose_occurrences (medicine_id, local_date)',
        );
      },
      onUpgrade: (Migrator migrator, int from, int to) async {
        // Version 1 is the first shipped schema. Add later versions here
        // without rewriting existing dose history.
      },
      beforeOpen: (OpeningDetails details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}
