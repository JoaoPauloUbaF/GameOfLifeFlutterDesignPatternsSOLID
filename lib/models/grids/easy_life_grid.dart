import '../cells/cell.dart';
import '../cells/cell_factory.dart';
import 'classic_grid.dart';

class EasyLifeGrid extends ClassicGrid {
  EasyLifeGrid(super.cellType);

  @override
  void nextGrid() {
    List<Cell> nextGrid = List.generate(
        rows * columns,
        (index) => CellFactory.createCell(
            cellType, index ~/ rows, index % columns, CellState.dead));
    for (var i = 0; i < rows * columns; i++) {
      int row = i ~/ rows;
      int column = i % columns;
      int aliveNeighbors = countAliveNeighbors(row, column);
      if (findCell(row, column).cellHealth == CellState.alive) {
        if (aliveNeighbors >= 1 && aliveNeighbors <= 4) {
          nextGrid[i] =
              CellFactory.createCell(cellType, row, column, CellState.alive);
        } else {
          nextGrid[i] =
              CellFactory.createCell(cellType, row, column, CellState.dead);
        }
      } else {
        if (aliveNeighbors == 2 || aliveNeighbors == 3) {
          nextGrid[i] =
              CellFactory.createCell(cellType, row, column, CellState.alive);
        } else {
          nextGrid[i] =
              CellFactory.createCell(cellType, row, column, CellState.dead);
        }
      }
    }
    frame = nextGrid;
  }
}
