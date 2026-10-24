import 'package:cura_luma/core/local_dates.dart';
import 'package:cura_luma/features/scheduling/schedule_engine.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(tzdata.initializeTimeZones);

  test('expands selected weekdays and several times with stable ids', () {
    final location = tz.UTC;
    final planned = expandSchedule(
      medicineId: 'med',
      startDate: DateTime(2026, 6, 15),
      endDate: DateTime(2026, 6, 21),
      weekdayMask: weekdayBit(DateTime(2026, 6, 15)) | weekdayBit(DateTime(2026, 6, 17)),
      times: const [8 * 60, 20 * 60],
      from: DateTime(2026, 6, 15),
      to: DateTime(2026, 6, 21),
      location: location,
    );

    expect(planned.map((dose) => dose.localDate).toSet(), {'2026-06-15', '2026-06-17'});
    expect(planned, hasLength(4));
    expect(planned.first.id, 'med|2026-06-15|480');
    expect(planned.map((dose) => dose.id).toSet(), hasLength(4));
  });

  test('end date is inclusive and start date is not preceded', () {
    final planned = expandSchedule(
      medicineId: 'med',
      startDate: DateTime(2026, 6, 16),
      endDate: DateTime(2026, 6, 16),
      weekdayMask: allWeekdaysMask,
      times: const [9 * 60],
      from: DateTime(2026, 6, 1),
      to: DateTime(2026, 6, 30),
      location: tz.UTC,
    );

    expect(planned, hasLength(1));
    expect(planned.single.localDate, '2026-06-16');
  });

  test('archived instant drops doses at and after archive', () {
    final planned = expandSchedule(
      medicineId: 'med',
      startDate: DateTime(2026, 6, 15),
      endDate: null,
      weekdayMask: allWeekdaysMask,
      times: const [8 * 60, 18 * 60],
      from: DateTime(2026, 6, 15),
      to: DateTime(2026, 6, 15),
      location: tz.UTC,
      archivedAt: DateTime.utc(2026, 6, 15, 12),
    );

    expect(planned.map((dose) => dose.minutesFromMidnight), [8 * 60]);
  });
}
