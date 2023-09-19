import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingSectionWidget extends StatelessWidget {
  const OnboardingSectionWidget({
    super.key,
    required this.image1,
  });

  final String image1;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey[700],
        border: Border.all(
          width: 0.0,
          color: background,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Image.asset(
              image1,
            ),
          ),
        ],
      ),
    );
  }
}
