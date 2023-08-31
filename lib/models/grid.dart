import 'dart:math';

import 'package:game_of_life_design_patterns_solid/models/cell.dart';

class Grid {
  late int rows;
  late int columns;
  late List<Cell> grid;
  late Random genLife = Random();

  Grid(this.rows, this.columns) {
    initGrid();
  }

  void initGrid() {
    grid = List.generate(rows * columns,
        (index) => Cell(index ~/ rows, index % columns, CellState.dead));
    for (var i = 0; i < rows * columns; i++) {
      grid[i] = Cell(i ~/ rows, i % columns,
          genLife.nextInt(2) == 1 ? CellState.alive : CellState.dead);
    }
  }

  Cell findCell(int row, int column) {
    return grid.firstWhere((cell) => cell.x == row && cell.y == column);
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
            findCell(r, c).health == CellState.alive) {
          count++;
        }
      }
    }
    return count;
  }

  void nextGrid() {
    List<Cell> nextGrid = List.generate(rows * columns,
        (index) => Cell(index ~/ rows, index % columns, CellState.dead));
    for (var i = 0; i < rows * columns; i++) {
      int row = i ~/ rows;
      int column = i % columns;
      int aliveNeighbors = _countAliveNeighbors(row, column);
      if (findCell(row, column).health == CellState.alive) {
        if (aliveNeighbors < 2 || aliveNeighbors > 3) {
          nextGrid[i] = Cell(row, column, CellState.dead);
        } else {
          nextGrid[i] = Cell(row, column, CellState.alive);
        }
      } else {
        if (aliveNeighbors == 3) {
          nextGrid[i] = Cell(row, column, CellState.alive);
        } else {
          nextGrid[i] = Cell(row, column, CellState.dead);
        }
      }
    }
    grid = nextGrid;
  }
}
