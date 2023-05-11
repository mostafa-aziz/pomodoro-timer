import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomodoro_timer/core_style/colors.dart';
import 'package:pomodoro_timer/widgets/navigation_bar/app_navigation_bar_button.dart';

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
                5.0,
                15.0,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppNavigationBarButton(
              icon: Icons.person_outline,
              onPressed: () => widget.onTap(0),
              isSelected: widget.selectedIndex == 0,
            ),
            const SizedBox(width: 4.0),
            AppNavigationBarButton(
              icon: Icons.favorite_border,
              onPressed: () => widget.onTap(1),
              isSelected: widget.selectedIndex == 1,
            ),
            const SizedBox(width: 4.0),
            Transform.scale(
              scale: 1.2,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: SizedBox(
                  width: 128.0,
                  height: 128.0,
                  child: IconButton(
                    icon: widget.selectedIndex == 2
                        ? SvgPicture.asset('assets/icons/nav_button_timer_selected.svg')
                        : SvgPicture.asset(
                            'assets/icons/nav_button_timer.svg',
                          ),
                    onPressed: () => widget.onTap(2),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4.0),
            AppNavigationBarButton(
              icon: Icons.bar_chart_outlined,
              onPressed: () => widget.onTap(3),
              isSelected: widget.selectedIndex == 3,
            ),
            const SizedBox(width: 4.0),
            AppNavigationBarButton(
              icon: Icons.settings_outlined,
              onPressed: () => widget.onTap(4),
              isSelected: widget.selectedIndex == 4,
            ),
          ],
        ),
      );
}
