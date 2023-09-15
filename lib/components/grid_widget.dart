import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';
import 'package:game_of_life_design_patterns_solid/utils/time_utils.dart';
import 'cell_widget.dart';

class GridWidget extends ConsumerWidget {
  final GameOfLife gameOfLife = GameOfLife.instance;

  GridWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _ = ref.watch(gameOfLifeProvider);
    final currentTime = ref.read(tickProvider);
    var currentGame = ref.read(gameOfLifeProvider.notifier);
    var timeStr = formatDuration(currentTime);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(timeStr),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 0.7,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: currentGame.gridStrategy.grid.columns,
            ),
            itemBuilder: (context, index) {
              Cell cell = currentGame.gridStrategy.grid.frame[index];
              return CircleCell(cell: cell);
            },
            itemCount: currentGame.gridStrategy.grid.frame.length,
          ),
        ),
      ],
    );
  }
}
