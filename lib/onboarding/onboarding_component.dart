import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';
import 'package:pomodoro_timer/main/main_component.dart';
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
  Widget build(BuildContext context) => Provider<OnboardingStore>(
        create: (context) => OnboardingStore(
          preferences: context.read(),
        )..load(),
        dispose: (context, value) => value.dispose(),
        child: const OnboardingComponentBase(),
      );
}

class OnboardingComponentBase extends StatefulWidget {
  static const ROUTE_NAME = '/onboarding';

  const OnboardingComponentBase({Key? key}) : super(key: key);

  @override
  _OnboardingComponentBaseState createState() => _OnboardingComponentBaseState();
}

class _OnboardingComponentBaseState extends State<OnboardingComponentBase> {
  late final _store = context.read<OnboardingStore>();
  final PageController _pageController = PageController();
  int currentIndex = 0;
  bool isLastStep = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Observer(
            builder: (context) => _buildOnboardingCards(context),
          ),
        ),
      );

  Widget _buildOnboardingCards(BuildContext context) {
    final List<OnboardingCard> cardsToShow = _generateOnboardingCards(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(
              child: _buildOnboardingView(context, cardsToShow),
            ),
          ],
        ),
        Positioned(
          top: 24,
          right: 24,
          child: _buildSkipButton(context),
        ),
        Positioned(
          bottom: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildDotIndicator(context, cardsToShow.length),
          ),
        ),
      ],
    );
  }

  Widget _buildOnboardingView(
    BuildContext context,
    List<Widget> onboardingCards,
  ) =>
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
        itemBuilder: (BuildContext context, int index) => onboardingCards[index],
      );

  List<OnboardingCard> _generateOnboardingCards(BuildContext context) => [
        OnboardingCard(
          topIcon: SvgPicture.asset('assets/onboarding/onboarding1.svg'),
          caption: 'Welcome to ',
          title: 'Pomodoro',
          bodyText: 'Get inspired with this timer app!',
          step: OnboardingStepState.INTRO,
        ),
        OnboardingCard(
          topIcon: SvgPicture.asset('assets/onboarding/onboarding2.svg'),
          caption: 'Adjust our',
          title: 'Timer',
          bodyText: 'Adjust the Pomodoro timer for great concentration!',
          step: OnboardingStepState.INTRO,
        ),
        OnboardingCard(
          topIcon: SvgPicture.asset('assets/onboarding/onboarding1.svg'),
          caption: 'Use our ',
          title: 'Settings',
          bodyText: 'Use our settings to cater your experience',
          step: OnboardingStepState.INTRO,
        ),
      ];

  List<Widget> _buildDotIndicator(BuildContext context, int length) => List.generate(
        length,
        (index) => Container(
          height: 10.0,
          width: 10.0,
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currentIndex == index ? context.colors.onBackground : context.colors.tertiary,
          ),
        ),
      );

  Widget _buildSkipButton(BuildContext context) => TextButton(
        onPressed: () async => onOnboardingFinished(),
        child: Text(
          'Skip',
          style: context.textStyles.titleMedium?.copyWith(color: context.colors.onBackground),
        ),
      );

  Future<void> onOnboardingFinished() async {
    await _store.onOnboardingFinished();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainComponent()),
      );
    }
  }
}
