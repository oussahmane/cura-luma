import 'package:timezone/timezone.dart' as tz;

String formatLocalDate(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}

DateTime? parseLocalDate(String value) {
  final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(value);
  if (match == null) {
    return null;
  }
  final year = int.parse(match.group(1)!);
  final month = int.parse(match.group(2)!);
  final day = int.parse(match.group(3)!);
  final date = DateTime(year, month, day);
  if (date.year != year || date.month != month || date.day != day) {
    return null;
  }
  return date;
}

DateTime dateOnly(DateTime value) => DateTime(value.year, value.month, value.day);

DateTime localToday(tz.Location location, DateTime nowUtc) {
  final local = tz.TZDateTime.from(nowUtc.toUtc(), location);
  return DateTime(local.year, local.month, local.day);
}

DateTime localDateOf(tz.Location location, DateTime instant) {
  final local = tz.TZDateTime.from(instant.toUtc(), location);
  return DateTime(local.year, local.month, local.day);
}

int weekdayBit(DateTime date) => 1 << (date.weekday - 1);

bool weekdaySelected(int mask, DateTime date) => (mask & weekdayBit(date)) != 0;

const int allWeekdaysMask = 0x7f;

Iterable<DateTime> eachDate(DateTime from, DateTime to) sync* {
  var cursor = dateOnly(from);
  final end = dateOnly(to);
  while (!cursor.isAfter(end)) {
    yield cursor;
    cursor = cursor.add(const Duration(days: 1));
  }
}
