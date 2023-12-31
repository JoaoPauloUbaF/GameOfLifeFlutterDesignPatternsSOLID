import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Cell {
  CellType? cellType;
  int cellXPos = 0;
  int cellYPos = 0;
  CellState cellHealth = CellState.dead;
  Color cellColor = Colors.transparent;

  get isAlive => cellHealth;
  get xCoordinate => cellXPos;
  get yCoordinate => cellYPos;
  get color => cellColor;

  Color getColor();
}

class Virus extends Cell {
  Virus(int x, int y, CellState health) {
    cellType = CellType.virus;
    cellXPos = x;
    cellYPos = y;
    cellHealth = health;
  }

  @override
  Color getColor() {
    cellHealth == CellState.alive
        ? cellColor = Colors.green
        : cellColor = Colors.transparent;
    return cellColor;
  }
}

class Bacteria extends Cell {
  Bacteria(int x, int y, CellState health) {
    cellType = CellType.bacteria;
    cellXPos = x;
    cellYPos = y;
    cellHealth = health;
  }

  @override
  Color getColor() {
    cellHealth == CellState.alive
        ? cellColor = Colors.purple
        : cellColor = Colors.transparent;
    return cellColor;
  }
}

class NullCell extends Cell {
  NullCell() {
    cellType = CellType.bacteria;
    cellXPos = 0;
    cellYPos = 0;
    cellHealth = CellState.dead;
    cellColor = Colors.transparent;
  }

  @override
  Color getColor() {
    cellColor = Colors.transparent;
    return cellColor;
  }
}

class CellTypeNotifier extends Notifier<CellType> {
  void setCellType(CellType cellType) {
    state = cellType;
  }

  @override
  CellType build() {
    return CellType.bacteria;
  }
}

final cellTypeProvider =
    NotifierProvider<CellTypeNotifier, CellType>(CellTypeNotifier.new);

enum CellState { alive, dead }

enum CellType { virus, bacteria }
