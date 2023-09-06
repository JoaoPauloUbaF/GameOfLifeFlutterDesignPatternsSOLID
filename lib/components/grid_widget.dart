import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';
import 'package:intl/intl.dart';
import '../models/grid.dart';
import 'cell_widget.dart';

class GridWidget extends ConsumerWidget {
  GridWidget({
    super.key,
    required this.grid,
  });

  late Grid grid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGameState = ref.watch(gameOfLifeProvider);
    final currentTime = ref.watch(tickProvider);
    var currentGame = ref.watch(gameOfLifeProvider.notifier);
    Grid grid = currentGame.grid;
    grid.nextGrid();
    return Column(
      children: [
        Text(DateFormat.Hms().format(currentTime)),
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
