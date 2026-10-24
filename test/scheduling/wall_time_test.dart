import 'package:cura_luma/features/scheduling/wall_time.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(tzdata.initializeTimeZones);

  test('ordinary local time keeps its offset', () {
    final location = tz.getLocation('America/New_York');
    final winter = resolveWallTime(
      location: location,
      year: 2026,
      month: 1,
      day: 15,
      minutesFromMidnight: 8 * 60,
    );
    final summer = resolveWallTime(
      location: location,
      year: 2026,
      month: 6,
      day: 15,
      minutesFromMidnight: 8 * 60,
    );

    expect(winter.adjustment, WallTimeAdjustment.unchanged);
    expect(summer.adjustment, WallTimeAdjustment.unchanged);
    expect(winter.utc, DateTime.utc(2026, 1, 15, 13));
    expect(summer.utc, DateTime.utc(2026, 6, 15, 12));
  });

  test('spring-forward gap moves to the next valid minute', () {
    final resolved = resolveWallTime(
      location: tz.getLocation('America/New_York'),
      year: 2026,
      month: 3,
      day: 8,
      minutesFromMidnight: 2 * 60 + 30,
    );

    expect(resolved.adjustment, WallTimeAdjustment.shiftedAfterGap);
    expect(resolved.utc, DateTime.utc(2026, 3, 8, 7));
  });

  test('fall-back overlap fires once at the earlier instant', () {
    final resolved = resolveWallTime(
      location: tz.getLocation('America/New_York'),
      year: 2026,
      month: 11,
      day: 1,
      minutesFromMidnight: 1 * 60 + 30,
    );

    expect(resolved.utc, DateTime.utc(2026, 11, 1, 5, 30));
    expect(
      resolved.adjustment,
      anyOf(WallTimeAdjustment.unchanged, WallTimeAdjustment.firstOfOverlap),
    );
  });
}
