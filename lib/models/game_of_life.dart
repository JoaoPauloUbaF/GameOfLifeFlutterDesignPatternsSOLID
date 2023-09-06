import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';

import 'grid.dart';

class GameOfLife extends Notifier<GameState> {
  static GameOfLife? _instance;

  late int generation = 0;

  Grid grid = Grid(20, 20);

  late Tick timer;

  void debugState() {
    debugPrint('State: $state');
  }

  void startGame() {
    if (!grid.anyAliveCells()) {
      return;
    }

    state = GameState.running;
    timer.startTimer();
    debugState();
  }

  void stopGame() {
    if (state == GameState.stopped) {
      return;
    }
    timer.cancelTimer();
    grid = Grid(20, 20);
    state = GameState.stopped;
    debugState();
  }

  void pauseGame() {
    if (state == GameState.paused) {
      return;
    }
    timer.cancelTimer();
    state = GameState.paused;
    debugState();
  }

  void nextGeneration() {
    generation++;
    state = GameState.loading;
    grid.nextGrid();
    state = GameState.running;
  }

  void newGame(int rows, int columns) {
    timer.cancelTimer();
    generation = 0;
    grid = Grid(rows, columns);
    state = GameState.stopped;
    grid.initGrid();
    debugState();
  }

  void randomGame() {
    state = GameState.loading;
    timer.cancelTimer();
    grid.generateRadomGrid();
    state = GameState.ready;
    debugState();
  }

  // Avoid self instance
  GameOfLife._();
  static GameOfLife get instance => _instance ??= GameOfLife._();

  @override
  GameState build() {
    timer = ref.watch(tickProvider.notifier);
    return GameState.stopped;
  }
}

final gameOfLifeProvider = NotifierProvider<GameOfLife, GameState>(() {
  return GameOfLife.instance;
});

enum GameState { running, paused, stopped, ready, loading }
