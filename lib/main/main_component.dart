import 'package:base_template_app/main/profile/profile_component.dart';
import 'package:base_template_app/main/settings/settings_component.dart';
import 'package:base_template_app/main/timer/timer_component.dart';
import 'package:flutter/material.dart';

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
                  TimerComponent(),
                  ProfileComponent(),
                  SettingsComponent(),
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              backgroundColor: const Color(0xFF1E1B2E),
              onTap: (index) {
                switch (index) {
                  case 0:
                    setState(() {
                      selectedIndex = 0;
                    });
                    navigateToTimer();
                    break;
                  case 1:
                    setState(() {
                      selectedIndex = 1;
                    });
                    navigateToProfile();
                    break;
                  case 2:
                    setState(() {
                      selectedIndex = 2;
                    });
                    navigateToSettings();
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timer,
                    color: selectedIndex == 0 ? const Color(0xFF664FFF) : null,
                  ),
                  label: 'Timer',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_rounded,
                    color: selectedIndex == 1 ? const Color(0xFF664FFF) : null,
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: selectedIndex == 2 ? const Color(0xFF664FFF) : null,
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          ],
        ),
      );

  void _onPageChanged(int index) {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() => selectedIndex = index);
  }

  void navigateToTimer() => _pageController.jumpToPage(0);

  Future<void> navigateToProfile() async {
    _pageController.jumpToPage(1);
  }

  Future<void> navigateToSettings() async {
    _pageController.jumpToPage(2);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
