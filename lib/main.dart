import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/components/player_widget.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

import 'components/game_settings_widget.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Center(
            child: Text(
              'Game of Life with Design Patterns',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                var _ = ref.watch(gameOfLifeProvider);
                return Text(
                    'Geração ${ref.watch(gameOfLifeProvider.notifier).generation}',
                    style: const TextStyle(fontSize: 20));
              }),
              GridWidget(),
              const GameSettingsWidget(),
              const PlayerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
