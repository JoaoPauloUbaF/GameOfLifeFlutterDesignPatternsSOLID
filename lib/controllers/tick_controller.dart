import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

class Tick extends Notifier<Duration> {
  late Timer _timer;
  late DateTime init;
  Duration duration = const Duration(milliseconds: 1000);

  @override
  Duration build() {
    init = DateTime.now();
    _timer = Timer.periodic(duration, (timer) {
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
    // if (_timer.isActive) {
    //   return;
    // }
    init = DateTime.now();
    _timer = Timer.periodic(duration, (timer) {
      ref.read(gameOfLifeProvider.notifier).nextGeneration();
      state = DateTime.now().difference(init);
    });
  }

  void resetTimer() {
    cancelTimer();
    startTimer();
  }

  void setDuration(int duration) {
    this.duration = Duration(milliseconds: duration);
  }

  bool isActive() {
    return _timer.isActive;
  }
}

final tickProvider = NotifierProvider<Tick, Duration>(() {
  return Tick();
});
