import 'package:flutter/material.dart';
import 'package:game_of_life_design_patterns_solid/components/cell_widget.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';

class CellWidgetFactory {
  Widget createCellWidget(CellType cellType, Cell cell) {
    switch (cellType) {
      case CellType.bacteria:
        return CircleCell(
          cell: cell,
        );
      case CellType.virus:
        return RectangleCell(
          cell: cell,
        );
      default:
        return CircleCell(
          cell: cell,
        );
    }
  }
}
