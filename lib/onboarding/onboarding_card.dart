import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';
import 'package:pomodoro_timer/main/onboarding/onboarding_component.dart';

class OnboardingCard extends StatelessWidget {
  final Widget topIcon;
  final String title;
  final String bodyText;
  final OnboardingStepState step;
  final Widget? urlButton;

  const OnboardingCard({
    Key? key,
    required this.topIcon,
    required this.title,
    required this.bodyText,
    required this.step,
    this.urlButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: topIcon,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: context.textStyles.headline2,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              bodyText,
              style: context.textStyles.subtitle2,
              textAlign: TextAlign.center,
            ),
          ),
          if (urlButton != null) urlButton!,
          const SizedBox(height: 32),
        ],
      );
}
