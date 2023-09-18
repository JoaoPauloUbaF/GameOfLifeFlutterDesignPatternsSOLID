import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/components/players/player_widget.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';
import 'package:game_of_life_design_patterns_solid/utils/time_utils.dart';

import 'components/settings/game_settings_widget.dart';
import 'components/grids/grid_widget.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GameSettingsWidget(),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Consumer(builder:
                    (BuildContext context, WidgetRef ref, Widget? child) {
                  final currentTime = ref.read(tickProvider);
                  var timeStr = formatDuration(currentTime);
                  var _ = ref.watch(gameOfLifeProvider);
                  return Row(
                    children: [
                      Text(
                          'Generation ${ref.watch(gameOfLifeProvider.notifier).generation}',
                          style: const TextStyle(fontSize: 20)),
                      const Spacer(),
                      Text(timeStr),
                    ],
                  );
                }),
              ),
              GridWidget(),
              const PlayerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
