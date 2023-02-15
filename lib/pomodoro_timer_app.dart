import 'package:base_template_app/main/main_component.dart';
import 'package:flutter/material.dart';

class PomodoroTimerApp extends StatelessWidget {
  const PomodoroTimerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Base Template App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainComponent(),
      );
}
