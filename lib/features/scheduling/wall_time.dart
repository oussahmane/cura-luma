import 'package:timezone/timezone.dart' as tz;

/// How a wall-clock reminder was placed on the absolute timeline.
enum WallTimeAdjustment {
  /// The requested local time exists once.
  unchanged,

  /// Spring-forward gap. The reminder moves to the earliest valid local
  /// minute at or after the requested time, so it is not dropped.
  shiftedAfterGap,

  /// Fall-back overlap. The reminder is the first of the two possible
  /// instants, so it fires once.
  firstOfOverlap,
}

class ResolvedWallTime {
  const ResolvedWallTime({
    required this.utc,
    required this.adjustment,
  });

  final DateTime utc;
  final WallTimeAdjustment adjustment;
}

/// Converts a local civil date and minutes-from-midnight into one UTC instant.
///
/// Daylight-saving policy:
/// - A missing local time (spring forward) moves forward to the next minute
///   that exists. A 02:30 request when clocks jump from 02:00 to 03:00 is
///   scheduled at 03:00 local.
/// - A repeated local time (fall back) uses the earlier instant only.
ResolvedWallTime resolveWallTime({
  required tz.Location location,
  required int year,
  required int month,
  required int day,
  required int minutesFromMidnight,
}) {
  final hour = minutesFromMidnight ~/ 60;
  final minute = minutesFromMidnight % 60;
  final constructed = tz.TZDateTime(location, year, month, day, hour, minute);
  final matches = _matches(constructed, year, month, day, hour, minute);

  if (!matches) {
    final shifted = _firstValidAtOrAfter(
      location: location,
      year: year,
      month: month,
      day: day,
      minutesFromMidnight: minutesFromMidnight,
    );
    return ResolvedWallTime(
      utc: shifted.toUtc(),
      adjustment: WallTimeAdjustment.shiftedAfterGap,
    );
  }

  final earlierUtc = constructed.toUtc().subtract(const Duration(hours: 1));
  final earlierLocal = tz.TZDateTime.from(earlierUtc, location);
  if (_matches(earlierLocal, year, month, day, hour, minute)) {
    return ResolvedWallTime(
      utc: earlierUtc,
      adjustment: WallTimeAdjustment.firstOfOverlap,
    );
  }

  return ResolvedWallTime(
    utc: constructed.toUtc(),
    adjustment: WallTimeAdjustment.unchanged,
  );
}

tz.TZDateTime _firstValidAtOrAfter({
  required tz.Location location,
  required int year,
  required int month,
  required int day,
  required int minutesFromMidnight,
}) {
  for (var step = 0; step <= 180; step++) {
    final cursor = minutesFromMidnight + step;
    final extraDays = cursor ~/ (24 * 60);
    final minuteOfDay = cursor % (24 * 60);
    final date = DateTime(year, month, day).add(Duration(days: extraDays));
    final hour = minuteOfDay ~/ 60;
    final minute = minuteOfDay % 60;
    final attempt = tz.TZDateTime(
      location,
      date.year,
      date.month,
      date.day,
      hour,
      minute,
    );
    if (_matches(attempt, date.year, date.month, date.day, hour, minute)) {
      return attempt;
    }
  }
  return tz.TZDateTime(location, year, month, day, minutesFromMidnight ~/ 60, minutesFromMidnight % 60);
}

bool _matches(
  tz.TZDateTime value,
  int year,
  int month,
  int day,
  int hour,
  int minute,
) {
  return value.year == year &&
      value.month == month &&
      value.day == day &&
      value.hour == hour &&
      value.minute == minute;
}
