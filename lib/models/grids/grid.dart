import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cells/cell.dart';

abstract class Grid {
  late int rows;
  late int columns;
  late List<Cell> frame;

  bool anyAliveCells();

  void createGrid({int rows, int columns});

  void generateRadomGrid();

  Cell findCell(int row, int column);

  int countAliveNeighbors(int row, int column);

  void nextGrid();

  void setDimension({required int size});
}

enum GridType { classic, predatorPrey, easyLife }

class GridTypeNotifier extends Notifier<GridType> {
  @override
  GridType build() {
    return GridType.classic;
  }

  void setGridType(GridType gridType) {
    state = gridType;
  }
}

final gridTypeProvider =
    NotifierProvider<GridTypeNotifier, GridType>(GridTypeNotifier.new);
