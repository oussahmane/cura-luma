import 'dart:math';

/// Stable dose id. Edits and notification callbacks reuse this id, so they
/// cannot insert a second history row for the same local slot.
String occurrenceId({
  required String medicineId,
  required String localDate,
  required int minutesFromMidnight,
}) {
  return '$medicineId|$localDate|$minutesFromMidnight';
}

String createId() {
  final time = DateTime.now().microsecondsSinceEpoch.toRadixString(16);
  final noise = Random.secure().nextInt(0x7fffffff).toRadixString(16);
  return '$time-$noise';
}

/// 31-bit notification id. Collisions inside one plan are resolved by the
/// planner; the id itself is deterministic for an occurrence.
int notificationIdFor(String key) {
  var hash = 0x811c9dc5;
  for (final unit in key.codeUnits) {
    hash ^= unit;
    hash = (hash * 0x01000193) & 0x7fffffff;
  }
  if (hash == 0) {
    hash = 1;
  }
  return hash;
}
