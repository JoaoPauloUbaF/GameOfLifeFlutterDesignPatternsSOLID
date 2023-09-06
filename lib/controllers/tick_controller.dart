import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tick extends Notifier<DateTime> {
  late Timer _timer;
  DateTime init = DateTime.now();

  @override
  DateTime build() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
    cancelTimer();
    return DateTime.now();
  }

  void cancelTimer() {
    _timer.cancel();
  }

  void startTimer() {
    if (_timer.isActive) {
      return;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
  }

  void setTimer(int duration) {
    _timer = Timer(Duration(seconds: duration), () {
      state = DateTime.now();
    });
  }

  bool isActive() {
    return _timer.isActive;
  }
}

final tickProvider = NotifierProvider<Tick, DateTime>(() {
  return Tick();
});
