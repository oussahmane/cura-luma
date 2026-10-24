import 'package:cura_luma/features/refills/refill_estimator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('plain numbers project future doses and words do not', () {
    expect(parseDoseAmount('1'), 1);
    expect(parseDoseAmount('0,5'), 0.5);
    expect(parseDoseAmount('one'), isNull);
    expect(parseDoseAmount('1/2'), isNull);

    final projected = projectSupply(
      remaining: 5,
      doseAmount: 1,
      futureDoses: [
        DateTime.utc(2026, 6, 16, 8),
        DateTime.utc(2026, 6, 17, 8),
        DateTime.utc(2026, 6, 18, 8),
      ],
    );
    expect(projected.canProject, isTrue);
    expect(projected.dosesLeft, 3);

    final manual = projectSupply(
      remaining: 5,
      doseAmount: null,
      futureDoses: [DateTime.utc(2026, 6, 16, 8)],
    );
    expect(manual.canProject, isFalse);
    expect(manual.remaining, 5);
  });

  test('decrement stops at zero and threshold uses the stored quantity', () {
    expect(decrementSupply(1, 0.5), 0.5);
    expect(decrementSupply(0.25, 1), 0);
    expect(supplyReachedThreshold(remaining: 4, threshold: 4), isTrue);
    expect(supplyReachedThreshold(remaining: 5, threshold: 4), isFalse);
    expect(supplyReachedThreshold(remaining: null, threshold: 4), isFalse);
  });
}
