import 'cell.dart';
import 'cell_factory.dart';
import 'classic_grid.dart';

class PredatorPreyLifeGrid extends ClassicGrid {
  PredatorPreyLifeGrid(super.cellType, {int rows = 5, int columns = 5}) {
    createGrid(rows: rows, columns: columns);
  }

  @override
  void nextGrid() {
    List<Cell> nextGrid = List.generate(
        rows * columns,
        (index) => CellFactory.createCell(
            CellType.bacteria, index ~/ rows, index % columns, CellState.dead));

    for (var i = 0; i < rows * columns; i++) {
      int row = i ~/ rows;
      int column = i % columns;
      int aliveNeighbors = countAliveNeighbors(row, column);
      int predatorNeighbors = countPredatorNeighbors(row, column);

      if (findCell(row, column).cellType == CellType.virus) {
        if (aliveNeighbors == 0 || predatorNeighbors > 3) {
          nextGrid[i] = CellFactory.createCell(
              CellType.bacteria, row, column, CellState.dead);
        } else if (aliveNeighbors > 0) {
          nextGrid[i] = CellFactory.createCell(
              CellType.virus, row, column, CellState.alive);
        }
      } else {
        if (predatorNeighbors > 0) {
          nextGrid[i] = CellFactory.createCell(
              CellType.virus, row, column, CellState.alive);
        } else if (aliveNeighbors == 3) {
          nextGrid[i] = CellFactory.createCell(
              CellType.bacteria, row, column, CellState.alive);
        } else if (aliveNeighbors > 4) {
          nextGrid[i] = CellFactory.createCell(
              CellType.bacteria, row, column, CellState.dead);
        }
      }
    }
    frame = nextGrid;
  }

  @override
  void generateRadomGrid() {
    for (var i = 0; i < rows * columns; i++) {
      frame[i] = CellFactory.createCell(
          genLife.nextInt(100) > 98 ? CellType.virus : CellType.bacteria,
          i ~/ rows,
          i % columns,
          genLife.nextInt(2) == 1 ? CellState.alive : CellState.dead);
    }
  }

  int countPredatorNeighbors(int row, int column) {
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
            findCell(r, c).cellType == CellType.virus) {
          count++;
        }
      }
    }
    return count;
  }
}
