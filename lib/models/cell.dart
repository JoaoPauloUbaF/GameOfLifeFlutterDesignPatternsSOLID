class Cell {
  int x;
  int y;
  CellState health;

  Cell(this.x, this.y, this.health);

  get isAlive => health;
  get xCoordinate => x;
  get yCoordinate => y;
}

enum CellState { alive, dead }
