// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MedicinesTable extends Medicines
    with TableInfo<$MedicinesTable, Medicine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseAmountMeta = const VerificationMeta(
    'doseAmount',
  );
  @override
  late final GeneratedColumn<String> doseAmount = GeneratedColumn<String>(
    'dose_amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseUnitMeta = const VerificationMeta(
    'doseUnit',
  );
  @override
  late final GeneratedColumn<String> doseUnit = GeneratedColumn<String>(
    'dose_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formMeta = const VerificationMeta('form');
  @override
  late final GeneratedColumn<String> form = GeneratedColumn<String>(
    'form',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<String> endDate = GeneratedColumn<String>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weekdayMaskMeta = const VerificationMeta(
    'weekdayMask',
  );
  @override
  late final GeneratedColumn<int> weekdayMask = GeneratedColumn<int>(
    'weekday_mask',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supplyQuantityMeta = const VerificationMeta(
    'supplyQuantity',
  );
  @override
  late final GeneratedColumn<double> supplyQuantity = GeneratedColumn<double>(
    'supply_quantity',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _refillThresholdMeta = const VerificationMeta(
    'refillThreshold',
  );
  @override
  late final GeneratedColumn<double> refillThreshold = GeneratedColumn<double>(
    'refill_threshold',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _refillAlertActiveMeta = const VerificationMeta(
    'refillAlertActive',
  );
  @override
  late final GeneratedColumn<bool> refillAlertActive = GeneratedColumn<bool>(
    'refill_alert_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("refill_alert_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _scheduleRevisedAtMeta = const VerificationMeta(
    'scheduleRevisedAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduleRevisedAt =
      GeneratedColumn<DateTime>(
        'schedule_revised_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    doseAmount,
    doseUnit,
    form,
    notes,
    instructions,
    startDate,
    endDate,
    weekdayMask,
    color,
    photoPath,
    supplyQuantity,
    refillThreshold,
    refillAlertActive,
    scheduleRevisedAt,
    archivedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicines';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medicine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dose_amount')) {
      context.handle(
        _doseAmountMeta,
        doseAmount.isAcceptableOrUnknown(data['dose_amount']!, _doseAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_doseAmountMeta);
    }
    if (data.containsKey('dose_unit')) {
      context.handle(
        _doseUnitMeta,
        doseUnit.isAcceptableOrUnknown(data['dose_unit']!, _doseUnitMeta),
      );
    } else if (isInserting) {
      context.missing(_doseUnitMeta);
    }
    if (data.containsKey('form')) {
      context.handle(
        _formMeta,
        form.isAcceptableOrUnknown(data['form']!, _formMeta),
      );
    } else if (isInserting) {
      context.missing(_formMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('weekday_mask')) {
      context.handle(
        _weekdayMaskMeta,
        weekdayMask.isAcceptableOrUnknown(
          data['weekday_mask']!,
          _weekdayMaskMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weekdayMaskMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('supply_quantity')) {
      context.handle(
        _supplyQuantityMeta,
        supplyQuantity.isAcceptableOrUnknown(
          data['supply_quantity']!,
          _supplyQuantityMeta,
        ),
      );
    }
    if (data.containsKey('refill_threshold')) {
      context.handle(
        _refillThresholdMeta,
        refillThreshold.isAcceptableOrUnknown(
          data['refill_threshold']!,
          _refillThresholdMeta,
        ),
      );
    }
    if (data.containsKey('refill_alert_active')) {
      context.handle(
        _refillAlertActiveMeta,
        refillAlertActive.isAcceptableOrUnknown(
          data['refill_alert_active']!,
          _refillAlertActiveMeta,
        ),
      );
    }
    if (data.containsKey('schedule_revised_at')) {
      context.handle(
        _scheduleRevisedAtMeta,
        scheduleRevisedAt.isAcceptableOrUnknown(
          data['schedule_revised_at']!,
          _scheduleRevisedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduleRevisedAtMeta);
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medicine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medicine(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      doseAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose_amount'],
      )!,
      doseUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose_unit'],
      )!,
      form: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}form'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_date'],
      ),
      weekdayMask: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekday_mask'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      supplyQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}supply_quantity'],
      ),
      refillThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}refill_threshold'],
      ),
      refillAlertActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}refill_alert_active'],
      )!,
      scheduleRevisedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}schedule_revised_at'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MedicinesTable createAlias(String alias) {
    return $MedicinesTable(attachedDatabase, alias);
  }
}

