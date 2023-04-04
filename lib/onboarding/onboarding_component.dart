import 'package:flutter/material.dart';

enum OnboardingStepState {
  INTRO,
  LOCATION,
  NOTIFICATIONS,
  FILTER,
  FAVORITES,
}

class OnboardingComponent extends StatelessWidget {
  const OnboardingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column();
}

class OnboardingComponentBase extends StatefulWidget {
  static const ROUTE_NAME = '/onboarding';

  const OnboardingComponentBase({Key? key}) : super(key: key);

  @override
  _OnboardingComponentBaseState createState() => _OnboardingComponentBaseState();
}

class _OnboardingComponentBaseState extends State<OnboardingComponentBase> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  bool isLastStep = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
