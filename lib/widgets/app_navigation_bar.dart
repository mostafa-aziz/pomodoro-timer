import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core_style/colors.dart';

class AppNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const AppNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<AppNavigationBar> {
  int _currentIndex = 1; // index of the middle element

  @override
  Widget build(BuildContext context) => Container(
        height: 80.0,
        decoration: BoxDecoration(
            color: COLOR_SCHEME_POMODORO.background,
            boxShadow: const [
              BoxShadow(
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 4.0, // has the effect of extending the shadow
                offset: Offset(
                  20.0, // horizontal, move right 10
                  20.0, // vertical, move down 10
                ),
              )
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              color: _currentIndex == 0 ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 1), // add some space between the icons
            IconButton(
              icon: const Icon(Icons.timer),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              color: _currentIndex == 1 ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 1), // add some space between the icons
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              color: _currentIndex == 2 ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      );
}
