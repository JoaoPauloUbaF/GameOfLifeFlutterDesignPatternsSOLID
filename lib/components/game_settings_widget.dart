import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/components/grid_rules_selector_widget.dart';
import 'package:game_of_life_design_patterns_solid/controllers/dimension_stepper.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';

import 'cell_type_selector_widget.dart';

class GameSettingsWidget extends ConsumerWidget {
  const GameSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _ = ref.watch(tickProvider);
    // ignore: prefer_const_constructors
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GridDimensionConfigCard(
              title: 'Enter the dimension',
              subtitle: '4 will create a 4x4 grids',
              bottomText: '',
            ),
            CellTypeSelector(),
            GridRulesSelector(),
          ],
        ),
        Slider(
          value: ref
              .watch(tickProvider.notifier)
              .duration
              .inMilliseconds
              .toDouble(),
          min: 100,
          max: 2000,
          divisions: 1000,
          label: 'Timer',
          onChangeEnd: (double value) {
            ref.read(tickProvider.notifier).resetTimer();
          },
          onChanged: (double value) {
            ref.read(tickProvider.notifier).setDuration(value.toInt());
          },
        ),
      ],
    );
  }
}

class GridDimensionConfigCard extends ConsumerWidget {
  const GridDimensionConfigCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.bottomText,
  });

  final String title;
  final String subtitle;
  final String bottomText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    int dimensionValue = ref.watch(dimensionStepperProvider);
    var dimension = ref.read(dimensionStepperProvider.notifier);
    return Container(
      height: 170,
      width: width / 4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title),
          Text(subtitle),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    color: Colors.white,
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      dimension.decrement();
                    },
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey[300],
                  child: Center(child: Text(' $dimensionValue ')),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: IconButton(
                    hoverColor: Colors.transparent,
                    color: Colors.white,
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      dimension.increment();
                    },
                  ),
                ),
              ],
            ),
          ),
          Text('Grid: $dimensionValue x $dimensionValue = '
              '${dimensionValue * dimensionValue} Cells!'),
        ],
      ),
    );
  }
}
