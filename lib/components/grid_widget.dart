import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';
import 'package:game_of_life_design_patterns_solid/utils/time_utils.dart';
import 'package:intl/intl.dart';
import '../models/grid.dart';
import 'cell_widget.dart';

class GridWidget extends ConsumerWidget {
  final GameOfLife gameOfLife = GameOfLife.instance;

  GridWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _ = ref.watch(gameOfLifeProvider);
    final currentTime = ref.watch(tickProvider);
    var currentGame = ref.watch(gameOfLifeProvider.notifier);
    var timeStr = formatDuration(currentTime);
    return Column(
      children: [
        Text('Tempo Decorrido: $timeStr'),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: currentGame.grid.columns,
            ),
            itemBuilder: (context, index) {
              Cell cell = currentGame.grid.frame[index];
              return CircleCell(cell: cell);
            },
            itemCount: currentGame.grid.frame.length,
          ),
        ),
      ],
    );
  }
}
