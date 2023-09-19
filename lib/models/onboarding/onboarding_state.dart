import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/onboarding.dart';

import '../../components/onboarding/section_widget.dart.dart';

class OnboardingState extends StateNotifier<bool> {
  final List<PageModel> _pages = [
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_home.png',
        description: 'Welcome to the Game of Life!',
        textPosition: Offset(0.1, 0.5),
      ),
    ),
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_dimension.png',
        description: 'Choose the dimension of the grid',
        textPosition: Offset(0.05, 0.25),
      ),
    ),
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_cell_type.png',
        description: 'Choose the type of cell',
        textPosition: Offset(0.3, 0.25),
      ),
    ),
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_grid_type.png',
        description: 'Choose the type of grid',
        textPosition: Offset(0.3, 0.25),
      ),
    ),
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_tick_rate.png',
        description: 'Choose the tick rate',
        textPosition: Offset(0.25, 0.32),
      ),
    ),
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_generation.png',
        description: 'Display the generation',
        textPosition: Offset(0.1, 0.37),
      ),
    ),
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_player.png',
        description: 'Control the game',
        textPosition: Offset(0.3, 0.37),
      ),
    ),
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_time.png',
        description: 'Display the time',
        textPosition: Offset(0.45, 0.37),
      ),
    ),
    PageModel(
      widget: const OnboardingSectionWidget(
        imagePath: 'assets/images/onboarding/onboarding_grid.png',
        description: 'This is the grid',
        textPosition: Offset(0.1, 0.25),
      ),
    ),
  ];

  get pages => _pages;

  OnboardingState() : super(false);

  void toggle() => state = !state;
}

final onboardingProvider = StateNotifierProvider<OnboardingState, bool>((ref) {
  return OnboardingState();
});
