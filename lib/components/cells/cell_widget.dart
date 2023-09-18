import 'package:flutter/material.dart';

import '../../models/cells/cell.dart';

abstract class CellWidget extends StatelessWidget {
  final Cell cell;

  const CellWidget({super.key, required this.cell});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cell.cellHealth = cell.cellHealth == CellState.alive
            ? CellState.dead
            : CellState.alive;
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cell.getColor(),
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}

class RectangleCell extends StatefulWidget {
  final Cell cell;

  const RectangleCell({super.key, required this.cell});

  @override
  State<RectangleCell> createState() => _RectangleCellState();
}

class _RectangleCellState extends State<RectangleCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.cell.cellHealth = widget.cell.cellHealth == CellState.alive
            ? CellState.dead
            : CellState.alive;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: widget.cell.getColor(),
          border: Border.all(color: Colors.black),
        ),
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
        widget.cell.cellHealth = widget.cell.cellHealth == CellState.alive
            ? CellState.dead
            : CellState.alive;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.cell.getColor(),
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}
