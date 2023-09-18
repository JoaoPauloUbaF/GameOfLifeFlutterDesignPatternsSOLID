import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/cell_widget_factory.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';
import 'package:game_of_life_design_patterns_solid/utils/time_utils.dart';

class GridWidget extends ConsumerWidget {
  final GameOfLife gameOfLife = GameOfLife.instance;

  GridWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _ = ref.watch(gameOfLifeProvider);
    var currentGame = ref.read(gameOfLifeProvider.notifier);
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.93,
          height: MediaQuery.of(context).size.width * 0.93,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: currentGame.gridStrategy.grid.columns,
            ),
            itemBuilder: (context, index) {
              Cell cell = currentGame.gridStrategy.grid.frame[index];
              return CellWidgetFactory()
                  .createCellWidget(ref.watch(cellTypeProvider), cell);
            },
            itemCount: currentGame.gridStrategy.grid.frame.length,
          ),
        ),
      ],
    );
  }
}
