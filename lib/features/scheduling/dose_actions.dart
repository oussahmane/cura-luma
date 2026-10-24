import 'dose_status.dart';

enum DoseCommand { take, skip, postpone }

enum DoseActionOutcome { applied, unchanged, rejected }

class DoseActionDecision {
  const DoseActionDecision({
    required this.outcome,
    required this.status,
    required this.source,
    required this.postponeUntil,
    required this.clearPostpone,
    required this.applySupply,
    required this.recordedAt,
  });

  final DoseActionOutcome outcome;
  final DoseStatus status;
  final StatusSource source;
  final DateTime? postponeUntil;
  final bool clearPostpone;
  final bool applySupply;
  final DateTime? recordedAt;
}

/// Single transition table for dose recording.
///
/// Taking or skipping a dose that already has that outcome is an unchanged
/// no-op, so a repeated notification action cannot decrement supply twice.
/// The opposite terminal outcome is rejected. Postpone updates the same row.
DoseActionDecision applyDoseCommand({
  required DoseStatus status,
  required StatusSource source,
  required bool supplyApplied,
  required DateTime? postponeUntil,
  required DoseCommand command,
  required DateTime now,
  required Duration postponeBy,
}) {
  if (command == DoseCommand.take && status == DoseStatus.taken) {
    return _unchanged(status, source, postponeUntil);
  }
  if (command == DoseCommand.skip && status == DoseStatus.skipped) {
    return _unchanged(status, source, postponeUntil);
  }
  if (status == DoseStatus.taken || status == DoseStatus.skipped) {
    return _rejected(status, source, postponeUntil);
  }
  if (command == DoseCommand.postpone && status == DoseStatus.missed) {
    return _rejected(status, source, postponeUntil);
  }

  final moment = now.toUtc();
  switch (command) {
    case DoseCommand.take:
      return DoseActionDecision(
        outcome: DoseActionOutcome.applied,
        status: DoseStatus.taken,
        source: StatusSource.user,
        postponeUntil: null,
        clearPostpone: true,
        applySupply: !supplyApplied,
        recordedAt: moment,
      );
    case DoseCommand.skip:
      return DoseActionDecision(
        outcome: DoseActionOutcome.applied,
        status: DoseStatus.skipped,
        source: StatusSource.user,
        postponeUntil: null,
        clearPostpone: true,
        applySupply: false,
        recordedAt: moment,
      );
    case DoseCommand.postpone:
      return DoseActionDecision(
        outcome: DoseActionOutcome.applied,
        status: DoseStatus.postponed,
        source: StatusSource.user,
        postponeUntil: moment.add(postponeBy),
        clearPostpone: false,
        applySupply: false,
        recordedAt: moment,
      );
  }
}

DoseActionDecision _unchanged(
  DoseStatus status,
  StatusSource source,
  DateTime? postponeUntil,
) {
  return DoseActionDecision(
    outcome: DoseActionOutcome.unchanged,
    status: status,
    source: source,
    postponeUntil: postponeUntil,
    clearPostpone: false,
    applySupply: false,
    recordedAt: null,
  );
}

DoseActionDecision _rejected(
  DoseStatus status,
  StatusSource source,
  DateTime? postponeUntil,
) {
  return DoseActionDecision(
    outcome: DoseActionOutcome.rejected,
    status: status,
    source: source,
    postponeUntil: postponeUntil,
    clearPostpone: false,
    applySupply: false,
    recordedAt: null,
  );
}
