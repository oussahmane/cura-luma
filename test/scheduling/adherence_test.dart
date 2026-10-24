import 'package:cura_luma/features/scheduling/adherence.dart';
import 'package:cura_luma/features/scheduling/dose_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime.utc(2026, 6, 15, 12);
  const grace = Duration(minutes: 60);
  final from = DateTime.utc(2026, 6, 1);
  final to = DateTime.utc(2026, 7, 1);

  AdherenceDose dose(DoseStatus status, DateTime at, {DateTime? postpone}) {
    return AdherenceDose(scheduledAt: at, status: status, postponeUntil: postpone);
  }

  test('counts only doses whose outcome is already final', () {
    final summary = summarizeAdherence(
      doses: [
        dose(DoseStatus.taken, DateTime.utc(2026, 6, 10, 8)),
        dose(DoseStatus.skipped, DateTime.utc(2026, 6, 11, 8)),
        dose(DoseStatus.missed, DateTime.utc(2026, 6, 12, 8)),
        dose(DoseStatus.pending, DateTime.utc(2026, 6, 15, 18)),
        dose(DoseStatus.pending, DateTime.utc(2026, 6, 15, 11, 30)),
        dose(DoseStatus.paused, DateTime.utc(2026, 6, 9, 8)),
      ],
      from: from,
      to: to,
      now: now,
      dueGrace: grace,
    );

    expect(summary.taken, 1);
    expect(summary.skipped, 1);
    expect(summary.missed, 1);
    expect(summary.eligible, 3);
    expect(summary.percent, closeTo(1 / 3, 0.0001));
  });

  test('an empty period has no percentage', () {
    final summary = summarizeAdherence(
      doses: const [],
      from: from,
      to: to,
      now: now,
      dueGrace: grace,
    );

    expect(summary.eligible, 0);
    expect(summary.percent, isNull);
  });
}
