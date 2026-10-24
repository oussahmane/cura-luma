import '../scheduling/dose_status.dart';
import '../refills/refill_estimator.dart';

class TodayDoseView {
  const TodayDoseView({
    required this.occurrenceId,
    required this.medicineId,
    required this.name,
    required this.amount,
    required this.unit,
    required this.color,
    required this.effectiveAt,
    required this.display,
    required this.lowSupply,
  });

  final String occurrenceId;
  final String medicineId;
  final String name;
  final String amount;
  final String unit;
  final int color;
  final DateTime effectiveAt;
  final DoseDisplay display;
  final bool lowSupply;

  bool get canTake => canMarkTaken(display);
  bool get canSkip => canMarkSkipped(display);
  bool get canPostpone => canPostponeDose(display);
}

bool canPostponeDose(DoseDisplay display) => canPostpone(display);

class TodayView {
  const TodayView({
    required this.day,
    required this.doses,
    required this.next,
    required this.notificationsEnabled,
  });

  final DateTime day;
  final List<TodayDoseView> doses;
  final TodayDoseView? next;
  final bool notificationsEnabled;
}

class MedicineSummary {
  const MedicineSummary({
    required this.id,
    required this.name,
    required this.amount,
    required this.unit,
    required this.form,
    required this.color,
    required this.archived,
    required this.paused,
    required this.times,
    required this.weekdayMask,
    required this.lowSupply,
  });

  final String id;
  final String name;
  final String amount;
  final String unit;
  final String form;
  final int color;
  final bool archived;
  final bool paused;
  final List<int> times;
  final int weekdayMask;
  final bool lowSupply;
}

class MedicineDetails {
  const MedicineDetails({
    required this.summary,
    required this.notes,
    required this.instructions,
    required this.startDate,
    required this.endDate,
    required this.photoPath,
    required this.supply,
    required this.threshold,
    required this.projection,
    required this.doseAmountParses,
  });

  final MedicineSummary summary;
  final String notes;
  final String instructions;
  final DateTime startDate;
  final DateTime? endDate;
  final String? photoPath;
  final double? supply;
  final double? threshold;
  final RefillProjection projection;
  final bool doseAmountParses;
}

class HistoryEntry {
  const HistoryEntry({
    required this.occurrenceId,
    required this.medicineId,
    required this.name,
    required this.amount,
    required this.unit,
    required this.color,
    required this.scheduledAt,
    required this.display,
  });

  final String occurrenceId;
  final String medicineId;
  final String name;
  final String amount;
  final String unit;
  final int color;
  final DateTime scheduledAt;
  final DoseDisplay display;
}

class HistoryView {
  const HistoryView({
    required this.entries,
    required this.week,
    required this.month,
    required this.medicines,
  });

  final List<HistoryEntry> entries;
  final AdherenceSummary week;
  final AdherenceSummary month;
  final List<MedicineSummary> medicines;
}

class AdherenceSummary {
  const AdherenceSummary({
    required this.eligible,
    required this.taken,
    required this.skipped,
    required this.missed,
    required this.percent,
  });

  final int eligible;
  final int taken;
  final int skipped;
  final int missed;
  final double? percent;
}

enum RecordResult { applied, unchanged, rejected, missing }
