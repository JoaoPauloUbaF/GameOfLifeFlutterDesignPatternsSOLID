import 'package:flutter_riverpod/flutter_riverpod.dart';

class DimensionStepper extends Notifier<int> {
  @override
  int build() {
    return 20;
  }

  void increment() {
    if (state < 50) {
      state++;
    }
  }

  void decrement() {
    if (state > 10) {
      state--;
    }
  }
}

final dimensionStepperProvider = NotifierProvider<DimensionStepper, int>(() {
  return DimensionStepper();
});
