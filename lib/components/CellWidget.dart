import 'package:flutter/material.dart';

import '../models/cell.dart';
import '../models/grid.dart';

class RectangleCell extends StatelessWidget {
  final CellState health;

  const RectangleCell({super.key, required this.health});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: health == CellState.alive ? Colors.green : Colors.transparent,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}

class CircleCell extends StatelessWidget {
  final CellState health;

  const CircleCell({super.key, required this.health});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: health == CellState.alive ? Colors.amber : Colors.transparent,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}
