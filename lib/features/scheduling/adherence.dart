import 'dose_status.dart';

enum AdherenceClass { taken, skipped, missed, notEligible }

class AdherenceDose {
  const AdherenceDose({
    required this.scheduledAt,
    required this.status,
    required this.postponeUntil,
  });

  final DateTime scheduledAt;
  final DoseStatus status;
  final DateTime? postponeUntil;
}

class AdherenceSummary {
  const AdherenceSummary({
    required this.eligible,
    required this.taken,
    required this.skipped,
    required this.missed,
  });

  final int eligible;
  final int taken;
  final int skipped;
  final int missed;

  /// Taken divided by eligible occurrences. Null when nothing was eligible,
  /// so the interface can show an empty summary instead of zero.
  double? get percent => eligible == 0 ? null : taken / eligible;
}

/// Eligible doses are occurrences inside [from, to) that already have an
/// outcome, or whose due window has expired.
///
/// Upcoming doses, doses still inside the due window, open postponements,
/// and paused doses are not eligible. A taken or skipped dose is eligible
/// even if it was recorded early. Paused doses are excluded so a temporary
/// pause is not counted as a miss.
AdherenceClass classifyAdherence({
  required AdherenceDose dose,
  required DateTime now,
  required Duration dueGrace,
}) {
  switch (dose.status) {
    case DoseStatus.paused:
      return AdherenceClass.notEligible;
    case DoseStatus.taken:
      return AdherenceClass.taken;
    case DoseStatus.skipped:
      return AdherenceClass.skipped;
    case DoseStatus.missed:
      return AdherenceClass.missed;
    case DoseStatus.postponed:
      final until = dose.postponeUntil ?? dose.scheduledAt;
      if (!until.isBefore(now) || now.difference(until) <= dueGrace) {
        return AdherenceClass.notEligible;
      }
      return AdherenceClass.missed;
    case DoseStatus.pending:
      if (dose.scheduledAt.isAfter(now) || now.difference(dose.scheduledAt) <= dueGrace) {
        return AdherenceClass.notEligible;
      }
      return AdherenceClass.missed;
  }
}

AdherenceSummary summarizeAdherence({
  required List<AdherenceDose> doses,
  required DateTime from,
  required DateTime to,
  required DateTime now,
  required Duration dueGrace,
}) {
  var eligible = 0;
  var taken = 0;
  var skipped = 0;
  var missed = 0;
  for (final dose in doses) {
    final scheduled = dose.scheduledAt.toUtc();
    if (scheduled.isBefore(from.toUtc()) || !scheduled.isBefore(to.toUtc())) {
      continue;
    }
    switch (classifyAdherence(dose: dose, now: now.toUtc(), dueGrace: dueGrace)) {
      case AdherenceClass.notEligible:
        break;
      case AdherenceClass.taken:
        eligible += 1;
        taken += 1;
      case AdherenceClass.skipped:
        eligible += 1;
        skipped += 1;
      case AdherenceClass.missed:
        eligible += 1;
        missed += 1;
    }
  }
  return AdherenceSummary(
    eligible: eligible,
    taken: taken,
    skipped: skipped,
    missed: missed,
  );
}
