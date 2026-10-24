import '../../core/local_dates.dart';

const medicineForms = <String>[
  'tablet',
  'capsule',
  'liquid',
  'drops',
  'injection',
  'other',
];

class MedicineDraft {
  const MedicineDraft({
    this.id,
    required this.name,
    required this.doseAmount,
    required this.doseUnit,
    required this.form,
    required this.notes,
    required this.instructions,
    required this.startDate,
    required this.endDate,
    required this.weekdayMask,
    required this.times,
    required this.color,
    required this.photoBytes,
    required this.removePhoto,
    required this.supplyQuantity,
    required this.refillThreshold,
  });

  final String? id;
  final String name;
  final String doseAmount;
  final String doseUnit;
  final String form;
  final String notes;
  final String instructions;
  final DateTime startDate;
  final DateTime? endDate;
  final int weekdayMask;
  final List<int> times;
  final int color;
  final List<int>? photoBytes;
  final bool removePhoto;
  final double? supplyQuantity;
  final double? refillThreshold;
}

/// Returns a stable error code, or null when the draft can be saved.
String? validateMedicineDraft(MedicineDraft draft) {
  final name = draft.name.trim();
  final amount = draft.doseAmount.trim();
  final unit = draft.doseUnit.trim();
  if (name.isEmpty) {
    return 'name';
  }
  if (amount.isEmpty) {
    return 'dose';
  }
  if (unit.isEmpty) {
    return 'unit';
  }
  if (name.length > 80 || amount.length > 40 || unit.length > 24) {
    return 'length';
  }
  if (draft.notes.trim().length > 500 || draft.instructions.trim().length > 500) {
    return 'length';
  }
  if (!medicineForms.contains(draft.form)) {
    return 'form';
  }
  if (draft.times.isEmpty) {
    return 'time';
  }
  if (draft.times.toSet().length != draft.times.length) {
    return 'duplicateTime';
  }
  if (draft.times.any((time) => time < 0 || time > 1439)) {
    return 'time';
  }
  if (draft.weekdayMask < 1 || draft.weekdayMask > allWeekdaysMask) {
    return 'weekday';
  }
  if (draft.endDate != null && dateOnly(draft.endDate!).isBefore(dateOnly(draft.startDate))) {
    return 'endDate';
  }
  if (draft.supplyQuantity != null && draft.supplyQuantity! < 0) {
    return 'supply';
  }
  if (draft.refillThreshold != null &&
      (draft.refillThreshold! < 0 || draft.supplyQuantity == null)) {
    return 'threshold';
  }
  return null;
}
