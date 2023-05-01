import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomodoro_timer/onboarding/onboarding_card.dart';
import 'package:pomodoro_timer/onboarding/onboarding_store.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) =>
      Provider<OnboardingStore>(
        create: (context) =>
        OnboardingStore(
          preferences: context.read(),
        )
          ..load(),
        dispose: (context, value) => value.dispose(),
        child: const OnboardingComponentBase(),
      );
}

class OnboardingComponentBase extends StatefulWidget {
  static const ROUTE_NAME = '/onboarding';

  const OnboardingComponentBase({Key? key}) : super(key: key);

  @override
  _OnboardingComponentBaseState createState() =>
      _OnboardingComponentBaseState();
}

class _OnboardingComponentBaseState extends State<OnboardingComponentBase> {
  late final _store = context.read<OnboardingStore>();
  final PageController _pageController = PageController();
  int currentIndex = 0;
  bool isLastStep = false;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: SafeArea(
          child: Observer(
            builder: (context) => _buildOnboardingCards(context),
          ),
        ),
      );

  Widget _buildOnboardingCards(BuildContext context) {
    final List<OnboardingCard> cardsToShow = _generateOnboardingCards(context);

    return Stack(
      children: [
        _buildOnboardingView(context, cardsToShow),
      ],
    );
  }

  List<OnboardingCard> _generateOnboardingCards(BuildContext context) =>
      [
        OnboardingCard(
          topIcon: SvgPicture.asset('assets/onboarding/onboarding1.svg'),
          caption: 'Welcome to ',
          title: 'Socially!',
          bodyText: 'bodyText',
          step: OnboardingStepState.INTRO,
        ),
      ];

  Widget _buildOnboardingView(BuildContext context,
      List<Widget> onboardingCards,) =>
      PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (pageIndex) {
          setState(() {
            currentIndex = pageIndex;
            if (currentIndex == onboardingCards.length - 1) {
              isLastStep = true;
            }
          });
        },
        itemBuilder: (BuildContext context, int index) =>
        onboardingCards[index],
      );
}
