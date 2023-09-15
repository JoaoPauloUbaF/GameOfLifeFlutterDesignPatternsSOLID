import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/classic_grid.dart';

import 'easy_life_grid.dart';
import 'grid.dart';
import 'predator_prey_life_grid.dart';

class GridStrategy {
  Grid grid = ClassicGrid(CellType.bacteria);

  void setGrid(GridType gridType, CellType cellType) {
    grid = GridFactory.createGrid(gridType, cellType);
  }

  void nextGrid() {
    grid.nextGrid();
  }

  void createGrid() {
    grid.createGrid();
  }

  bool anyAliveCells(GridType gridType) {
    return grid.anyAliveCells();
  }

  void generateRadomGrid(GridType gridType) {
    grid.generateRadomGrid();
  }
}

class GridFactory {
  static Grid createGrid(GridType gridType, CellType cellType) {
    switch (gridType) {
      case GridType.classic:
        return ClassicGrid(cellType);
      case GridType.easyLife:
        return EasyLifeGrid(cellType);
      case GridType.predatorPrey:
        return PredatorPreyLifeGrid(cellType);
      default:
        return ClassicGrid(cellType);
    }
  }
}
