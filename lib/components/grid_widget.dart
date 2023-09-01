import 'package:flutter/material.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import '../models/grid.dart';
import 'cell_widget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.grid,
  });

  final Grid grid;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: grid.columns,
      ),
      itemBuilder: (context, index) {
        Cell cell = grid.grid[index];
        return CircleCell(cell: cell);
      },
      itemCount: grid.grid.length,
    );
  }
}
