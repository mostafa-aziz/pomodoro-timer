import 'dart:async';

import 'package:base_template_app/core_utils/context_utils.dart';
import 'package:base_template_app/widgets/app_action_button.dart';
import 'package:flutter/material.dart';

class TimerComponent extends StatefulWidget {
  const TimerComponent({Key? key}) : super(key: key);

  @override
  State<TimerComponent> createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 25);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.background,
          title: Text(
            'Timer',
            style: context.textStyles.headline6,
          ),
        ),
        body: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimerLabel(context),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStartTimerButton(context),
                const SizedBox(width: 8.0),
                _buildResetTimerButton(context),
              ],
            ),
          ],
        ),
      );

  Widget _buildTimerLabel(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Text(
      '$minutes:$seconds',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 48.0),
    );
  }

  Widget _buildStartTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: AppActionButton(
          onPressed: () {
            if (countdownTimer == null || !countdownTimer!.isActive) {
              startTimer();
            } else {
              stopTimer();
            }
          },
          child: countdownTimer != null && countdownTimer!.isActive
              ? const Icon(Icons.stop)
              : const Icon(Icons.play_arrow_rounded),
        ),
      );

  Widget _buildResetTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: AppActionButton(
          onPressed: () {},
          child: const Icon(Icons.restart_alt_rounded),
        ),
      );

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 25));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;

    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
}
