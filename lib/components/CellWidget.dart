import 'package:flutter/material.dart';

import '../models/cell.dart';
import '../models/grid.dart';

class CellWidget extends StatelessWidget {
  const CellWidget({
    super.key,
    required this.grid,
    required this.index,
  });

  final Grid grid;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: grid.grid[index].health == CellState.alive
            ? Colors.black
            : Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
