import 'package:flutter/material.dart';

import 'grid.dart';

class GameOfLife {
  static GameOfLife? _instance;

  late int generation = 0;

  Grid grid = Grid(20, 20);
  GameState state = GameState.stopped;

  void debugState() {
    debugPrint('State: $state');
  }

  void startGame() {
    state = GameState.running;
    debugState();
  }

  void stopGame() {
    grid = Grid(20, 20);
    state = GameState.stopped;
    debugState();
  }

  void pauseGame() {
    state = GameState.paused;
    debugState();
  }

  void nextGeneration() {
    grid.nextGrid();
  }

  void refreshGame() {
    grid.initGrid();
    state = GameState.stopped;
    debugState();
  }

  void newGame(int rows, int columns) {
    generation = 0;
    grid = Grid(rows, columns);
    state = GameState.stopped;
    grid.initGrid();
    debugState();
  }

  // Avoid self instance
  GameOfLife._();
  static GameOfLife get instance => _instance ??= GameOfLife._();
}

enum GameState { running, paused, stopped }
