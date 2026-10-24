enum DoseStatus { pending, taken, skipped, missed, postponed, paused }

enum StatusSource { none, user, system }

enum DoseDisplay {
  upcoming,
  due,
  taken,
  skipped,
  missed,
  postponed,
  paused,
}

DoseStatus doseStatusFromName(String value) {
  return DoseStatus.values.firstWhere(
    (status) => status.name == value,
    orElse: () => DoseStatus.pending,
  );
}

StatusSource statusSourceFromName(String value) {
  return StatusSource.values.firstWhere(
    (source) => source.name == value,
    orElse: () => StatusSource.none,
  );
}

/// Presentation status. Recording rules live in [applyDoseCommand].
DoseDisplay displayFor({
  required DoseStatus status,
  required DateTime scheduledAt,
  required DateTime? postponeUntil,
  required DateTime now,
  required Duration dueGrace,
}) {
  switch (status) {
    case DoseStatus.taken:
      return DoseDisplay.taken;
    case DoseStatus.skipped:
      return DoseDisplay.skipped;
    case DoseStatus.missed:
      return DoseDisplay.missed;
    case DoseStatus.paused:
      return DoseDisplay.paused;
    case DoseStatus.postponed:
      final until = postponeUntil ?? scheduledAt;
      if (until.isAfter(now)) {
        return DoseDisplay.postponed;
      }
      if (now.difference(until) <= dueGrace) {
        return DoseDisplay.due;
      }
      return DoseDisplay.missed;
    case DoseStatus.pending:
      if (scheduledAt.isAfter(now)) {
        return DoseDisplay.upcoming;
      }
      if (now.difference(scheduledAt) <= dueGrace) {
        return DoseDisplay.due;
      }
      return DoseDisplay.missed;
  }
}

bool canMarkTaken(DoseDisplay display) {
  return display == DoseDisplay.upcoming ||
      display == DoseDisplay.due ||
      display == DoseDisplay.postponed ||
      display == DoseDisplay.missed;
}

bool canMarkSkipped(DoseDisplay display) => canMarkTaken(display);

bool canPostpone(DoseDisplay display) {
  return display == DoseDisplay.upcoming ||
      display == DoseDisplay.due ||
      display == DoseDisplay.postponed;
}
