import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'components/GridWidget.dart';
import 'models/grid.dart';

void main() {
  //add this
  runApp(
    const MaterialApp(home: GameOfLife()),
  );
}

class GameOfLife extends StatefulWidget {
  const GameOfLife({Key? key}) : super(key: key);

  @override
  _GameOfLifeState createState() => _GameOfLifeState();
}

class _GameOfLifeState extends State<GameOfLife> {
  late int _generation;

  late Grid grid;

  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      _tick();
    });

    super.initState();
    _generation = 0;
    grid = Grid(20, 20);
  }

  void _tick() {
    setState(() {
      _generation++;
      grid.nextGrid();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generation: $_generation'),
      ),
      body: ListView(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter number of rows',
            ),
            keyboardType: TextInputType.number,
            onSubmitted: (value) {
              setState(() {
                _generation = 0;
                grid.rows = int.parse(value);
                grid.columns = int.parse(value);
                grid.initGrid();
              });
            },
          ),
          GridWidget(grid: grid),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (timer!.isActive) {
                    return;
                  }
                  timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                    _tick();
                  });
                },
                icon: const Icon(Icons.play_arrow),
                color: Colors.green,
              ),
              IconButton(
                onPressed: () => {
                  timer!.isActive ? timer!.cancel() : null,
                  setState(() {
                    _generation = 0;
                    grid.initGrid();
                  })
                },
                icon: const Icon(Icons.stop),
              ),
              IconButton(
                onPressed: () => timer!.isActive ? timer!.cancel() : null,
                icon: const Icon(Icons.pause),
                color: Colors.orange,
              ),
            ],
          )
        ],
      ),
    );
  }
}
