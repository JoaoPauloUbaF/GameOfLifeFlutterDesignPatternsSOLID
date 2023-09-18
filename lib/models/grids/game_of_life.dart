import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/dimension_stepper.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';
import 'package:game_of_life_design_patterns_solid/models/cells/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/grids/grid.dart';
import 'package:game_of_life_design_patterns_solid/models/grids/grid_strategy.dart';

class GameOfLife extends Notifier<GameState> {
  // To-do: change the notifier to be a grid changed notifier
  static GameOfLife? _instance;

  late int generation = 0;

  late GridStrategy gridStrategy = GridStrategy();

  late Tick timer;

  void debugState() {
    debugPrint('State: $state');
  }

  void startGame() {
    if (!gridStrategy.anyAliveCells() || state == GameState.running) {
      return;
    }
    state = GameState.running;
    timer.startTimer();
    debugState();
  }

  void stopGame() {
    generation = 0;
    ref.read(dimensionStepperProvider.notifier).reset();
    timer.cancelTimer();
    gridStrategy.setGrid(
        ref.watch(gridTypeProvider), ref.watch(cellTypeProvider));
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
      gridStrategy.nextGrid();
      state = GameState.running;
    }
  }

  void newGame(int rows, int columns) {
    gridStrategy.createGrid(rows: rows, columns: columns);
    state = GameState.loading;
    timer.cancelTimer();
    generation = 0;
    state = GameState.stopped;
    debugState();
  }

  void randomGame() {
    state = GameState.loading;
    timer.cancelTimer();
    generation = 0;
    gridStrategy.generateRadomGrid();
    state = GameState.ready;
    debugState();
  }

  // Avoid self instance
  GameOfLife._();
  static GameOfLife get instance => _instance ??= GameOfLife._();

  @override
  GameState build() {
    gridStrategy.setGrid(
        ref.watch(gridTypeProvider), ref.watch(cellTypeProvider));
    timer = ref.watch(tickProvider.notifier);
    return GameState.stopped;
  }
}

final gameOfLifeProvider = NotifierProvider<GameOfLife, GameState>(() {
  // var cellType = ref.read(cellTypeProvider);
  return GameOfLife.instance;
});

enum GameState { running, paused, stopped, ready, loading }
