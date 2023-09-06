import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/controllers/dimension_stepper.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

class GameSettingsWidget extends ConsumerWidget {
  const GameSettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentStep = ref.read(dimensionStepperProvider.notifier);
    var currentStepValue = ref.watch(dimensionStepperProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GameConfigCard(
            currentStep: currentStep,
            currentStepValue: currentStepValue,
            ref: ref),
        GameConfigCard(
            currentStep: currentStep,
            currentStepValue: currentStepValue,
            ref: ref),
        GameConfigCard(
            currentStep: currentStep,
            currentStepValue: currentStepValue,
            ref: ref),
      ],
    );
  }
}

class GameConfigCard extends StatelessWidget {
  const GameConfigCard({
    super.key,
    required this.currentStep,
    required this.currentStepValue,
    required this.ref,
  });

  final WidgetRef ref;
  final DimensionStepper currentStep;
  final int currentStepValue;

  @override
  Widget build(BuildContext context) {
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
            const Text('Enter the dimension'),
            const Text('(4 will create a 4x4 grid)'),
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
                          currentStep.decrement();
                          ref
                              .read(gameOfLifeProvider.notifier)
                              .newGame(currentStepValue, currentStepValue);
                        },
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey[300],
                      child: Center(child: Text(' $currentStepValue ')),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          currentStep.increment();
                          ref
                              .read(gameOfLifeProvider.notifier)
                              .newGame(currentStepValue, currentStepValue);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('Grid: $currentStepValue x $currentStepValue = '
                '${currentStepValue * currentStepValue} Cells!'),
          ],
        ),
      ),
    );
  }
}
