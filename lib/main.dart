import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

import 'components/grid_widget.dart';

void main() {
  //add this
  runApp(
    const MaterialApp(home: GameOfLifeApp()),
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

  var _currentSliderValue = 20.0;

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
      appBar: AppBar(
        title: Text('Generation: ${gameOfLife.generation}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
                'Enter the dimension (Example: 4 will create a 4x4 grid)'),
            const SizedBox(height: 20),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 50,
              divisions: 50,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  gameOfLife.newGame(value as int, value as int);
                });
              },
            ),
            Text('Grid: $_currentSliderValue x $_currentSliderValue = '
                '${_currentSliderValue * _currentSliderValue} Cells!'),
            Expanded(
              child: GridWidget(grid: gameOfLife.grid),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
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
                  onPressed: () => {
                    timer!.isActive ? timer!.cancel() : null,
                    setState(() {
                      gameOfLife.generation = 0;
                      _currentSliderValue = 20;
                      gameOfLife.stopGame();
                    })
                  },
                  icon: const Icon(Icons.stop),
                ),
                IconButton(
                  onPressed: () => gameOfLife.state == GameState.running
                      ? gameOfLife.pauseGame()
                      : null,
                  icon: const Icon(Icons.pause),
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
