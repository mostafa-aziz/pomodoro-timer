import 'package:flutter/material.dart';
import 'package:pomodoro_timer/main/favorites/favorites_component.dart';
import 'package:pomodoro_timer/main/profile/profile_component.dart';
import 'package:pomodoro_timer/main/settings/settings_component.dart';
import 'package:pomodoro_timer/main/statistics/statistics_component.dart';
import 'package:pomodoro_timer/main/timer/timer_component.dart';
import 'package:pomodoro_timer/widgets/navigation_bar/app_navigation_bar.dart';

class MainComponent extends StatefulWidget {
  const MainComponent({Key? key}) : super(key: key);

  @override
  State<MainComponent> createState() => _MainComponentState();

  static final GlobalKey mainPageKey = GlobalKey();
}

class _MainComponentState extends State<MainComponent> {
  final PageController _pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                key: MainComponent.mainPageKey,
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: _onPageChanged,
                children: const [
                  ProfileComponent(),
                  FavoritesComponent(),
                  TimerComponent(),
                  StatisticsComponent(),
                  SettingsComponent(),
                ],
              ),
            ),
            AppNavigationBar(
              selectedIndex: selectedIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    navigateToProfile();
                    break;
                  case 1:
                    navigateToFavorites();
                    break;
                  case 2:
                    navigateToTimer();
                    break;
                  case 3:
                    navigateToStatistics();
                    break;
                  case 4:
                    navigateToSettings();
                    break;
                }
              },
            ),
          ],
        ),
      );

  void _onPageChanged(int index) {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => selectedIndex = index);
  }

  Future<void> navigateToProfile() async => _pageController.jumpToPage(0);

  Future<void> navigateToFavorites() async => _pageController.jumpToPage(1);

  Future<void> navigateToTimer() async => _pageController.jumpToPage(2);

  Future<void> navigateToStatistics() async => _pageController.jumpToPage(3);

  Future<void> navigateToSettings() async => _pageController.jumpToPage(4);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
