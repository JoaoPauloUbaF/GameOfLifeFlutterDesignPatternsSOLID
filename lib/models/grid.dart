import 'dart:math';

import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/cell_factory.dart';

class Grid {
  late int rows;
  late int columns;
  late List<Cell> frame;
  late Random genLife = Random();

  Grid() {
    createGrid();
  }

  bool anyAliveCells() {
    bool anyAlive = false;
    for (var cell in frame) {
      cell.cellHealth == CellState.alive ? anyAlive = true : anyAlive = false;
      if (anyAlive) break;
    }
    return anyAlive;
  }

  void createGrid({int rows = 5, int columns = 5}) {
    this.rows = rows;
    this.columns = columns;
    frame = List.generate(
        rows * columns,
        (index) => CellFactory.createCell(
            CellType.bacteria, index ~/ rows, index % columns, CellState.dead));
  }

  void generateRadomGrid() {
    for (var i = 0; i < rows * columns; i++) {
      frame[i] = CellFactory.createCell(
          CellType.bacteria,
          i ~/ rows,
          i % columns,
          genLife.nextInt(2) == 1 ? CellState.alive : CellState.dead);
    }
  }

  Cell findCell(int row, int column) {
    return frame
        .firstWhere((cell) => cell.cellXPos == row && cell.cellYPos == column);
  }

  int _countAliveNeighbors(int row, int column) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        int r = row + i;
        int c = column + j;
        if (r >= 0 &&
            r < rows &&
            c >= 0 &&
            c < columns &&
            findCell(r, c).cellHealth == CellState.alive) {
          count++;
        }
      }
    }
    return count;
  }

  void nextGrid() {
    List<Cell> nextGrid = List.generate(
        rows * columns,
        (index) => CellFactory.createCell(
            CellType.bacteria, index ~/ rows, index % columns, CellState.dead));
    for (var i = 0; i < rows * columns; i++) {
      int row = i ~/ rows;
      int column = i % columns;
      int aliveNeighbors = _countAliveNeighbors(row, column);
      if (findCell(row, column).cellHealth == CellState.alive) {
        if (aliveNeighbors < 2 || aliveNeighbors > 3) {
          nextGrid[i] = CellFactory.createCell(
              CellType.bacteria, row, column, CellState.dead);
        } else {
          nextGrid[i] = CellFactory.createCell(
              CellType.bacteria, row, column, CellState.alive);
        }
      } else {
        if (aliveNeighbors == 3) {
          nextGrid[i] = CellFactory.createCell(
              CellType.bacteria, row, column, CellState.alive);
        } else {
          nextGrid[i] = CellFactory.createCell(
              CellType.bacteria, row, column, CellState.dead);
        }
      }
    }
    frame = nextGrid;
  }

  void setDimension({required int size}) {
    rows = size;
    columns = size;
  }
}
