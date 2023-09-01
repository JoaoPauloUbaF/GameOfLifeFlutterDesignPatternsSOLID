import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

import 'components/grid_widget.dart';

void main() {
  //add this
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: GameOfLifeApp(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class GameOfLifeApp extends StatefulWidget {
  const GameOfLifeApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GameOfLifeAppState createState() => _GameOfLifeAppState();
}

class _GameOfLifeAppState extends State<GameOfLifeApp> {
  Timer? timer;

  GameOfLife gameOfLife = GameOfLife.instance;

  var _currentStepValue = 20;

  @override
  void initState() {
    gameOfLife.debugState();
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      gameOfLife.state == GameState.running ? _tick() : timer.cancel();
    });
    super.initState();
  }

  void _tick() {
    setState(() {
      gameOfLife.generation++;
      gameOfLife.nextGeneration();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Generation: ${gameOfLife.generation}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                const Text(
                    'Enter the dimension (Example: 4 will create a 4x4 grid)'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (_currentStepValue > 0) {
                            _currentStepValue--;
                            gameOfLife.newGame(
                                _currentStepValue, _currentStepValue);
                          }
                        });
                      },
                    ),
                    Text('$_currentStepValue'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (_currentStepValue < 50) {
                            // Defina o limite superior conforme necessário
                            _currentStepValue++;
                            gameOfLife.newGame(
                                _currentStepValue, _currentStepValue);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Text('Grid: $_currentStepValue x $_currentStepValue = '
                '${_currentStepValue * _currentStepValue} Cells!'),
            Expanded(
              child: GridWidget(grid: gameOfLife.grid),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    if (!gameOfLife.grid.anyAliveCells()) {
                      return;
                    }
                    gameOfLife.startGame();
                    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                      gameOfLife.state == GameState.running
                          ? _tick()
                          : timer.cancel();
                    });
                  },
                  icon: const Icon(Icons.play_arrow),
                  color: Colors.green,
                ),
                IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () => {
                    timer!.isActive ? timer!.cancel() : null,
                    setState(() {
                      gameOfLife.generation = 0;
                      _currentStepValue = 20;
                      gameOfLife.stopGame();
                    })
                  },
                  icon: const Icon(Icons.stop),
                ),
                IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () => gameOfLife.state == GameState.running
                      ? gameOfLife.pauseGame()
                      : null,
                  icon: const Icon(Icons.pause),
                  color: Colors.orange,
                ),
                IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      gameOfLife.grid.generateRadomGrid();
                    });
                  },
                  icon: const Icon(Icons.shuffle),
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
