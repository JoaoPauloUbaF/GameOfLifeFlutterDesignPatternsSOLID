import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

class PlayerWidget extends ConsumerWidget {
  const PlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGameState = ref.watch(gameOfLifeProvider);
    final currentGame = ref.watch(gameOfLifeProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          hoverColor: Colors.transparent,
          onPressed: () {
            if (currentGameState != GameState.ready) {
              return;
            }
            currentGame.startGame();
          },
          icon: const Icon(Icons.play_arrow),
          color: Colors.green,
        ),
        IconButton(
          hoverColor: Colors.transparent,
          onPressed: () => {
            currentGameState != GameState.stopped
                ? currentGame.stopGame()
                : null,
          },
          icon: const Icon(Icons.stop),
        ),
        IconButton(
          hoverColor: Colors.transparent,
          onPressed: () => currentGame.state == GameState.running
              ? currentGame.pauseGame()
              : null,
          icon: const Icon(Icons.pause),
          color: Colors.orange,
        ),
        IconButton(
          hoverColor: Colors.transparent,
          onPressed: () {
            currentGame.randomGame();
          },
          icon: const Icon(Icons.shuffle),
          color: Colors.blue,
        ),
      ],
    );
  }
}
