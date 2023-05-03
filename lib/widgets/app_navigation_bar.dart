import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  Widget build(BuildContext context) => Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: COLOR_SCHEME_POMODORO.background,
          boxShadow: const [
            BoxShadow(
              blurRadius: 20.0,
              spreadRadius: 4.0,
              offset: Offset(
                20.0,
                20.0,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.person,
                size: 32.0,
              ),
              onPressed: () => widget.onTap(0),
              color: widget.selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 1), // add some space between the icons
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
              ),
              child: Transform.scale(
                scale: 1.2,
                child: Transform.translate(
                  offset: const Offset(0, -20),
                  child: SizedBox(
                    width: 128.0,
                    height: 128.0,
                    child: IconButton(
                      icon: widget.selectedIndex == 1
                          ? SvgPicture.asset('assets/icons/nav_button_timer_selected.svg')
                          : SvgPicture.asset(
                              'assets/icons/nav_button_timer.svg',
                            ),
                      onPressed: () => widget.onTap(1),
                      color: widget.selectedIndex == 1 ? Colors.blue : Colors.grey,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 1), // add some space between the icons
            SizedBox(
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 32.0,
                ),
                onPressed: () => widget.onTap(2),
                color: widget.selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      );
}
