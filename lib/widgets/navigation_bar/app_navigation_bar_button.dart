import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core_style/colors.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';

class AppNavigationBarButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final String title;
  final bool isSelected;

  const AppNavigationBarButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              icon,
              size: 32.0,
            ),
            onPressed: onPressed,
            color: _getOutlineColorForButton(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: context.textStyles.bodySmall?.copyWith(color: Colors.black),
            ),
          ),
        ],
      );

  Color _getOutlineColorForButton() => isSelected ? COLOR_SCHEME_POMODORO.outline : Colors.black;
}
