import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

class Tick extends Notifier<Duration> {
  late Timer _timer;
  late DateTime init;

  @override
  Duration build() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      state = Duration.zero;
    });
    cancelTimer();
    return Duration.zero;
  }

  void cancelTimer() {
    state = Duration.zero;
    _timer.cancel();
  }

  void startTimer() {
    if (_timer.isActive) {
      return;
    }
    init = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      ref.read(gameOfLifeProvider.notifier).nextGeneration();
      state = DateTime.now().difference(init);
    });
  }

  void setTimer(int duration) {
    _timer = Timer(Duration(seconds: duration), () {
      state = DateTime.now().difference(init);
    });
  }

  bool isActive() {
    return _timer.isActive;
  }
}

final tickProvider = NotifierProvider<Tick, Duration>(() {
  return Tick();
});
