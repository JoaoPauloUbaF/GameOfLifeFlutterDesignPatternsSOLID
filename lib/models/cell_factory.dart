import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cell.dart';

class CellFactory {
  CellFactory._();

  static Cell createCell(CellType cellType, int x, int y, CellState health) {
    switch (cellType) {
      case CellType.virus:
        return Virus(x, y, health);
      case CellType.bacteria:
        return Bacteria(x, y, health);
      default:
        return NullCell();
    }
  }
}
