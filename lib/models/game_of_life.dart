import 'grid.dart';

class GameOfLife {
  static GameOfLife? _instance;

  late final int generation = 0;
  Grid grid = Grid(20, 20);

  // Avoid self instance
  GameOfLife._();
  static GameOfLife get instance => _instance ??= GameOfLife._();
}
