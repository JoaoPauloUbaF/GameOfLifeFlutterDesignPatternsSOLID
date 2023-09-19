import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/onboarding.dart';

import '../../components/onboarding/section_widget.dart.dart';

class OnboardingState extends StateNotifier<bool> {
  final List<PageModel> _pages = [
    PageModel(
      widget:
          const OnboardingSectionWidget(image1: 'assets/images/home_page.png'),
    ),
    PageModel(
      widget:
          const OnboardingSectionWidget(image1: 'assets/images/home_page.png'),
    ),
    PageModel(
      widget:
          const OnboardingSectionWidget(image1: 'assets/images/home_page.png'),
    ),
    PageModel(
      widget:
          const OnboardingSectionWidget(image1: 'assets/images/home_page.png'),
    ),
  ];

  get pages => _pages;

  OnboardingState() : super(false);

  void toggle() => state = !state;
}

final onboardingProvider = StateNotifierProvider<OnboardingState, bool>((ref) {
  return OnboardingState();
});
