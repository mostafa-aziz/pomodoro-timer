import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => Container();
}
