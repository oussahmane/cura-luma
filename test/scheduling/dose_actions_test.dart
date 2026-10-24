import 'package:cura_luma/features/scheduling/dose_actions.dart';
import 'package:cura_luma/features/scheduling/dose_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime.utc(2026, 6, 15, 10);

  test('repeating the same outcome does not apply supply again', () {
    final first = applyDoseCommand(
      status: DoseStatus.pending,
      source: StatusSource.none,
      supplyApplied: false,
      postponeUntil: null,
      command: DoseCommand.take,
      now: now,
      postponeBy: const Duration(minutes: 15),
    );
    final second = applyDoseCommand(
      status: first.status,
      source: first.source,
      supplyApplied: true,
      postponeUntil: null,
      command: DoseCommand.take,
      now: now,
      postponeBy: const Duration(minutes: 15),
    );

    expect(first.outcome, DoseActionOutcome.applied);
    expect(first.applySupply, isTrue);
    expect(second.outcome, DoseActionOutcome.unchanged);
    expect(second.applySupply, isFalse);
  });

  test('a recorded dose cannot be switched to the opposite outcome', () {
    final decision = applyDoseCommand(
      status: DoseStatus.taken,
      source: StatusSource.user,
      supplyApplied: true,
      postponeUntil: null,
      command: DoseCommand.skip,
      now: now,
      postponeBy: const Duration(minutes: 15),
    );

    expect(decision.outcome, DoseActionOutcome.rejected);
  });

  test('postpone updates the same dose instead of creating another', () {
    final decision = applyDoseCommand(
      status: DoseStatus.pending,
      source: StatusSource.none,
      supplyApplied: false,
      postponeUntil: null,
      command: DoseCommand.postpone,
      now: now,
      postponeBy: const Duration(minutes: 30),
    );

    expect(decision.outcome, DoseActionOutcome.applied);
    expect(decision.status, DoseStatus.postponed);
    expect(decision.postponeUntil, now.add(const Duration(minutes: 30)));
    expect(decision.applySupply, isFalse);
  });

  test('a missed dose cannot be postponed', () {
    final decision = applyDoseCommand(
      status: DoseStatus.missed,
      source: StatusSource.system,
      supplyApplied: false,
      postponeUntil: null,
      command: DoseCommand.postpone,
      now: now,
      postponeBy: const Duration(minutes: 15),
    );

    expect(decision.outcome, DoseActionOutcome.rejected);
  });
}
