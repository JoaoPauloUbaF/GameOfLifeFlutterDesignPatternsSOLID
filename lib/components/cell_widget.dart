import 'package:flutter/material.dart';

import '../models/cell.dart';

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

class CircleCell extends StatefulWidget {
  final Cell cell;

  const CircleCell({super.key, required this.cell});

  @override
  State<CircleCell> createState() => _CircleCellState();
}

class _CircleCellState extends State<CircleCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.cell.health = widget.cell.health == CellState.alive
            ? CellState.dead
            : CellState.alive;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.cell.health == CellState.alive
              ? Colors.amber
              : Colors.transparent,
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}
