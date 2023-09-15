import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/classic_grid.dart';

import 'easy_life_grid.dart';
import 'grid.dart';
import 'predator_prey_life_grid.dart';

class GridStrategy {
  Grid grid = ClassicGrid(CellType.bacteria);

  void setGrid(GridType gridType, CellType cellType,
      {int rows = 10, int columns = 10}) {
    grid = GridFactory.createGrid(gridType, cellType);
  }

  void nextGrid() {
    grid.nextGrid();
  }

  void createGrid({int rows = 10, int columns = 10}) {
    grid.createGrid(rows: rows, columns: columns);
  }

  bool anyAliveCells() {
    return grid.anyAliveCells();
  }

  void generateRadomGrid() {
    grid.generateRadomGrid();
  }
}

class GridFactory {
  static Grid createGrid(GridType gridType, CellType cellType,
      {int rows = 10, int columns = 10}) {
    switch (gridType) {
      case GridType.classic:
        return ClassicGrid(cellType, rows: rows, columns: columns);
      case GridType.easyLife:
        return EasyLifeGrid(cellType);
      case GridType.predatorPrey:
        return PredatorPreyLifeGrid(cellType, rows: rows, columns: columns);
      default:
        return ClassicGrid(cellType);
    }
  }
}
