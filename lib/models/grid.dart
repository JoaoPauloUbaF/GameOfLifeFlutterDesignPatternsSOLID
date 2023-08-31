import 'dart:math';

class Grid {
  late int rows;
  late int columns;
  late List<List<int>> grid;
  late Random genLife = Random();

  Grid(this.rows, this.columns) {
    initGrid();
  }

  void initGrid() {
    grid = List.generate(rows, (_) => List.filled(columns, 0));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        grid[i][j] = genLife.nextBool() ? 1 : 0;
      }
    }
  }

  int _countAliveNeighbors(int row, int column) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        int r = row + i;
        int c = column + j;
        if (r >= 0 && r < rows && c >= 0 && c < columns && grid[r][c] == 1) {
          count++;
        }
      }
    }
    return count;
  }

  void nextGrid() {
    List<List<int>> nextGrid =
        List.generate(rows, (_) => List.filled(columns, 0));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        int neighbors = _countAliveNeighbors(i, j);
        if (grid[i][j] == 1) {
          if (neighbors == 2 || neighbors == 3) {
            nextGrid[i][j] = 1;
          } else {
            nextGrid[i][j] = 0;
          }
        } else {
          if (neighbors == 3) {
            nextGrid[i][j] = 1;
          } else {
            nextGrid[i][j] = 0;
          }
        }
      }
    }
    grid = nextGrid;
  }
}
