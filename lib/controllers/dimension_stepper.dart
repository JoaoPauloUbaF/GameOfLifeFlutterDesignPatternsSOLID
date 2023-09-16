import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

class DimensionStepper extends Notifier<int> {
  @override
  int build() {
    return 10;
  }

  void increment() {
    if (state >= 100) {
      return;
    }
    state++;
    ref.read(gameOfLifeProvider.notifier).newGame(state, state);
  }

  void decrement() {
    if (state <= 10) {
      return;
    }
    state--;
    ref.read(gameOfLifeProvider.notifier).newGame(state, state);
  }

  void reset() {
    state = 5;
    ref.read(gameOfLifeProvider.notifier).newGame(state, state);
  }
}

final dimensionStepperProvider = NotifierProvider<DimensionStepper, int>(() {
  return DimensionStepper();
});
