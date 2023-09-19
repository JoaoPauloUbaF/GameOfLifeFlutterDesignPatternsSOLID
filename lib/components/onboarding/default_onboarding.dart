import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/onboarding.dart';

import '../../models/onboarding/onboarding_state.dart';

class DefaultOnboarding extends StatefulWidget {
  const DefaultOnboarding({
    super.key,
    required this.onboardingPagesList,
  });

  final List<PageModel> onboardingPagesList;

  @override
  State<DefaultOnboarding> createState() => _DefaultOnboardingState();
}

class _DefaultOnboardingState extends State<DefaultOnboarding> {
  int index = 0;

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          return InkWell(
            borderRadius: defaultSkipButtonBorderRadius,
            onTap: () {
              if (setIndex != null) {
                index = 2;
                setIndex(2);
              }
              ref.read(onboardingProvider.notifier).toggle();
            },
            child: const Padding(
              padding: defaultSkipButtonPadding,
              child: Text(
                'Skip',
                style: defaultSkipButtonTextStyle,
              ),
            ),
          );
        },
      ),
    );
  }

  Material _finishButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          return InkWell(
            borderRadius: defaultSkipButtonBorderRadius,
            onTap: () {
              if (setIndex != null) {
                index = widget.onboardingPagesList.length - 1;
                setIndex(widget.onboardingPagesList.length - 1);
              }
              ref.read(onboardingProvider.notifier).toggle();
            },
            child: const Padding(
              padding: defaultSkipButtonPadding,
              child: Text(
                'Finish',
                style: defaultSkipButtonTextStyle,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return Onboarding(
          pages: widget.onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.0,
                  color: background,
                ),
              ),
              child: ColoredBox(
                color: background,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_nonuniform,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      index == widget.onboardingPagesList.length - 1
                          ? _finishButton(setIndex: setIndex)
                          : _skipButton(setIndex: setIndex),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
