import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core_style/colors.dart';
import 'package:pomodoro_timer/dependencies.dart';
import 'package:pomodoro_timer/main/main_component.dart';

class PomodoroTimerApp extends StatelessWidget {
  const PomodoroTimerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: _buildThemeData(),
        builder: (context, child) => BaseDependencies(
          child: child!,
        ),
        home: const MainComponent(),
      );

  ThemeData _buildThemeData() => ThemeData(
        colorScheme: COLOR_SCHEME_POMODORO,
        canvasColor: COLOR_SCHEME_POMODORO.background,
        appBarTheme: const AppBarTheme(elevation: 0.0),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          filled: true,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color: COLOR_SCHEME_POMODORO.onBackground, fontSize: 25, fontWeight: FontWeight.normal),
          headline2: TextStyle(color: COLOR_SCHEME_POMODORO.onSurface, fontSize: 23, fontWeight: FontWeight.normal),
          headline3: TextStyle(color: COLOR_SCHEME_POMODORO.onSurface, fontSize: 20, fontWeight: FontWeight.normal),
          headline4: TextStyle(color: COLOR_SCHEME_POMODORO.onSurface, fontSize: 18, fontWeight: FontWeight.normal),
          headline6: TextStyle(color: COLOR_SCHEME_POMODORO.onSurface, fontSize: 20, fontWeight: FontWeight.w600),
          subtitle1: TextStyle(color: COLOR_SCHEME_POMODORO.tertiary, fontSize: 16, fontWeight: FontWeight.w600),
          subtitle2: TextStyle(color: COLOR_SCHEME_POMODORO.onBackground, fontSize: 16, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(color: COLOR_SCHEME_POMODORO.onSurface, fontSize: 14, fontWeight: FontWeight.w600),
          bodyText2: TextStyle(color: COLOR_SCHEME_POMODORO.onSurface, fontSize: 14),
          caption: TextStyle(color: COLOR_SCHEME_POMODORO.onSurface, fontSize: 10, fontWeight: FontWeight.w600),
          button: TextStyle(color: COLOR_SCHEME_POMODORO.onPrimary, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );
}