class Medicine extends DataClass implements Insertable<Medicine> {
  final String id;
  final String name;
  final String doseAmount;
  final String doseUnit;
  final String form;
  final String notes;
  final String instructions;
  final String startDate;
  final String? endDate;
  final int weekdayMask;
  final int color;
  final String? photoPath;
  final double? supplyQuantity;
  final double? refillThreshold;
  final bool refillAlertActive;
  final DateTime scheduleRevisedAt;
  final DateTime? archivedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Medicine({
    required this.id,
    required this.name,
    required this.doseAmount,
    required this.doseUnit,
    required this.form,
    required this.notes,
    required this.instructions,
    required this.startDate,
    this.endDate,
    required this.weekdayMask,
    required this.color,
    this.photoPath,
    this.supplyQuantity,
    this.refillThreshold,
    required this.refillAlertActive,
    required this.scheduleRevisedAt,
    this.archivedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['dose_amount'] = Variable<String>(doseAmount);
    map['dose_unit'] = Variable<String>(doseUnit);
    map['form'] = Variable<String>(form);
    map['notes'] = Variable<String>(notes);
    map['instructions'] = Variable<String>(instructions);
    map['start_date'] = Variable<String>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<String>(endDate);
    }
    map['weekday_mask'] = Variable<int>(weekdayMask);
    map['color'] = Variable<int>(color);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    if (!nullToAbsent || supplyQuantity != null) {
      map['supply_quantity'] = Variable<double>(supplyQuantity);
    }
    if (!nullToAbsent || refillThreshold != null) {
      map['refill_threshold'] = Variable<double>(refillThreshold);
    }
    map['refill_alert_active'] = Variable<bool>(refillAlertActive);
    map['schedule_revised_at'] = Variable<DateTime>(scheduleRevisedAt);
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MedicinesCompanion toCompanion(bool nullToAbsent) {
    return MedicinesCompanion(
      id: Value(id),
      name: Value(name),
      doseAmount: Value(doseAmount),
      doseUnit: Value(doseUnit),
      form: Value(form),
      notes: Value(notes),
      instructions: Value(instructions),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      weekdayMask: Value(weekdayMask),
      color: Value(color),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      supplyQuantity: supplyQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(supplyQuantity),
      refillThreshold: refillThreshold == null && nullToAbsent
          ? const Value.absent()
          : Value(refillThreshold),
      refillAlertActive: Value(refillAlertActive),
      scheduleRevisedAt: Value(scheduleRevisedAt),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Medicine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medicine(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      doseAmount: serializer.fromJson<String>(json['doseAmount']),
      doseUnit: serializer.fromJson<String>(json['doseUnit']),
      form: serializer.fromJson<String>(json['form']),
      notes: serializer.fromJson<String>(json['notes']),
      instructions: serializer.fromJson<String>(json['instructions']),
      startDate: serializer.fromJson<String>(json['startDate']),
      endDate: serializer.fromJson<String?>(json['endDate']),
      weekdayMask: serializer.fromJson<int>(json['weekdayMask']),
      color: serializer.fromJson<int>(json['color']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      supplyQuantity: serializer.fromJson<double?>(json['supplyQuantity']),
      refillThreshold: serializer.fromJson<double?>(json['refillThreshold']),
      refillAlertActive: serializer.fromJson<bool>(json['refillAlertActive']),
      scheduleRevisedAt: serializer.fromJson<DateTime>(
        json['scheduleRevisedAt'],
      ),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'doseAmount': serializer.toJson<String>(doseAmount),
      'doseUnit': serializer.toJson<String>(doseUnit),
      'form': serializer.toJson<String>(form),
      'notes': serializer.toJson<String>(notes),
      'instructions': serializer.toJson<String>(instructions),
      'startDate': serializer.toJson<String>(startDate),
      'endDate': serializer.toJson<String?>(endDate),
      'weekdayMask': serializer.toJson<int>(weekdayMask),
      'color': serializer.toJson<int>(color),
      'photoPath': serializer.toJson<String?>(photoPath),
      'supplyQuantity': serializer.toJson<double?>(supplyQuantity),
      'refillThreshold': serializer.toJson<double?>(refillThreshold),
      'refillAlertActive': serializer.toJson<bool>(refillAlertActive),
      'scheduleRevisedAt': serializer.toJson<DateTime>(scheduleRevisedAt),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Medicine copyWith({
    String? id,
    String? name,
    String? doseAmount,
    String? doseUnit,
    String? form,
    String? notes,
    String? instructions,
    String? startDate,
    Value<String?> endDate = const Value.absent(),
    int? weekdayMask,
    int? color,
    Value<String?> photoPath = const Value.absent(),
    Value<double?> supplyQuantity = const Value.absent(),
    Value<double?> refillThreshold = const Value.absent(),
    bool? refillAlertActive,
    DateTime? scheduleRevisedAt,
    Value<DateTime?> archivedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Medicine(
    id: id ?? this.id,
    name: name ?? this.name,
    doseAmount: doseAmount ?? this.doseAmount,
    doseUnit: doseUnit ?? this.doseUnit,
    form: form ?? this.form,
    notes: notes ?? this.notes,
    instructions: instructions ?? this.instructions,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    weekdayMask: weekdayMask ?? this.weekdayMask,
    color: color ?? this.color,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    supplyQuantity: supplyQuantity.present
        ? supplyQuantity.value
        : this.supplyQuantity,
    refillThreshold: refillThreshold.present
        ? refillThreshold.value
        : this.refillThreshold,
    refillAlertActive: refillAlertActive ?? this.refillAlertActive,
    scheduleRevisedAt: scheduleRevisedAt ?? this.scheduleRevisedAt,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Medicine copyWithCompanion(MedicinesCompanion data) {
    return Medicine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      doseAmount: data.doseAmount.present
          ? data.doseAmount.value
          : this.doseAmount,
      doseUnit: data.doseUnit.present ? data.doseUnit.value : this.doseUnit,
      form: data.form.present ? data.form.value : this.form,
      notes: data.notes.present ? data.notes.value : this.notes,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      weekdayMask: data.weekdayMask.present
          ? data.weekdayMask.value
          : this.weekdayMask,
      color: data.color.present ? data.color.value : this.color,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      supplyQuantity: data.supplyQuantity.present
          ? data.supplyQuantity.value
          : this.supplyQuantity,
      refillThreshold: data.refillThreshold.present
          ? data.refillThreshold.value
          : this.refillThreshold,
      refillAlertActive: data.refillAlertActive.present
          ? data.refillAlertActive.value
          : this.refillAlertActive,
      scheduleRevisedAt: data.scheduleRevisedAt.present
          ? data.scheduleRevisedAt.value
          : this.scheduleRevisedAt,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medicine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('doseUnit: $doseUnit, ')
          ..write('form: $form, ')
          ..write('notes: $notes, ')
          ..write('instructions: $instructions, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('weekdayMask: $weekdayMask, ')
          ..write('color: $color, ')
          ..write('photoPath: $photoPath, ')
          ..write('supplyQuantity: $supplyQuantity, ')
          ..write('refillThreshold: $refillThreshold, ')
          ..write('refillAlertActive: $refillAlertActive, ')
          ..write('scheduleRevisedAt: $scheduleRevisedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    doseAmount,
    doseUnit,
    form,
    notes,
    instructions,
    startDate,
    endDate,
    weekdayMask,
    color,
    photoPath,
    supplyQuantity,
    refillThreshold,
    refillAlertActive,
    scheduleRevisedAt,
    archivedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medicine &&
          other.id == this.id &&
          other.name == this.name &&
          other.doseAmount == this.doseAmount &&
          other.doseUnit == this.doseUnit &&
          other.form == this.form &&
          other.notes == this.notes &&
          other.instructions == this.instructions &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.weekdayMask == this.weekdayMask &&
          other.color == this.color &&
          other.photoPath == this.photoPath &&
          other.supplyQuantity == this.supplyQuantity &&
          other.refillThreshold == this.refillThreshold &&
          other.refillAlertActive == this.refillAlertActive &&
          other.scheduleRevisedAt == this.scheduleRevisedAt &&
          other.archivedAt == this.archivedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MedicinesCompanion extends UpdateCompanion<Medicine> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> doseAmount;
  final Value<String> doseUnit;
  final Value<String> form;
  final Value<String> notes;
  final Value<String> instructions;
  final Value<String> startDate;
  final Value<String?> endDate;
  final Value<int> weekdayMask;
  final Value<int> color;
  final Value<String?> photoPath;
  final Value<double?> supplyQuantity;
  final Value<double?> refillThreshold;
  final Value<bool> refillAlertActive;
  final Value<DateTime> scheduleRevisedAt;
  final Value<DateTime?> archivedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const MedicinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.doseAmount = const Value.absent(),
    this.doseUnit = const Value.absent(),
    this.form = const Value.absent(),
    this.notes = const Value.absent(),
    this.instructions = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.weekdayMask = const Value.absent(),
    this.color = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.supplyQuantity = const Value.absent(),
    this.refillThreshold = const Value.absent(),
    this.refillAlertActive = const Value.absent(),
    this.scheduleRevisedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicinesCompanion.insert({
    required String id,
    required String name,
    required String doseAmount,
    required String doseUnit,
    required String form,
    this.notes = const Value.absent(),
    this.instructions = const Value.absent(),
    required String startDate,
    this.endDate = const Value.absent(),
    required int weekdayMask,
    required int color,
    this.photoPath = const Value.absent(),
    this.supplyQuantity = const Value.absent(),
    this.refillThreshold = const Value.absent(),
    this.refillAlertActive = const Value.absent(),
    required DateTime scheduleRevisedAt,
    this.archivedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       doseAmount = Value(doseAmount),
       doseUnit = Value(doseUnit),
       form = Value(form),
       startDate = Value(startDate),
       weekdayMask = Value(weekdayMask),
       color = Value(color),
       scheduleRevisedAt = Value(scheduleRevisedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Medicine> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? doseAmount,
    Expression<String>? doseUnit,
    Expression<String>? form,
    Expression<String>? notes,
    Expression<String>? instructions,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<int>? weekdayMask,
    Expression<int>? color,
    Expression<String>? photoPath,
    Expression<double>? supplyQuantity,
    Expression<double>? refillThreshold,
    Expression<bool>? refillAlertActive,
    Expression<DateTime>? scheduleRevisedAt,
    Expression<DateTime>? archivedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (doseAmount != null) 'dose_amount': doseAmount,
      if (doseUnit != null) 'dose_unit': doseUnit,
      if (form != null) 'form': form,
      if (notes != null) 'notes': notes,
      if (instructions != null) 'instructions': instructions,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (weekdayMask != null) 'weekday_mask': weekdayMask,
      if (color != null) 'color': color,
      if (photoPath != null) 'photo_path': photoPath,
      if (supplyQuantity != null) 'supply_quantity': supplyQuantity,
      if (refillThreshold != null) 'refill_threshold': refillThreshold,
      if (refillAlertActive != null) 'refill_alert_active': refillAlertActive,
      if (scheduleRevisedAt != null) 'schedule_revised_at': scheduleRevisedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicinesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? doseAmount,
    Value<String>? doseUnit,
    Value<String>? form,
    Value<String>? notes,
    Value<String>? instructions,
    Value<String>? startDate,
    Value<String?>? endDate,
    Value<int>? weekdayMask,
    Value<int>? color,
    Value<String?>? photoPath,
    Value<double?>? supplyQuantity,
    Value<double?>? refillThreshold,
    Value<bool>? refillAlertActive,
    Value<DateTime>? scheduleRevisedAt,
    Value<DateTime?>? archivedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return MedicinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      doseAmount: doseAmount ?? this.doseAmount,
      doseUnit: doseUnit ?? this.doseUnit,
      form: form ?? this.form,
      notes: notes ?? this.notes,
      instructions: instructions ?? this.instructions,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      weekdayMask: weekdayMask ?? this.weekdayMask,
      color: color ?? this.color,
      photoPath: photoPath ?? this.photoPath,
      supplyQuantity: supplyQuantity ?? this.supplyQuantity,
      refillThreshold: refillThreshold ?? this.refillThreshold,
      refillAlertActive: refillAlertActive ?? this.refillAlertActive,
      scheduleRevisedAt: scheduleRevisedAt ?? this.scheduleRevisedAt,
      archivedAt: archivedAt ?? this.archivedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (doseAmount.present) {
      map['dose_amount'] = Variable<String>(doseAmount.value);
    }
    if (doseUnit.present) {
      map['dose_unit'] = Variable<String>(doseUnit.value);
    }
    if (form.present) {
      map['form'] = Variable<String>(form.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(endDate.value);
    }
    if (weekdayMask.present) {
      map['weekday_mask'] = Variable<int>(weekdayMask.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (supplyQuantity.present) {
      map['supply_quantity'] = Variable<double>(supplyQuantity.value);
    }
    if (refillThreshold.present) {
      map['refill_threshold'] = Variable<double>(refillThreshold.value);
    }
    if (refillAlertActive.present) {
      map['refill_alert_active'] = Variable<bool>(refillAlertActive.value);
    }
    if (scheduleRevisedAt.present) {
      map['schedule_revised_at'] = Variable<DateTime>(scheduleRevisedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('doseUnit: $doseUnit, ')
          ..write('form: $form, ')
          ..write('notes: $notes, ')
          ..write('instructions: $instructions, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('weekdayMask: $weekdayMask, ')
          ..write('color: $color, ')
          ..write('photoPath: $photoPath, ')
          ..write('supplyQuantity: $supplyQuantity, ')
          ..write('refillThreshold: $refillThreshold, ')
          ..write('refillAlertActive: $refillAlertActive, ')
          ..write('scheduleRevisedAt: $scheduleRevisedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScheduleSlotsTable extends ScheduleSlots
    with TableInfo<$ScheduleSlotsTable, ScheduleSlot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleSlotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<String> medicineId = GeneratedColumn<String>(
    'medicine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicines (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _minutesFromMidnightMeta =
      const VerificationMeta('minutesFromMidnight');
  @override
  late final GeneratedColumn<int> minutesFromMidnight = GeneratedColumn<int>(
    'minutes_from_midnight',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, medicineId, minutesFromMidnight];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_slots';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleSlot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('minutes_from_midnight')) {
      context.handle(
        _minutesFromMidnightMeta,
        minutesFromMidnight.isAcceptableOrUnknown(
          data['minutes_from_midnight']!,
          _minutesFromMidnightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minutesFromMidnightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleSlot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleSlot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      medicineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medicine_id'],
      )!,
      minutesFromMidnight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes_from_midnight'],
      )!,
    );
  }

  @override
  $ScheduleSlotsTable createAlias(String alias) {
    return $ScheduleSlotsTable(attachedDatabase, alias);
  }
}

class ScheduleSlot extends DataClass implements Insertable<ScheduleSlot> {
  final String id;
  final String medicineId;
  final int minutesFromMidnight;
  const ScheduleSlot({
    required this.id,
    required this.medicineId,
    required this.minutesFromMidnight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medicine_id'] = Variable<String>(medicineId);
    map['minutes_from_midnight'] = Variable<int>(minutesFromMidnight);
    return map;
  }

  ScheduleSlotsCompanion toCompanion(bool nullToAbsent) {
    return ScheduleSlotsCompanion(
      id: Value(id),
      medicineId: Value(medicineId),
      minutesFromMidnight: Value(minutesFromMidnight),
    );
  }

  factory ScheduleSlot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleSlot(
      id: serializer.fromJson<String>(json['id']),
      medicineId: serializer.fromJson<String>(json['medicineId']),
      minutesFromMidnight: serializer.fromJson<int>(
        json['minutesFromMidnight'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicineId': serializer.toJson<String>(medicineId),
      'minutesFromMidnight': serializer.toJson<int>(minutesFromMidnight),
    };
  }

  ScheduleSlot copyWith({
    String? id,
    String? medicineId,
    int? minutesFromMidnight,
  }) => ScheduleSlot(
    id: id ?? this.id,
    medicineId: medicineId ?? this.medicineId,
    minutesFromMidnight: minutesFromMidnight ?? this.minutesFromMidnight,
  );
  ScheduleSlot copyWithCompanion(ScheduleSlotsCompanion data) {
    return ScheduleSlot(
      id: data.id.present ? data.id.value : this.id,
      medicineId: data.medicineId.present
          ? data.medicineId.value
          : this.medicineId,
      minutesFromMidnight: data.minutesFromMidnight.present
          ? data.minutesFromMidnight.value
          : this.minutesFromMidnight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleSlot(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('minutesFromMidnight: $minutesFromMidnight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicineId, minutesFromMidnight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleSlot &&
          other.id == this.id &&
          other.medicineId == this.medicineId &&
          other.minutesFromMidnight == this.minutesFromMidnight);
}

class ScheduleSlotsCompanion extends UpdateCompanion<ScheduleSlot> {
  final Value<String> id;
  final Value<String> medicineId;
  final Value<int> minutesFromMidnight;
  final Value<int> rowid;
  const ScheduleSlotsCompanion({
    this.id = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.minutesFromMidnight = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScheduleSlotsCompanion.insert({
    required String id,
    required String medicineId,
    required int minutesFromMidnight,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       medicineId = Value(medicineId),
       minutesFromMidnight = Value(minutesFromMidnight);
  static Insertable<ScheduleSlot> custom({
    Expression<String>? id,
    Expression<String>? medicineId,
    Expression<int>? minutesFromMidnight,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineId != null) 'medicine_id': medicineId,
      if (minutesFromMidnight != null)
        'minutes_from_midnight': minutesFromMidnight,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScheduleSlotsCompanion copyWith({
    Value<String>? id,
    Value<String>? medicineId,
    Value<int>? minutesFromMidnight,
    Value<int>? rowid,
  }) {
    return ScheduleSlotsCompanion(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      minutesFromMidnight: minutesFromMidnight ?? this.minutesFromMidnight,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<String>(medicineId.value);
    }
    if (minutesFromMidnight.present) {
      map['minutes_from_midnight'] = Variable<int>(minutesFromMidnight.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleSlotsCompanion(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('minutesFromMidnight: $minutesFromMidnight, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PauseIntervalsTable extends PauseIntervals
    with TableInfo<$PauseIntervalsTable, PauseInterval> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PauseIntervalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<String> medicineId = GeneratedColumn<String>(
    'medicine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicines (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, medicineId, startedAt, endedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pause_intervals';
  @override
  VerificationContext validateIntegrity(
    Insertable<PauseInterval> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PauseInterval map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PauseInterval(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      medicineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medicine_id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
    );
  }

  @override
  $PauseIntervalsTable createAlias(String alias) {
    return $PauseIntervalsTable(attachedDatabase, alias);
  }
}

class PauseInterval extends DataClass implements Insertable<PauseInterval> {
  final String id;
  final String medicineId;
  final DateTime startedAt;
  final DateTime? endedAt;
  const PauseInterval({
    required this.id,
    required this.medicineId,
    required this.startedAt,
    this.endedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medicine_id'] = Variable<String>(medicineId);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    return map;
  }

  PauseIntervalsCompanion toCompanion(bool nullToAbsent) {
    return PauseIntervalsCompanion(
      id: Value(id),
      medicineId: Value(medicineId),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
    );
  }

  factory PauseInterval.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PauseInterval(
      id: serializer.fromJson<String>(json['id']),
      medicineId: serializer.fromJson<String>(json['medicineId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicineId': serializer.toJson<String>(medicineId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
    };
  }

  PauseInterval copyWith({
    String? id,
    String? medicineId,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
  }) => PauseInterval(
    id: id ?? this.id,
    medicineId: medicineId ?? this.medicineId,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
  );
  PauseInterval copyWithCompanion(PauseIntervalsCompanion data) {
    return PauseInterval(
      id: data.id.present ? data.id.value : this.id,
      medicineId: data.medicineId.present
          ? data.medicineId.value
          : this.medicineId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PauseInterval(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicineId, startedAt, endedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PauseInterval &&
          other.id == this.id &&
          other.medicineId == this.medicineId &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt);
}

class PauseIntervalsCompanion extends UpdateCompanion<PauseInterval> {
  final Value<String> id;
  final Value<String> medicineId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<int> rowid;
  const PauseIntervalsCompanion({
    this.id = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PauseIntervalsCompanion.insert({
    required String id,
    required String medicineId,
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       medicineId = Value(medicineId),
       startedAt = Value(startedAt);
  static Insertable<PauseInterval> custom({
    Expression<String>? id,
    Expression<String>? medicineId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineId != null) 'medicine_id': medicineId,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PauseIntervalsCompanion copyWith({
    Value<String>? id,
    Value<String>? medicineId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<int>? rowid,
  }) {
    return PauseIntervalsCompanion(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<String>(medicineId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PauseIntervalsCompanion(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoseOccurrencesTable extends DoseOccurrences
    with TableInfo<$DoseOccurrencesTable, DoseOccurrence> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseOccurrencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<String> medicineId = GeneratedColumn<String>(
    'medicine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicines (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _localDateMeta = const VerificationMeta(
    'localDate',
  );
  @override
  late final GeneratedColumn<String> localDate = GeneratedColumn<String>(
    'local_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minutesFromMidnightMeta =
      const VerificationMeta('minutesFromMidnight');
  @override
  late final GeneratedColumn<int> minutesFromMidnight = GeneratedColumn<int>(
    'minutes_from_midnight',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusSourceMeta = const VerificationMeta(
    'statusSource',
  );
  @override
  late final GeneratedColumn<String> statusSource = GeneratedColumn<String>(
    'status_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _postponeUntilMeta = const VerificationMeta(
    'postponeUntil',
  );
  @override
  late final GeneratedColumn<DateTime> postponeUntil =
      GeneratedColumn<DateTime>(
        'postpone_until',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _supplyAppliedMeta = const VerificationMeta(
    'supplyApplied',
  );
  @override
  late final GeneratedColumn<bool> supplyApplied = GeneratedColumn<bool>(
    'supply_applied',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("supply_applied" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicineId,
    localDate,
    minutesFromMidnight,
    scheduledAt,
    status,
    statusSource,
    recordedAt,
    postponeUntil,
    supplyApplied,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_occurrences';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoseOccurrence> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('local_date')) {
      context.handle(
        _localDateMeta,
        localDate.isAcceptableOrUnknown(data['local_date']!, _localDateMeta),
      );
    } else if (isInserting) {
      context.missing(_localDateMeta);
    }
    if (data.containsKey('minutes_from_midnight')) {
      context.handle(
        _minutesFromMidnightMeta,
        minutesFromMidnight.isAcceptableOrUnknown(
          data['minutes_from_midnight']!,
          _minutesFromMidnightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minutesFromMidnightMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('status_source')) {
      context.handle(
        _statusSourceMeta,
        statusSource.isAcceptableOrUnknown(
          data['status_source']!,
          _statusSourceMeta,
        ),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    if (data.containsKey('postpone_until')) {
      context.handle(
        _postponeUntilMeta,
        postponeUntil.isAcceptableOrUnknown(
          data['postpone_until']!,
          _postponeUntilMeta,
        ),
      );
    }
    if (data.containsKey('supply_applied')) {
      context.handle(
        _supplyAppliedMeta,
        supplyApplied.isAcceptableOrUnknown(
          data['supply_applied']!,
          _supplyAppliedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseOccurrence map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseOccurrence(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      medicineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medicine_id'],
      )!,
      localDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_date'],
      )!,
      minutesFromMidnight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes_from_midnight'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      statusSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_source'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      ),
      postponeUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}postpone_until'],
      ),
      supplyApplied: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supply_applied'],
      )!,
    );
  }

  @override
  $DoseOccurrencesTable createAlias(String alias) {
    return $DoseOccurrencesTable(attachedDatabase, alias);
  }
}

class DoseOccurrence extends DataClass implements Insertable<DoseOccurrence> {
  final String id;
  final String medicineId;
  final String localDate;
  final int minutesFromMidnight;
  final DateTime scheduledAt;
  final String status;
  final String statusSource;
  final DateTime? recordedAt;
  final DateTime? postponeUntil;
  final bool supplyApplied;
  const DoseOccurrence({
    required this.id,
    required this.medicineId,
    required this.localDate,
    required this.minutesFromMidnight,
    required this.scheduledAt,
    required this.status,
    required this.statusSource,
    this.recordedAt,
    this.postponeUntil,
    required this.supplyApplied,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['medicine_id'] = Variable<String>(medicineId);
    map['local_date'] = Variable<String>(localDate);
    map['minutes_from_midnight'] = Variable<int>(minutesFromMidnight);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['status'] = Variable<String>(status);
    map['status_source'] = Variable<String>(statusSource);
    if (!nullToAbsent || recordedAt != null) {
      map['recorded_at'] = Variable<DateTime>(recordedAt);
    }
    if (!nullToAbsent || postponeUntil != null) {
      map['postpone_until'] = Variable<DateTime>(postponeUntil);
    }
    map['supply_applied'] = Variable<bool>(supplyApplied);
    return map;
  }

  DoseOccurrencesCompanion toCompanion(bool nullToAbsent) {
    return DoseOccurrencesCompanion(
      id: Value(id),
      medicineId: Value(medicineId),
      localDate: Value(localDate),
      minutesFromMidnight: Value(minutesFromMidnight),
      scheduledAt: Value(scheduledAt),
      status: Value(status),
      statusSource: Value(statusSource),
      recordedAt: recordedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(recordedAt),
      postponeUntil: postponeUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(postponeUntil),
      supplyApplied: Value(supplyApplied),
    );
  }

  factory DoseOccurrence.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseOccurrence(
      id: serializer.fromJson<String>(json['id']),
      medicineId: serializer.fromJson<String>(json['medicineId']),
      localDate: serializer.fromJson<String>(json['localDate']),
      minutesFromMidnight: serializer.fromJson<int>(
        json['minutesFromMidnight'],
      ),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      status: serializer.fromJson<String>(json['status']),
      statusSource: serializer.fromJson<String>(json['statusSource']),
      recordedAt: serializer.fromJson<DateTime?>(json['recordedAt']),
      postponeUntil: serializer.fromJson<DateTime?>(json['postponeUntil']),
      supplyApplied: serializer.fromJson<bool>(json['supplyApplied']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'medicineId': serializer.toJson<String>(medicineId),
      'localDate': serializer.toJson<String>(localDate),
      'minutesFromMidnight': serializer.toJson<int>(minutesFromMidnight),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'status': serializer.toJson<String>(status),
      'statusSource': serializer.toJson<String>(statusSource),
      'recordedAt': serializer.toJson<DateTime?>(recordedAt),
      'postponeUntil': serializer.toJson<DateTime?>(postponeUntil),
      'supplyApplied': serializer.toJson<bool>(supplyApplied),
    };
  }

  DoseOccurrence copyWith({
    String? id,
    String? medicineId,
    String? localDate,
    int? minutesFromMidnight,
    DateTime? scheduledAt,
    String? status,
    String? statusSource,
    Value<DateTime?> recordedAt = const Value.absent(),
    Value<DateTime?> postponeUntil = const Value.absent(),
    bool? supplyApplied,
  }) => DoseOccurrence(
    id: id ?? this.id,
    medicineId: medicineId ?? this.medicineId,
    localDate: localDate ?? this.localDate,
    minutesFromMidnight: minutesFromMidnight ?? this.minutesFromMidnight,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    status: status ?? this.status,
    statusSource: statusSource ?? this.statusSource,
    recordedAt: recordedAt.present ? recordedAt.value : this.recordedAt,
    postponeUntil: postponeUntil.present
        ? postponeUntil.value
        : this.postponeUntil,
    supplyApplied: supplyApplied ?? this.supplyApplied,
  );
  DoseOccurrence copyWithCompanion(DoseOccurrencesCompanion data) {
    return DoseOccurrence(
      id: data.id.present ? data.id.value : this.id,
      medicineId: data.medicineId.present
          ? data.medicineId.value
          : this.medicineId,
      localDate: data.localDate.present ? data.localDate.value : this.localDate,
      minutesFromMidnight: data.minutesFromMidnight.present
          ? data.minutesFromMidnight.value
          : this.minutesFromMidnight,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      status: data.status.present ? data.status.value : this.status,
      statusSource: data.statusSource.present
          ? data.statusSource.value
          : this.statusSource,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      postponeUntil: data.postponeUntil.present
          ? data.postponeUntil.value
          : this.postponeUntil,
      supplyApplied: data.supplyApplied.present
          ? data.supplyApplied.value
          : this.supplyApplied,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseOccurrence(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('localDate: $localDate, ')
          ..write('minutesFromMidnight: $minutesFromMidnight, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('status: $status, ')
          ..write('statusSource: $statusSource, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('postponeUntil: $postponeUntil, ')
          ..write('supplyApplied: $supplyApplied')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    medicineId,
    localDate,
    minutesFromMidnight,
    scheduledAt,
    status,
    statusSource,
    recordedAt,
    postponeUntil,
    supplyApplied,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseOccurrence &&
          other.id == this.id &&
          other.medicineId == this.medicineId &&
          other.localDate == this.localDate &&
          other.minutesFromMidnight == this.minutesFromMidnight &&
          other.scheduledAt == this.scheduledAt &&
          other.status == this.status &&
          other.statusSource == this.statusSource &&
          other.recordedAt == this.recordedAt &&
          other.postponeUntil == this.postponeUntil &&
          other.supplyApplied == this.supplyApplied);
}

class DoseOccurrencesCompanion extends UpdateCompanion<DoseOccurrence> {
  final Value<String> id;
  final Value<String> medicineId;
  final Value<String> localDate;
  final Value<int> minutesFromMidnight;
  final Value<DateTime> scheduledAt;
  final Value<String> status;
  final Value<String> statusSource;
  final Value<DateTime?> recordedAt;
  final Value<DateTime?> postponeUntil;
  final Value<bool> supplyApplied;
  final Value<int> rowid;
  const DoseOccurrencesCompanion({
    this.id = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.localDate = const Value.absent(),
    this.minutesFromMidnight = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.status = const Value.absent(),
    this.statusSource = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.postponeUntil = const Value.absent(),
    this.supplyApplied = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoseOccurrencesCompanion.insert({
    required String id,
    required String medicineId,
    required String localDate,
    required int minutesFromMidnight,
    required DateTime scheduledAt,
    required String status,
    this.statusSource = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.postponeUntil = const Value.absent(),
    this.supplyApplied = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       medicineId = Value(medicineId),
       localDate = Value(localDate),
       minutesFromMidnight = Value(minutesFromMidnight),
       scheduledAt = Value(scheduledAt),
       status = Value(status);
  static Insertable<DoseOccurrence> custom({
    Expression<String>? id,
    Expression<String>? medicineId,
    Expression<String>? localDate,
    Expression<int>? minutesFromMidnight,
    Expression<DateTime>? scheduledAt,
    Expression<String>? status,
    Expression<String>? statusSource,
    Expression<DateTime>? recordedAt,
    Expression<DateTime>? postponeUntil,
    Expression<bool>? supplyApplied,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineId != null) 'medicine_id': medicineId,
      if (localDate != null) 'local_date': localDate,
      if (minutesFromMidnight != null)
        'minutes_from_midnight': minutesFromMidnight,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (status != null) 'status': status,
      if (statusSource != null) 'status_source': statusSource,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (postponeUntil != null) 'postpone_until': postponeUntil,
      if (supplyApplied != null) 'supply_applied': supplyApplied,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoseOccurrencesCompanion copyWith({
    Value<String>? id,
    Value<String>? medicineId,
    Value<String>? localDate,
    Value<int>? minutesFromMidnight,
    Value<DateTime>? scheduledAt,
    Value<String>? status,
    Value<String>? statusSource,
    Value<DateTime?>? recordedAt,
    Value<DateTime?>? postponeUntil,
    Value<bool>? supplyApplied,
    Value<int>? rowid,
  }) {
    return DoseOccurrencesCompanion(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      localDate: localDate ?? this.localDate,
      minutesFromMidnight: minutesFromMidnight ?? this.minutesFromMidnight,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
      statusSource: statusSource ?? this.statusSource,
      recordedAt: recordedAt ?? this.recordedAt,
      postponeUntil: postponeUntil ?? this.postponeUntil,
      supplyApplied: supplyApplied ?? this.supplyApplied,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<String>(medicineId.value);
    }
    if (localDate.present) {
      map['local_date'] = Variable<String>(localDate.value);
    }
    if (minutesFromMidnight.present) {
      map['minutes_from_midnight'] = Variable<int>(minutesFromMidnight.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (statusSource.present) {
      map['status_source'] = Variable<String>(statusSource.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (postponeUntil.present) {
      map['postpone_until'] = Variable<DateTime>(postponeUntil.value);
    }
    if (supplyApplied.present) {
      map['supply_applied'] = Variable<bool>(supplyApplied.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseOccurrencesCompanion(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('localDate: $localDate, ')
          ..write('minutesFromMidnight: $minutesFromMidnight, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('status: $status, ')
          ..write('statusSource: $statusSource, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('postponeUntil: $postponeUntil, ')
          ..write('supplyApplied: $supplyApplied, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _onboardingCompleteMeta =
      const VerificationMeta('onboardingComplete');
  @override
  late final GeneratedColumn<bool> onboardingComplete = GeneratedColumn<bool>(
    'onboarding_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarding_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _localeCodeMeta = const VerificationMeta(
    'localeCode',
  );
  @override
  late final GeneratedColumn<String> localeCode = GeneratedColumn<String>(
    'locale_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('system'),
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _postponeMinutesMeta = const VerificationMeta(
    'postponeMinutes',
  );
  @override
  late final GeneratedColumn<int> postponeMinutes = GeneratedColumn<int>(
    'postpone_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(15),
  );
  static const VerificationMeta _lastTimezoneMeta = const VerificationMeta(
    'lastTimezone',
  );
  @override
  late final GeneratedColumn<String> lastTimezone = GeneratedColumn<String>(
    'last_timezone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    onboardingComplete,
    localeCode,
    themeMode,
    notificationsEnabled,
    postponeMinutes,
    lastTimezone,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('onboarding_complete')) {
      context.handle(
        _onboardingCompleteMeta,
        onboardingComplete.isAcceptableOrUnknown(
          data['onboarding_complete']!,
          _onboardingCompleteMeta,
        ),
      );
    }
    if (data.containsKey('locale_code')) {
      context.handle(
        _localeCodeMeta,
        localeCode.isAcceptableOrUnknown(data['locale_code']!, _localeCodeMeta),
      );
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('postpone_minutes')) {
      context.handle(
        _postponeMinutesMeta,
        postponeMinutes.isAcceptableOrUnknown(
          data['postpone_minutes']!,
          _postponeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('last_timezone')) {
      context.handle(
        _lastTimezoneMeta,
        lastTimezone.isAcceptableOrUnknown(
          data['last_timezone']!,
          _lastTimezoneMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      onboardingComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarding_complete'],
      )!,
      localeCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locale_code'],
      ),
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
      postponeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}postpone_minutes'],
      )!,
      lastTimezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_timezone'],
      ),
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final bool onboardingComplete;
  final String? localeCode;
  final String themeMode;
  final bool notificationsEnabled;
  final int postponeMinutes;
  final String? lastTimezone;
  const AppSetting({
    required this.id,
    required this.onboardingComplete,
    this.localeCode,
    required this.themeMode,
    required this.notificationsEnabled,
    required this.postponeMinutes,
    this.lastTimezone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['onboarding_complete'] = Variable<bool>(onboardingComplete);
    if (!nullToAbsent || localeCode != null) {
      map['locale_code'] = Variable<String>(localeCode);
    }
    map['theme_mode'] = Variable<String>(themeMode);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    map['postpone_minutes'] = Variable<int>(postponeMinutes);
    if (!nullToAbsent || lastTimezone != null) {
      map['last_timezone'] = Variable<String>(lastTimezone);
    }
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      onboardingComplete: Value(onboardingComplete),
      localeCode: localeCode == null && nullToAbsent
          ? const Value.absent()
          : Value(localeCode),
      themeMode: Value(themeMode),
      notificationsEnabled: Value(notificationsEnabled),
      postponeMinutes: Value(postponeMinutes),
      lastTimezone: lastTimezone == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTimezone),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      onboardingComplete: serializer.fromJson<bool>(json['onboardingComplete']),
      localeCode: serializer.fromJson<String?>(json['localeCode']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
      postponeMinutes: serializer.fromJson<int>(json['postponeMinutes']),
      lastTimezone: serializer.fromJson<String?>(json['lastTimezone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'onboardingComplete': serializer.toJson<bool>(onboardingComplete),
      'localeCode': serializer.toJson<String?>(localeCode),
      'themeMode': serializer.toJson<String>(themeMode),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'postponeMinutes': serializer.toJson<int>(postponeMinutes),
      'lastTimezone': serializer.toJson<String?>(lastTimezone),
    };
  }

  AppSetting copyWith({
    int? id,
    bool? onboardingComplete,
    Value<String?> localeCode = const Value.absent(),
    String? themeMode,
    bool? notificationsEnabled,
    int? postponeMinutes,
    Value<String?> lastTimezone = const Value.absent(),
  }) => AppSetting(
    id: id ?? this.id,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    localeCode: localeCode.present ? localeCode.value : this.localeCode,
    themeMode: themeMode ?? this.themeMode,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    postponeMinutes: postponeMinutes ?? this.postponeMinutes,
    lastTimezone: lastTimezone.present ? lastTimezone.value : this.lastTimezone,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      onboardingComplete: data.onboardingComplete.present
          ? data.onboardingComplete.value
          : this.onboardingComplete,
      localeCode: data.localeCode.present
          ? data.localeCode.value
          : this.localeCode,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      postponeMinutes: data.postponeMinutes.present
          ? data.postponeMinutes.value
          : this.postponeMinutes,
      lastTimezone: data.lastTimezone.present
          ? data.lastTimezone.value
          : this.lastTimezone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('onboardingComplete: $onboardingComplete, ')
          ..write('localeCode: $localeCode, ')
          ..write('themeMode: $themeMode, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('postponeMinutes: $postponeMinutes, ')
          ..write('lastTimezone: $lastTimezone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    onboardingComplete,
    localeCode,
    themeMode,
    notificationsEnabled,
    postponeMinutes,
    lastTimezone,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.onboardingComplete == this.onboardingComplete &&
          other.localeCode == this.localeCode &&
          other.themeMode == this.themeMode &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.postponeMinutes == this.postponeMinutes &&
          other.lastTimezone == this.lastTimezone);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<bool> onboardingComplete;
  final Value<String?> localeCode;
  final Value<String> themeMode;
  final Value<bool> notificationsEnabled;
  final Value<int> postponeMinutes;
  final Value<String?> lastTimezone;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.onboardingComplete = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.postponeMinutes = const Value.absent(),
    this.lastTimezone = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.onboardingComplete = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.postponeMinutes = const Value.absent(),
    this.lastTimezone = const Value.absent(),
  });
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<bool>? onboardingComplete,
    Expression<String>? localeCode,
    Expression<String>? themeMode,
    Expression<bool>? notificationsEnabled,
    Expression<int>? postponeMinutes,
    Expression<String>? lastTimezone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (onboardingComplete != null) 'onboarding_complete': onboardingComplete,
      if (localeCode != null) 'locale_code': localeCode,
      if (themeMode != null) 'theme_mode': themeMode,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (postponeMinutes != null) 'postpone_minutes': postponeMinutes,
      if (lastTimezone != null) 'last_timezone': lastTimezone,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? id,
    Value<bool>? onboardingComplete,
    Value<String?>? localeCode,
    Value<String>? themeMode,
    Value<bool>? notificationsEnabled,
    Value<int>? postponeMinutes,
    Value<String?>? lastTimezone,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      onboardingComplete: onboardingComplete ?? this.onboardingComplete,
      localeCode: localeCode ?? this.localeCode,
      themeMode: themeMode ?? this.themeMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      postponeMinutes: postponeMinutes ?? this.postponeMinutes,
      lastTimezone: lastTimezone ?? this.lastTimezone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (onboardingComplete.present) {
      map['onboarding_complete'] = Variable<bool>(onboardingComplete.value);
    }
    if (localeCode.present) {
      map['locale_code'] = Variable<String>(localeCode.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (postponeMinutes.present) {
      map['postpone_minutes'] = Variable<int>(postponeMinutes.value);
    }
    if (lastTimezone.present) {
      map['last_timezone'] = Variable<String>(lastTimezone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('onboardingComplete: $onboardingComplete, ')
          ..write('localeCode: $localeCode, ')
          ..write('themeMode: $themeMode, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('postponeMinutes: $postponeMinutes, ')
          ..write('lastTimezone: $lastTimezone')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MedicinesTable medicines = $MedicinesTable(this);
  late final $ScheduleSlotsTable scheduleSlots = $ScheduleSlotsTable(this);
  late final $PauseIntervalsTable pauseIntervals = $PauseIntervalsTable(this);
  late final $DoseOccurrencesTable doseOccurrences = $DoseOccurrencesTable(
    this,
  );
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    medicines,
    scheduleSlots,
    pauseIntervals,
    doseOccurrences,
    appSettings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'medicines',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('schedule_slots', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'medicines',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('pause_intervals', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'medicines',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('dose_occurrences', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$MedicinesTableCreateCompanionBuilder =
    MedicinesCompanion Function({
      required String id,
      required String name,
      required String doseAmount,
      required String doseUnit,
      required String form,
      Value<String> notes,
      Value<String> instructions,
      required String startDate,
      Value<String?> endDate,
      required int weekdayMask,
      required int color,
      Value<String?> photoPath,
      Value<double?> supplyQuantity,
      Value<double?> refillThreshold,
      Value<bool> refillAlertActive,
      required DateTime scheduleRevisedAt,
      Value<DateTime?> archivedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$MedicinesTableUpdateCompanionBuilder =
    MedicinesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> doseAmount,
      Value<String> doseUnit,
      Value<String> form,
      Value<String> notes,
      Value<String> instructions,
      Value<String> startDate,
      Value<String?> endDate,
      Value<int> weekdayMask,
      Value<int> color,
      Value<String?> photoPath,
      Value<double?> supplyQuantity,
      Value<double?> refillThreshold,
      Value<bool> refillAlertActive,
      Value<DateTime> scheduleRevisedAt,
      Value<DateTime?> archivedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$MedicinesTableReferences
    extends BaseReferences<_$AppDatabase, $MedicinesTable, Medicine> {
  $$MedicinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ScheduleSlotsTable, List<ScheduleSlot>>
  _scheduleSlotsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.scheduleSlots,
    aliasName: 'medicines__id__schedule_slots__medicine_id',
  );

  $$ScheduleSlotsTableProcessedTableManager get scheduleSlotsRefs {
    final manager = $$ScheduleSlotsTableTableManager(
      $_db,
      $_db.scheduleSlots,
    ).filter((f) => f.medicineId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_scheduleSlotsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PauseIntervalsTable, List<PauseInterval>>
  _pauseIntervalsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pauseIntervals,
    aliasName: 'medicines__id__pause_intervals__medicine_id',
  );

  $$PauseIntervalsTableProcessedTableManager get pauseIntervalsRefs {
    final manager = $$PauseIntervalsTableTableManager(
      $_db,
      $_db.pauseIntervals,
    ).filter((f) => f.medicineId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_pauseIntervalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DoseOccurrencesTable, List<DoseOccurrence>>
  _doseOccurrencesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.doseOccurrences,
    aliasName: 'medicines__id__dose_occurrences__medicine_id',
  );

  $$DoseOccurrencesTableProcessedTableManager get doseOccurrencesRefs {
    final manager = $$DoseOccurrencesTableTableManager(
      $_db,
      $_db.doseOccurrences,
    ).filter((f) => f.medicineId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _doseOccurrencesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedicinesTableFilterComposer
    extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doseUnit => $composableBuilder(
    column: $table.doseUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get form => $composableBuilder(
    column: $table.form,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekdayMask => $composableBuilder(
    column: $table.weekdayMask,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get supplyQuantity => $composableBuilder(
    column: $table.supplyQuantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get refillThreshold => $composableBuilder(
    column: $table.refillThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get refillAlertActive => $composableBuilder(
    column: $table.refillAlertActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduleRevisedAt => $composableBuilder(
    column: $table.scheduleRevisedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> scheduleSlotsRefs(
    Expression<bool> Function($$ScheduleSlotsTableFilterComposer f) f,
  ) {
    final $$ScheduleSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleSlots,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleSlotsTableFilterComposer(
            $db: $db,
            $table: $db.scheduleSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pauseIntervalsRefs(
    Expression<bool> Function($$PauseIntervalsTableFilterComposer f) f,
  ) {
    final $$PauseIntervalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pauseIntervals,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PauseIntervalsTableFilterComposer(
            $db: $db,
            $table: $db.pauseIntervals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> doseOccurrencesRefs(
    Expression<bool> Function($$DoseOccurrencesTableFilterComposer f) f,
  ) {
    final $$DoseOccurrencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseOccurrences,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseOccurrencesTableFilterComposer(
            $db: $db,
            $table: $db.doseOccurrences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicinesTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doseUnit => $composableBuilder(
    column: $table.doseUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get form => $composableBuilder(
    column: $table.form,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekdayMask => $composableBuilder(
    column: $table.weekdayMask,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get supplyQuantity => $composableBuilder(
    column: $table.supplyQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get refillThreshold => $composableBuilder(
    column: $table.refillThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get refillAlertActive => $composableBuilder(
    column: $table.refillAlertActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduleRevisedAt => $composableBuilder(
    column: $table.scheduleRevisedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get doseUnit =>
      $composableBuilder(column: $table.doseUnit, builder: (column) => column);

  GeneratedColumn<String> get form =>
      $composableBuilder(column: $table.form, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<int> get weekdayMask => $composableBuilder(
    column: $table.weekdayMask,
    builder: (column) => column,
  );

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<double> get supplyQuantity => $composableBuilder(
    column: $table.supplyQuantity,
    builder: (column) => column,
  );

  GeneratedColumn<double> get refillThreshold => $composableBuilder(
    column: $table.refillThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get refillAlertActive => $composableBuilder(
    column: $table.refillAlertActive,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduleRevisedAt => $composableBuilder(
    column: $table.scheduleRevisedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> scheduleSlotsRefs<T extends Object>(
    Expression<T> Function($$ScheduleSlotsTableAnnotationComposer a) f,
  ) {
    final $$ScheduleSlotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleSlots,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleSlotsTableAnnotationComposer(
            $db: $db,
            $table: $db.scheduleSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> pauseIntervalsRefs<T extends Object>(
    Expression<T> Function($$PauseIntervalsTableAnnotationComposer a) f,
  ) {
    final $$PauseIntervalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pauseIntervals,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PauseIntervalsTableAnnotationComposer(
            $db: $db,
            $table: $db.pauseIntervals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> doseOccurrencesRefs<T extends Object>(
    Expression<T> Function($$DoseOccurrencesTableAnnotationComposer a) f,
  ) {
    final $$DoseOccurrencesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseOccurrences,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseOccurrencesTableAnnotationComposer(
            $db: $db,
            $table: $db.doseOccurrences,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicinesTable,
          Medicine,
          $$MedicinesTableFilterComposer,
          $$MedicinesTableOrderingComposer,
          $$MedicinesTableAnnotationComposer,
          $$MedicinesTableCreateCompanionBuilder,
          $$MedicinesTableUpdateCompanionBuilder,
          (Medicine, $$MedicinesTableReferences),
          Medicine,
          PrefetchHooks Function({
            bool scheduleSlotsRefs,
            bool pauseIntervalsRefs,
            bool doseOccurrencesRefs,
          })
        > {
  $$MedicinesTableTableManager(_$AppDatabase db, $MedicinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> doseAmount = const Value.absent(),
                Value<String> doseUnit = const Value.absent(),
                Value<String> form = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<String> startDate = const Value.absent(),
                Value<String?> endDate = const Value.absent(),
                Value<int> weekdayMask = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<double?> supplyQuantity = const Value.absent(),
                Value<double?> refillThreshold = const Value.absent(),
                Value<bool> refillAlertActive = const Value.absent(),
                Value<DateTime> scheduleRevisedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicinesCompanion(
                id: id,
                name: name,
                doseAmount: doseAmount,
                doseUnit: doseUnit,
                form: form,
                notes: notes,
                instructions: instructions,
                startDate: startDate,
                endDate: endDate,
                weekdayMask: weekdayMask,
                color: color,
                photoPath: photoPath,
                supplyQuantity: supplyQuantity,
                refillThreshold: refillThreshold,
                refillAlertActive: refillAlertActive,
                scheduleRevisedAt: scheduleRevisedAt,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String doseAmount,
                required String doseUnit,
                required String form,
                Value<String> notes = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                required String startDate,
                Value<String?> endDate = const Value.absent(),
                required int weekdayMask,
                required int color,
                Value<String?> photoPath = const Value.absent(),
                Value<double?> supplyQuantity = const Value.absent(),
                Value<double?> refillThreshold = const Value.absent(),
                Value<bool> refillAlertActive = const Value.absent(),
                required DateTime scheduleRevisedAt,
                Value<DateTime?> archivedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MedicinesCompanion.insert(
                id: id,
                name: name,
                doseAmount: doseAmount,
                doseUnit: doseUnit,
                form: form,
                notes: notes,
                instructions: instructions,
                startDate: startDate,
                endDate: endDate,
                weekdayMask: weekdayMask,
                color: color,
                photoPath: photoPath,
                supplyQuantity: supplyQuantity,
                refillThreshold: refillThreshold,
                refillAlertActive: refillAlertActive,
                scheduleRevisedAt: scheduleRevisedAt,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MedicinesTable, Medicine>(table),
                  $$MedicinesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                scheduleSlotsRefs = false,
                pauseIntervalsRefs = false,
                doseOccurrencesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (scheduleSlotsRefs) db.scheduleSlots,
                    if (pauseIntervalsRefs) db.pauseIntervals,
                    if (doseOccurrencesRefs) db.doseOccurrences,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (scheduleSlotsRefs)
                        await $_getPrefetchedData<
                          Medicine,
                          $MedicinesTable,
                          ScheduleSlot
                        >(
                          currentTable: table,
                          referencedTable: $$MedicinesTableReferences
                              ._scheduleSlotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicinesTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduleSlotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicineId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (pauseIntervalsRefs)
                        await $_getPrefetchedData<
                          Medicine,
                          $MedicinesTable,
                          PauseInterval
                        >(
                          currentTable: table,
                          referencedTable: $$MedicinesTableReferences
                              ._pauseIntervalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicinesTableReferences(
                                db,
                                table,
                                p0,
                              ).pauseIntervalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicineId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (doseOccurrencesRefs)
                        await $_getPrefetchedData<
                          Medicine,
                          $MedicinesTable,
                          DoseOccurrence
                        >(
                          currentTable: table,
                          referencedTable: $$MedicinesTableReferences
                              ._doseOccurrencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicinesTableReferences(
                                db,
                                table,
                                p0,
                              ).doseOccurrencesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicineId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MedicinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicinesTable,
      Medicine,
      $$MedicinesTableFilterComposer,
      $$MedicinesTableOrderingComposer,
      $$MedicinesTableAnnotationComposer,
      $$MedicinesTableCreateCompanionBuilder,
      $$MedicinesTableUpdateCompanionBuilder,
      (Medicine, $$MedicinesTableReferences),
      Medicine,
      PrefetchHooks Function({
        bool scheduleSlotsRefs,
        bool pauseIntervalsRefs,
        bool doseOccurrencesRefs,
      })
    >;
typedef $$ScheduleSlotsTableCreateCompanionBuilder =
    ScheduleSlotsCompanion Function({
      required String id,
      required String medicineId,
      required int minutesFromMidnight,
      Value<int> rowid,
    });
typedef $$ScheduleSlotsTableUpdateCompanionBuilder =
    ScheduleSlotsCompanion Function({
      Value<String> id,
      Value<String> medicineId,
      Value<int> minutesFromMidnight,
      Value<int> rowid,
    });

final class $$ScheduleSlotsTableReferences
    extends BaseReferences<_$AppDatabase, $ScheduleSlotsTable, ScheduleSlot> {
  $$ScheduleSlotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicinesTable _medicineIdTable(_$AppDatabase db) =>
      db.medicines.createAlias('schedule_slots__medicine_id__medicines__id');

  $$MedicinesTableProcessedTableManager get medicineId {
    final $_column = $_itemColumn<String>('medicine_id')!;

    final manager = $$MedicinesTableTableManager(
      $_db,
      $_db.medicines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScheduleSlotsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleSlotsTable> {
  $$ScheduleSlotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutesFromMidnight => $composableBuilder(
    column: $table.minutesFromMidnight,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicinesTableFilterComposer get medicineId {
    final $$MedicinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableFilterComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleSlotsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleSlotsTable> {
  $$ScheduleSlotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutesFromMidnight => $composableBuilder(
    column: $table.minutesFromMidnight,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicinesTableOrderingComposer get medicineId {
    final $$MedicinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableOrderingComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleSlotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleSlotsTable> {
  $$ScheduleSlotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get minutesFromMidnight => $composableBuilder(
    column: $table.minutesFromMidnight,
    builder: (column) => column,
  );

  $$MedicinesTableAnnotationComposer get medicineId {
    final $$MedicinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableAnnotationComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleSlotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleSlotsTable,
          ScheduleSlot,
          $$ScheduleSlotsTableFilterComposer,
          $$ScheduleSlotsTableOrderingComposer,
          $$ScheduleSlotsTableAnnotationComposer,
          $$ScheduleSlotsTableCreateCompanionBuilder,
          $$ScheduleSlotsTableUpdateCompanionBuilder,
          (ScheduleSlot, $$ScheduleSlotsTableReferences),
          ScheduleSlot,
          PrefetchHooks Function({bool medicineId})
        > {
  $$ScheduleSlotsTableTableManager(_$AppDatabase db, $ScheduleSlotsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScheduleSlotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScheduleSlotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScheduleSlotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> medicineId = const Value.absent(),
                Value<int> minutesFromMidnight = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScheduleSlotsCompanion(
                id: id,
                medicineId: medicineId,
                minutesFromMidnight: minutesFromMidnight,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String medicineId,
                required int minutesFromMidnight,
                Value<int> rowid = const Value.absent(),
              }) => ScheduleSlotsCompanion.insert(
                id: id,
                medicineId: medicineId,
                minutesFromMidnight: minutesFromMidnight,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ScheduleSlotsTable, ScheduleSlot>(table),
                  $$ScheduleSlotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicineId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicineId,
                                referencedTable: $$ScheduleSlotsTableReferences
                                    ._medicineIdTable(db),
                                referencedColumn: $$ScheduleSlotsTableReferences
                                    ._medicineIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ScheduleSlotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleSlotsTable,
      ScheduleSlot,
      $$ScheduleSlotsTableFilterComposer,
      $$ScheduleSlotsTableOrderingComposer,
      $$ScheduleSlotsTableAnnotationComposer,
      $$ScheduleSlotsTableCreateCompanionBuilder,
      $$ScheduleSlotsTableUpdateCompanionBuilder,
      (ScheduleSlot, $$ScheduleSlotsTableReferences),
      ScheduleSlot,
      PrefetchHooks Function({bool medicineId})
    >;
typedef $$PauseIntervalsTableCreateCompanionBuilder =
    PauseIntervalsCompanion Function({
      required String id,
      required String medicineId,
      required DateTime startedAt,
      Value<DateTime?> endedAt,
      Value<int> rowid,
    });
typedef $$PauseIntervalsTableUpdateCompanionBuilder =
    PauseIntervalsCompanion Function({
      Value<String> id,
      Value<String> medicineId,
      Value<DateTime> startedAt,
      Value<DateTime?> endedAt,
      Value<int> rowid,
    });

final class $$PauseIntervalsTableReferences
    extends BaseReferences<_$AppDatabase, $PauseIntervalsTable, PauseInterval> {
  $$PauseIntervalsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicinesTable _medicineIdTable(_$AppDatabase db) =>
      db.medicines.createAlias('pause_intervals__medicine_id__medicines__id');

  $$MedicinesTableProcessedTableManager get medicineId {
    final $_column = $_itemColumn<String>('medicine_id')!;

    final manager = $$MedicinesTableTableManager(
      $_db,
      $_db.medicines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PauseIntervalsTableFilterComposer
    extends Composer<_$AppDatabase, $PauseIntervalsTable> {
  $$PauseIntervalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicinesTableFilterComposer get medicineId {
    final $$MedicinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableFilterComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PauseIntervalsTableOrderingComposer
    extends Composer<_$AppDatabase, $PauseIntervalsTable> {
  $$PauseIntervalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicinesTableOrderingComposer get medicineId {
    final $$MedicinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableOrderingComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PauseIntervalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PauseIntervalsTable> {
  $$PauseIntervalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  $$MedicinesTableAnnotationComposer get medicineId {
    final $$MedicinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableAnnotationComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PauseIntervalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PauseIntervalsTable,
          PauseInterval,
          $$PauseIntervalsTableFilterComposer,
          $$PauseIntervalsTableOrderingComposer,
          $$PauseIntervalsTableAnnotationComposer,
          $$PauseIntervalsTableCreateCompanionBuilder,
          $$PauseIntervalsTableUpdateCompanionBuilder,
          (PauseInterval, $$PauseIntervalsTableReferences),
          PauseInterval,
          PrefetchHooks Function({bool medicineId})
        > {
  $$PauseIntervalsTableTableManager(
    _$AppDatabase db,
    $PauseIntervalsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PauseIntervalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PauseIntervalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PauseIntervalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> medicineId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PauseIntervalsCompanion(
                id: id,
                medicineId: medicineId,
                startedAt: startedAt,
                endedAt: endedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String medicineId,
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PauseIntervalsCompanion.insert(
                id: id,
                medicineId: medicineId,
                startedAt: startedAt,
                endedAt: endedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PauseIntervalsTable, PauseInterval>(table),
                  $$PauseIntervalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicineId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicineId,
                                referencedTable: $$PauseIntervalsTableReferences
                                    ._medicineIdTable(db),
                                referencedColumn:
                                    $$PauseIntervalsTableReferences
                                        ._medicineIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PauseIntervalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PauseIntervalsTable,
      PauseInterval,
      $$PauseIntervalsTableFilterComposer,
      $$PauseIntervalsTableOrderingComposer,
      $$PauseIntervalsTableAnnotationComposer,
      $$PauseIntervalsTableCreateCompanionBuilder,
      $$PauseIntervalsTableUpdateCompanionBuilder,
      (PauseInterval, $$PauseIntervalsTableReferences),
      PauseInterval,
      PrefetchHooks Function({bool medicineId})
    >;
typedef $$DoseOccurrencesTableCreateCompanionBuilder =
    DoseOccurrencesCompanion Function({
      required String id,
      required String medicineId,
      required String localDate,
      required int minutesFromMidnight,
      required DateTime scheduledAt,
      required String status,
      Value<String> statusSource,
      Value<DateTime?> recordedAt,
      Value<DateTime?> postponeUntil,
      Value<bool> supplyApplied,
      Value<int> rowid,
    });
typedef $$DoseOccurrencesTableUpdateCompanionBuilder =
    DoseOccurrencesCompanion Function({
      Value<String> id,
      Value<String> medicineId,
      Value<String> localDate,
      Value<int> minutesFromMidnight,
      Value<DateTime> scheduledAt,
      Value<String> status,
      Value<String> statusSource,
      Value<DateTime?> recordedAt,
      Value<DateTime?> postponeUntil,
      Value<bool> supplyApplied,
      Value<int> rowid,
    });

final class $$DoseOccurrencesTableReferences
    extends
        BaseReferences<_$AppDatabase, $DoseOccurrencesTable, DoseOccurrence> {
  $$DoseOccurrencesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicinesTable _medicineIdTable(_$AppDatabase db) =>
      db.medicines.createAlias('dose_occurrences__medicine_id__medicines__id');

  $$MedicinesTableProcessedTableManager get medicineId {
    final $_column = $_itemColumn<String>('medicine_id')!;

    final manager = $$MedicinesTableTableManager(
      $_db,
      $_db.medicines,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DoseOccurrencesTableFilterComposer
    extends Composer<_$AppDatabase, $DoseOccurrencesTable> {
  $$DoseOccurrencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localDate => $composableBuilder(
    column: $table.localDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutesFromMidnight => $composableBuilder(
    column: $table.minutesFromMidnight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusSource => $composableBuilder(
    column: $table.statusSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get postponeUntil => $composableBuilder(
    column: $table.postponeUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supplyApplied => $composableBuilder(
    column: $table.supplyApplied,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicinesTableFilterComposer get medicineId {
    final $$MedicinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableFilterComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseOccurrencesTableOrderingComposer
    extends Composer<_$AppDatabase, $DoseOccurrencesTable> {
  $$DoseOccurrencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localDate => $composableBuilder(
    column: $table.localDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutesFromMidnight => $composableBuilder(
    column: $table.minutesFromMidnight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusSource => $composableBuilder(
    column: $table.statusSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get postponeUntil => $composableBuilder(
    column: $table.postponeUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supplyApplied => $composableBuilder(
    column: $table.supplyApplied,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicinesTableOrderingComposer get medicineId {
    final $$MedicinesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableOrderingComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseOccurrencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoseOccurrencesTable> {
  $$DoseOccurrencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localDate =>
      $composableBuilder(column: $table.localDate, builder: (column) => column);

  GeneratedColumn<int> get minutesFromMidnight => $composableBuilder(
    column: $table.minutesFromMidnight,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get statusSource => $composableBuilder(
    column: $table.statusSource,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get postponeUntil => $composableBuilder(
    column: $table.postponeUntil,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supplyApplied => $composableBuilder(
    column: $table.supplyApplied,
    builder: (column) => column,
  );

  $$MedicinesTableAnnotationComposer get medicineId {
    final $$MedicinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicines,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicinesTableAnnotationComposer(
            $db: $db,
            $table: $db.medicines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseOccurrencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoseOccurrencesTable,
          DoseOccurrence,
          $$DoseOccurrencesTableFilterComposer,
          $$DoseOccurrencesTableOrderingComposer,
          $$DoseOccurrencesTableAnnotationComposer,
          $$DoseOccurrencesTableCreateCompanionBuilder,
          $$DoseOccurrencesTableUpdateCompanionBuilder,
          (DoseOccurrence, $$DoseOccurrencesTableReferences),
          DoseOccurrence,
          PrefetchHooks Function({bool medicineId})
        > {
  $$DoseOccurrencesTableTableManager(
    _$AppDatabase db,
    $DoseOccurrencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseOccurrencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseOccurrencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseOccurrencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> medicineId = const Value.absent(),
                Value<String> localDate = const Value.absent(),
                Value<int> minutesFromMidnight = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> statusSource = const Value.absent(),
                Value<DateTime?> recordedAt = const Value.absent(),
                Value<DateTime?> postponeUntil = const Value.absent(),
                Value<bool> supplyApplied = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseOccurrencesCompanion(
                id: id,
                medicineId: medicineId,
                localDate: localDate,
                minutesFromMidnight: minutesFromMidnight,
                scheduledAt: scheduledAt,
                status: status,
                statusSource: statusSource,
                recordedAt: recordedAt,
                postponeUntil: postponeUntil,
                supplyApplied: supplyApplied,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String medicineId,
                required String localDate,
                required int minutesFromMidnight,
                required DateTime scheduledAt,
                required String status,
                Value<String> statusSource = const Value.absent(),
                Value<DateTime?> recordedAt = const Value.absent(),
                Value<DateTime?> postponeUntil = const Value.absent(),
                Value<bool> supplyApplied = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseOccurrencesCompanion.insert(
                id: id,
                medicineId: medicineId,
                localDate: localDate,
                minutesFromMidnight: minutesFromMidnight,
                scheduledAt: scheduledAt,
                status: status,
                statusSource: statusSource,
                recordedAt: recordedAt,
                postponeUntil: postponeUntil,
                supplyApplied: supplyApplied,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DoseOccurrencesTable, DoseOccurrence>(table),
                  $$DoseOccurrencesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicineId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicineId,
                                referencedTable:
                                    $$DoseOccurrencesTableReferences
                                        ._medicineIdTable(db),
                                referencedColumn:
                                    $$DoseOccurrencesTableReferences
                                        ._medicineIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DoseOccurrencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoseOccurrencesTable,
      DoseOccurrence,
      $$DoseOccurrencesTableFilterComposer,
      $$DoseOccurrencesTableOrderingComposer,
      $$DoseOccurrencesTableAnnotationComposer,
      $$DoseOccurrencesTableCreateCompanionBuilder,
      $$DoseOccurrencesTableUpdateCompanionBuilder,
      (DoseOccurrence, $$DoseOccurrencesTableReferences),
      DoseOccurrence,
      PrefetchHooks Function({bool medicineId})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<bool> onboardingComplete,
      Value<String?> localeCode,
      Value<String> themeMode,
      Value<bool> notificationsEnabled,
      Value<int> postponeMinutes,
      Value<String?> lastTimezone,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<bool> onboardingComplete,
      Value<String?> localeCode,
      Value<String> themeMode,
      Value<bool> notificationsEnabled,
      Value<int> postponeMinutes,
      Value<String?> lastTimezone,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get postponeMinutes => $composableBuilder(
    column: $table.postponeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastTimezone => $composableBuilder(
    column: $table.lastTimezone,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get postponeMinutes => $composableBuilder(
    column: $table.postponeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastTimezone => $composableBuilder(
    column: $table.lastTimezone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get postponeMinutes => $composableBuilder(
    column: $table.postponeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastTimezone => $composableBuilder(
    column: $table.lastTimezone,
    builder: (column) => column,
  );
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> onboardingComplete = const Value.absent(),
                Value<String?> localeCode = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<int> postponeMinutes = const Value.absent(),
                Value<String?> lastTimezone = const Value.absent(),
              }) => AppSettingsCompanion(
                id: id,
                onboardingComplete: onboardingComplete,
                localeCode: localeCode,
                themeMode: themeMode,
                notificationsEnabled: notificationsEnabled,
                postponeMinutes: postponeMinutes,
                lastTimezone: lastTimezone,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> onboardingComplete = const Value.absent(),
                Value<String?> localeCode = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<int> postponeMinutes = const Value.absent(),
                Value<String?> lastTimezone = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                id: id,
                onboardingComplete: onboardingComplete,
                localeCode: localeCode,
                themeMode: themeMode,
                notificationsEnabled: notificationsEnabled,
                postponeMinutes: postponeMinutes,
                lastTimezone: lastTimezone,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingsTable, AppSetting>(table),
                  BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MedicinesTableTableManager get medicines =>
      $$MedicinesTableTableManager(_db, _db.medicines);
  $$ScheduleSlotsTableTableManager get scheduleSlots =>
      $$ScheduleSlotsTableTableManager(_db, _db.scheduleSlots);
  $$PauseIntervalsTableTableManager get pauseIntervals =>
      $$PauseIntervalsTableTableManager(_db, _db.pauseIntervals);
  $$DoseOccurrencesTableTableManager get doseOccurrences =>
      $$DoseOccurrencesTableTableManager(_db, _db.doseOccurrences);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
