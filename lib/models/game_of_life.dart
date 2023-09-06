import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';

import 'grid.dart';

class GameOfLife extends Notifier<GameState> {
  static GameOfLife? _instance;

  late int generation = 0;

  Grid grid = Grid();

  late Tick timer;

  void debugState() {
    debugPrint('State: $state');
  }

  void startGame() {
    if (!grid.anyAliveCells() || state == GameState.running) {
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
    grid = Grid();
    state = GameState.stopped;
    debugState();
  }

  void pauseGame() {
    if (state == GameState.paused) {
      return;
    }
    state = GameState.paused;
    timer.cancelTimer();
    debugState();
  }

  void nextGeneration() {
    if (state == GameState.running) {
      generation++;
      state = GameState.loading;
      grid.nextGrid();
      state = GameState.running;
    }
  }

  void newGame(int rows, int columns) {
    state = GameState.loading;
    timer.cancelTimer();
    generation = 0;
    grid.createGrid(rows: rows, columns: columns);
    state = GameState.stopped;
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
