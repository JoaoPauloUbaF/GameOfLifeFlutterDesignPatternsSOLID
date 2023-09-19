import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/components/players/player_widget.dart';
import 'package:game_of_life_design_patterns_solid/controllers/tick_controller.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';
import 'package:game_of_life_design_patterns_solid/models/onboarding/onboarding_state.dart';
import 'package:game_of_life_design_patterns_solid/utils/time_utils.dart';

import 'components/onboarding/default_onboarding.dart';
import 'components/settings/game_settings_widget.dart';
import 'components/grids/grid_widget.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: GameOfLifeApp(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class GameOfLifeApp extends ConsumerWidget {
  const GameOfLifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showOnboarding = ref.watch(onboardingProvider);
    final onboardingPagesList = OnboardingState().pages;
    return AnimatedSwitcher(
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        duration: const Duration(
            milliseconds: 500), // Defina a duração da animação aqui
        child: showOnboarding
            ? DefaultOnboarding(
                key: const ValueKey(
                    'onboarding'), // Chave para identificar o widget
                onboardingPagesList: onboardingPagesList)
            : Scaffold(
                key: const ValueKey('game'), // Chave para identificar o widget
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 250,
                          height: 150,
                          child: Image.asset('assets/images/app_logo.png',
                              fit: BoxFit.fill),
                        ),
                        const Spacer(),
                        IconButton(
                            iconSize: 28,
                            tooltip: "Onboarding",
                            hoverColor: Colors.transparent,
                            color: Colors.blue[900],
                            onPressed: () =>
                                ref.read(onboardingProvider.notifier).toggle(),
                            icon: const Icon(Icons.help)),
                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const GameSettingsWidget(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Consumer(builder: (BuildContext context,
                                WidgetRef ref, Widget? child) {
                              final currentTime = ref.read(tickProvider);
                              var timeStr = formatDuration(currentTime);
                              var _ = ref.watch(gameOfLifeProvider);
                              return Row(
                                children: [
                                  Text(
                                      'Generation ${ref.watch(gameOfLifeProvider.notifier).generation}',
                                      style: const TextStyle(fontSize: 20)),
                                  const Spacer(),
                                  const PlayerWidget(),
                                  const Spacer(),
                                  Text(timeStr),
                                ],
                              );
                            }),
                          ),
                          GridWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
  }
}
