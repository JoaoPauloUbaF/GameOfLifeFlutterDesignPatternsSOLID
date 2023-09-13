import 'package:flutter/material.dart';

abstract class Cell {
  CellType cellType = CellType.cell;
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
    cellType = CellType.cell;
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

enum CellState { alive, dead }

enum CellType { cell, virus, bacteria }
