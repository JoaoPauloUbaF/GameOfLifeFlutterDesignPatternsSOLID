import 'package:flutter/material.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';

import '../models/grid.dart';
import 'CellWidget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.grid,
  });

  final Grid grid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.84,
      child: GridView.count(
        crossAxisCount: grid.rows,
        children: List.generate(grid.rows * grid.rows, (index) {
          int row = index ~/ grid.rows;
          int column = index % grid.rows;
          return CellWidget(grid: grid, index: index);
        }),
      ),
    );
  }
}
