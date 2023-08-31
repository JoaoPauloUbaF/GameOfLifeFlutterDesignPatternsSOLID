import 'package:flutter/material.dart';

import '../models/grid.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.grid,
  });

  final Grid grid;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.84,
      color: Colors.grey,
      child: GridView.count(
        crossAxisCount: grid.rows,
        children: List.generate(grid.rows * grid.rows, (index) {
          int row = index ~/ grid.rows;
          int column = index % grid.rows;
          return Container(
            decoration: BoxDecoration(
              color: grid.grid[row][column] == 1 ? Colors.black : Colors.white,
              border: Border.all(color: Colors.grey),
            ),
          );
        }),
      ),
    );
  }
}
