import '../../core/local_dates.dart';
import 'wall_time.dart';
import 'package:timezone/timezone.dart' as tz;

class PlannedOccurrence {
  const PlannedOccurrence({
    required this.id,
    required this.medicineId,
    required this.localDate,
    required this.minutesFromMidnight,
    required this.scheduledAt,
    required this.adjustment,
  });

  final String id;
  final String medicineId;
  final String localDate;
  final int minutesFromMidnight;
  final DateTime scheduledAt;
  final WallTimeAdjustment adjustment;
}

/// Expands a weekday-and-times rule into concrete local occurrences.
///
/// [from] and [to] are inclusive civil dates. Times outside the medicine's
/// start and end dates are omitted. The end date is inclusive.
List<PlannedOccurrence> expandSchedule({
  required String medicineId,
  required DateTime startDate,
  required DateTime? endDate,
  required int weekdayMask,
  required List<int> times,
  required DateTime from,
  required DateTime to,
  required tz.Location location,
  DateTime? archivedAt,
}) {
  if (weekdayMask == 0 || times.isEmpty || to.isBefore(from)) {
    return const [];
  }
  final start = dateOnly(startDate);
  final end = endDate == null ? null : dateOnly(endDate);
  final windowStart = dateOnly(from).isBefore(start) ? start : dateOnly(from);
  final windowEnd = end != null && dateOnly(to).isAfter(end) ? end : dateOnly(to);
  if (windowEnd.isBefore(windowStart)) {
    return const [];
  }

  final uniqueTimes = times.toSet().toList()..sort();
  final planned = <PlannedOccurrence>[];
  for (final date in eachDate(windowStart, windowEnd)) {
    if (!weekdaySelected(weekdayMask, date)) {
      continue;
    }
    for (final minutes in uniqueTimes) {
      final resolved = resolveWallTime(
        location: location,
        year: date.year,
        month: date.month,
        day: date.day,
        minutesFromMidnight: minutes,
      );
      if (archivedAt != null && !resolved.utc.isBefore(archivedAt)) {
        continue;
      }
      final localDate = formatLocalDate(date);
      planned.add(
        PlannedOccurrence(
          id: '$medicineId|$localDate|$minutes',
          medicineId: medicineId,
          localDate: localDate,
          minutesFromMidnight: minutes,
          scheduledAt: resolved.utc,
          adjustment: resolved.adjustment,
        ),
      );
    }
  }
  return planned;
}
