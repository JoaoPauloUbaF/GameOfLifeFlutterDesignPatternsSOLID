class Cell {
  int x;
  int y;
  bool alive;

  Cell(this.x, this.y, this.alive);

  get isAlive => alive;
  get xCoordinate => x;
  get yCoordinate => y;
}
