import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/components/player_widget.dart';
import 'package:game_of_life_design_patterns_solid/controllers/dimension_stepper.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

import 'cell_type_selector.dart';

class GameSettingsWidget extends ConsumerWidget {
  const GameSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 20,
              ),
              GridDimensionConfigCard(
                title: 'Enter the dimension',
                subtitle: '4 will create a 4x4 grids',
                bottomText: '',
              ),
              SizedBox(
                width: 20,
              ),
              CellTypeSelector(),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
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
    int dimensionValue = ref.watch(dimensionStepperProvider);
    var dimension = ref.read(dimensionStepperProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title),
            Text(subtitle),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
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
            ),
            Text('Grid: $dimensionValue x $dimensionValue = '
                '${dimensionValue * dimensionValue} Cells!'),
          ],
        ),
      ),
    );
  }
}
