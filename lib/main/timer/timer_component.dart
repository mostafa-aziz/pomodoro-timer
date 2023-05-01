import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/core_style/widgets/app_action_button.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';
import 'package:pomodoro_timer/main/timer/timer_store.dart';
import 'package:provider/provider.dart';

class TimerComponent extends StatefulWidget {
  const TimerComponent({Key? key}) : super(key: key);

  @override
  State<TimerComponent> createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  late final _store = context.read<TimerStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.background,
          title: Text(
            'Timer',
            style: context.textStyles.headlineLarge?.copyWith(
              color: context.colors.onBackground,
            ),
          ),
        ),
        body: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) => Observer(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Column(
                children: [
                  _buildTimerLabel(context),
                  const SizedBox(height: 48.0),
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
              const Spacer(),
            ],
          ),
        ),
      );

  Widget _buildTimerLabel(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(_store.myDuration.inMinutes.remainder(60));
    final seconds = strDigits(_store.myDuration.inSeconds.remainder(60));

    return Text(
      '$minutes:$seconds',
      style: context.textStyles.headlineLarge,
    );
  }

  Widget _buildStartTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: Observer(
          builder: (context) => AppActionButton(
            onPressed: () {
              if (_store.countdownTimer == null ||
                  !_store.countdownTimer!.isActive) {
                _store.startTimer();
              } else {
                _store.stopTimer();
              }
            },
            child: _store.shouldStartTimer
                ? const Icon(Icons.stop)
                : const Icon(Icons.play_arrow_rounded),
          ),
        ),
      );

  Widget _buildResetTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: AppActionButton(
          onPressed: () => _store.resetTimer(),
          child: const Icon(Icons.restart_alt_rounded),
        ),
      );
}
