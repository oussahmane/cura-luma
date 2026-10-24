import 'package:drift/drift.dart';

class Medicines extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get doseAmount => text()();
  TextColumn get doseUnit => text()();
  TextColumn get form => text()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  TextColumn get instructions => text().withDefault(const Constant(''))();
  TextColumn get startDate => text()();
  TextColumn get endDate => text().nullable()();
  IntColumn get weekdayMask => integer()();
  IntColumn get color => integer()();
  TextColumn get photoPath => text().nullable()();
  RealColumn get supplyQuantity => real().nullable()();
  RealColumn get refillThreshold => real().nullable()();
  BoolColumn get refillAlertActive => boolean().withDefault(const Constant(false))();
  DateTimeColumn get scheduleRevisedAt => dateTime()();
  DateTimeColumn get archivedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ScheduleSlots extends Table {
  TextColumn get id => text()();
  TextColumn get medicineId => text().references(Medicines, #id, onDelete: KeyAction.cascade)();
  IntColumn get minutesFromMidnight => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class PauseIntervals extends Table {
  TextColumn get id => text()();
  TextColumn get medicineId => text().references(Medicines, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class DoseOccurrences extends Table {
  TextColumn get id => text()();
  TextColumn get medicineId => text().references(Medicines, #id, onDelete: KeyAction.cascade)();
  TextColumn get localDate => text()();
  IntColumn get minutesFromMidnight => integer()();
  DateTimeColumn get scheduledAt => dateTime()();
  TextColumn get status => text()();
  TextColumn get statusSource => text().withDefault(const Constant('none'))();
  DateTimeColumn get recordedAt => dateTime().nullable()();
  DateTimeColumn get postponeUntil => dateTime().nullable()();
  BoolColumn get supplyApplied => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AppSettings extends Table {
  IntColumn get id => integer()();
  BoolColumn get onboardingComplete => boolean().withDefault(const Constant(false))();
  TextColumn get localeCode => text().nullable()();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  BoolColumn get notificationsEnabled => boolean().withDefault(const Constant(true))();
  IntColumn get postponeMinutes => integer().withDefault(const Constant(15))();
  TextColumn get lastTimezone => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
