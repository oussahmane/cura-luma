import 'dart:convert';

class BackupException implements Exception {
  BackupException(this.code);

  final String code;

  @override
  String toString() => 'BackupException($code)';
}

class BackupBundle {
  const BackupBundle({
    required this.exportedAt,
    required this.preferences,
    required this.medicines,
    required this.slots,
    required this.pauses,
    required this.occurrences,
    required this.photos,
  });

  static const schemaVersion = 1;

  final String exportedAt;
  final Map<String, Object?> preferences;
  final List<Map<String, Object?>> medicines;
  final List<Map<String, Object?>> slots;
  final List<Map<String, Object?>> pauses;
  final List<Map<String, Object?>> occurrences;
  final List<Map<String, Object?>> photos;

  String encode() {
    return const JsonEncoder.withIndent('  ').convert({
      'schemaVersion': schemaVersion,
      'exportedAt': exportedAt,
      'preferences': preferences,
      'medicines': medicines,
      'slots': slots,
      'pauses': pauses,
      'occurrences': occurrences,
      'photos': photos,
    });
  }
}

const _statuses = {'pending', 'taken', 'skipped', 'missed', 'postponed', 'paused'};
const _sources = {'none', 'user', 'system'};
const _forms = {'tablet', 'capsule', 'liquid', 'drops', 'injection', 'other'};
const _themes = {'system', 'light', 'dark'};

BackupBundle decodeBackup(String raw) {
  Object? decoded;
  try {
    decoded = jsonDecode(raw);
  } on FormatException {
    throw BackupException('invalid');
  }
  if (decoded is! Map) {
    throw BackupException('invalid');
  }
  final root = decoded.cast<String, Object?>();
  if (root['schemaVersion'] != BackupBundle.schemaVersion) {
    throw BackupException('schema');
  }
  final preferences = _map(root['preferences'], 'preferences');
  _preferences(preferences);
  final medicines = _mapList(root['medicines'], 'medicines');
  final medicineIds = <String>{};
  for (final medicine in medicines) {
    final id = _string(medicine, 'id');
    if (id.isEmpty || !medicineIds.add(id)) {
      throw BackupException('medicine');
    }
    _requiredText(medicine, 'name', 80);
    _requiredText(medicine, 'doseAmount', 40);
    _requiredText(medicine, 'doseUnit', 24);
    final form = _string(medicine, 'form');
    if (!_forms.contains(form)) {
      throw BackupException('medicine');
    }
    _optionalText(medicine, 'notes', 500);
    _optionalText(medicine, 'instructions', 500);
    if (_date(medicine['startDate']) == null) {
      throw BackupException('medicine');
    }
    final end = medicine['endDate'];
    if (end != null && _date(end) == null) {
      throw BackupException('medicine');
    }
    final mask = medicine['weekdayMask'];
    if (mask is! int || mask < 1 || mask > 127) {
      throw BackupException('medicine');
    }
    if (medicine['color'] is! int) {
      throw BackupException('medicine');
    }
    _optionalNumber(medicine, 'supplyQuantity');
    _optionalNumber(medicine, 'refillThreshold');
    if (medicine['refillAlertActive'] is! bool) {
      throw BackupException('medicine');
    }
    _requiredInstant(medicine, 'scheduleRevisedAt');
    _optionalInstant(medicine, 'archivedAt');
    _requiredInstant(medicine, 'createdAt');
    _requiredInstant(medicine, 'updatedAt');
    final photo = medicine['photoPath'];
    if (photo != null && photo is! String) {
      throw BackupException('medicine');
    }
  }

  final slots = _mapList(root['slots'], 'slots');
  final slotIds = <String>{};
  for (final slot in slots) {
    final id = _string(slot, 'id');
    if (id.isEmpty || !slotIds.add(id)) {
      throw BackupException('slot');
    }
    if (!medicineIds.contains(_string(slot, 'medicineId'))) {
      throw BackupException('slot');
    }
    final minutes = slot['minutesFromMidnight'];
    if (minutes is! int || minutes < 0 || minutes > 1439) {
      throw BackupException('slot');
    }
  }

  final pauses = _mapList(root['pauses'], 'pauses');
  for (final pause in pauses) {
    if (_string(pause, 'id').isEmpty || !medicineIds.contains(_string(pause, 'medicineId'))) {
      throw BackupException('pause');
    }
    _requiredInstant(pause, 'startedAt');
    _optionalInstant(pause, 'endedAt');
  }

  final occurrences = _mapList(root['occurrences'], 'occurrences');
  final occurrenceIds = <String>{};
  for (final occurrence in occurrences) {
    final id = _string(occurrence, 'id');
    if (id.isEmpty || !occurrenceIds.add(id)) {
      throw BackupException('occurrence');
    }
    final medicineId = _string(occurrence, 'medicineId');
    if (!medicineIds.contains(medicineId)) {
      throw BackupException('occurrence');
    }
    if (_date(occurrence['localDate']) == null) {
      throw BackupException('occurrence');
    }
    final minutes = occurrence['minutesFromMidnight'];
    if (minutes is! int || minutes < 0 || minutes > 1439) {
      throw BackupException('occurrence');
    }
    if (id != '$medicineId|${occurrence['localDate']}|$minutes') {
      throw BackupException('occurrence');
    }
    if (!_statuses.contains(_string(occurrence, 'status'))) {
      throw BackupException('occurrence');
    }
    if (!_sources.contains(_string(occurrence, 'statusSource'))) {
      throw BackupException('occurrence');
    }
    _requiredInstant(occurrence, 'scheduledAt');
    _optionalInstant(occurrence, 'recordedAt');
    _optionalInstant(occurrence, 'postponeUntil');
    if (occurrence['supplyApplied'] is! bool) {
      throw BackupException('occurrence');
    }
  }

  final photos = _mapList(root['photos'], 'photos');
  for (final photo in photos) {
    if (!medicineIds.contains(_string(photo, 'medicineId'))) {
      throw BackupException('photo');
    }
    final bytes = photo['base64'];
    if (bytes is! String) {
      throw BackupException('photo');
    }
    try {
      base64Decode(bytes);
    } on FormatException {
      throw BackupException('photo');
    }
  }

  return BackupBundle(
    exportedAt: root['exportedAt'] is String ? root['exportedAt']! as String : '',
    preferences: preferences,
    medicines: medicines,
    slots: slots,
    pauses: pauses,
    occurrences: occurrences,
    photos: photos,
  );
}

