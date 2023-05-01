import 'package:flutter/material.dart';

enum OnboardingStepState {
  INTRO,
  LOCATION,
  NOTIFICATIONS,
  FILTER,
  FAVORITES,
}

class OnboardingComponent extends StatefulWidget {
  const OnboardingComponent({Key? key}) : super(key: key);

  @override
  State<OnboardingComponent> createState() => _OnboardingComponentState();
}

class _OnboardingComponentState extends State<OnboardingComponent> {
  @override
  Widget build(BuildContext context) => Container();
}
