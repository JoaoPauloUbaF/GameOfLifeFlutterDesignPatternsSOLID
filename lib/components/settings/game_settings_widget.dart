import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/components/settings/grid_rules_selector_widget.dart';
import 'package:game_of_life_design_patterns_solid/controllers/dimension_stepper.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';

import 'cell_type_selector_widget.dart';
import 'grid_dimension_config_card_widget.dart';

class GameSettingsWidget extends ConsumerWidget {
  const GameSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _ = ref.watch(tickProvider);
    // ignore: prefer_const_constructors
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: GridDimensionConfigCard(),
                ),
              ),
              Expanded(child: CellTypeSelector()),
              Expanded(child: GridRulesSelector()),
            ],
          ),
          Slider.adaptive(
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            value: ref
                .watch(tickProvider.notifier)
                .duration
                .inMilliseconds
                .toDouble(),
            min: 100,
            max: 2000,
            divisions: 1000,
            label:
                'Tick Interval: ${ref.watch(tickProvider.notifier).duration.inMilliseconds} ms',
            onChangeEnd: (double value) {
              ref.read(tickProvider.notifier).resetTimer();
            },
            onChanged: (double value) {
              ref.read(tickProvider.notifier).setDuration(value.toInt());
            },
          ),
        ],
      ),
    );
  }
}