void _preferences(Map<String, Object?> preferences) {
  for (final key in ['onboardingComplete', 'notificationsEnabled']) {
    if (preferences[key] is! bool) {
      throw BackupException('preferences');
    }
  }
  final theme = preferences['themeMode'];
  if (theme is! String || !_themes.contains(theme)) {
    throw BackupException('preferences');
  }
  final locale = preferences['localeCode'];
  if (locale != null && locale != 'en' && locale != 'fr' && locale != 'ar') {
    throw BackupException('preferences');
  }
  final postpone = preferences['postponeMinutes'];
  if (postpone is! int || postpone < 5 || postpone > 180) {
    throw BackupException('preferences');
  }
  final zone = preferences['lastTimezone'];
  if (zone != null && zone is! String) {
    throw BackupException('preferences');
  }
}

Map<String, Object?> _map(Object? value, String code) {
  if (value is! Map) {
    throw BackupException(code);
  }
  return value.map((key, item) => MapEntry(key.toString(), item));
}

List<Map<String, Object?>> _mapList(Object? value, String code) {
  if (value is! List) {
    throw BackupException(code);
  }
  return value.map((item) => _map(item, code)).toList();
}

String _string(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value is! String) {
    throw BackupException('invalid');
  }
  return value;
}

void _requiredText(Map<String, Object?> map, String key, int max) {
  final value = _string(map, key).trim();
  if (value.isEmpty || value.length > max) {
    throw BackupException('invalid');
  }
}

void _optionalText(Map<String, Object?> map, String key, int max) {
  final value = map[key];
  if (value == null) {
    return;
  }
  if (value is! String || value.length > max) {
    throw BackupException('invalid');
  }
}

void _optionalNumber(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value == null) {
    return;
  }
  if (value is! num || value < 0 || value.isNaN) {
    throw BackupException('invalid');
  }
}

String? _date(Object? value) {
  if (value is! String) {
    return null;
  }
  final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(value);
  if (match == null) {
    return null;
  }
  final year = int.parse(match.group(1)!);
  final month = int.parse(match.group(2)!);
  final day = int.parse(match.group(3)!);
  final date = DateTime.utc(year, month, day);
  if (date.year != year || date.month != month || date.day != day) {
    return null;
  }
  return value;
}

void _requiredInstant(Map<String, Object?> map, String key) {
  if (DateTime.tryParse(_string(map, key)) == null) {
    throw BackupException('invalid');
  }
}

void _optionalInstant(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value == null) {
    return;
  }
  if (value is! String || DateTime.tryParse(value) == null) {
    throw BackupException('invalid');
  }
}
