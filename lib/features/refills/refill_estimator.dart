/// Parses a dose amount the user typed.
///
/// Only a plain decimal number is accepted. Fractions, words, and ranges are
/// left unparsed so the app does not infer a dose the person did not enter.
double? parseDoseAmount(String raw) {
  final normalized = raw.trim().replaceAll(',', '.');
  if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(normalized)) {
    return null;
  }
  final value = double.parse(normalized);
  if (value <= 0 || value.isNaN || value.isInfinite) {
    return null;
  }
  return value;
}

class RefillProjection {
  const RefillProjection({
    required this.canProject,
    required this.remaining,
    required this.dosesLeft,
    required this.lastCoveredAt,
  });

  final bool canProject;
  final double? remaining;
  final int? dosesLeft;
  final DateTime? lastCoveredAt;
}

/// Projects how many future scheduled doses the entered supply can cover.
///
/// [remaining] is the stored quantity after manual corrections and after
/// numeric doses already recorded as taken. This is an estimate from the
/// user's own figures, not a supply recommendation.
RefillProjection projectSupply({
  required double? remaining,
  required double? doseAmount,
  required List<DateTime> futureDoses,
}) {
  if (remaining == null) {
    return const RefillProjection(
      canProject: false,
      remaining: null,
      dosesLeft: null,
      lastCoveredAt: null,
    );
  }
  if (doseAmount == null) {
    return RefillProjection(
      canProject: false,
      remaining: remaining,
      dosesLeft: null,
      lastCoveredAt: null,
    );
  }

  var left = remaining;
  var covered = 0;
  DateTime? last;
  for (final instant in futureDoses) {
    if (left + 1e-9 < doseAmount) {
      break;
    }
    left -= doseAmount;
    covered += 1;
    last = instant;
  }
  return RefillProjection(
    canProject: true,
    remaining: remaining,
    dosesLeft: covered,
    lastCoveredAt: last,
  );
}

double decrementSupply(double remaining, double doseAmount) {
  final next = remaining - doseAmount;
  if (next <= 0) {
    return 0;
  }
  return double.parse(next.toStringAsFixed(4));
}

String formatQuantity(double value) {
  if (value == value.roundToDouble()) {
    return value.round().toString();
  }
  return value.toStringAsFixed(2);
}

bool supplyReachedThreshold({
  required double? remaining,
  required double? threshold,
}) {
  if (remaining == null || threshold == null) {
    return false;
  }
  return remaining <= threshold;
}
