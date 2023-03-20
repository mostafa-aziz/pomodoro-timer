import 'package:base_template_app/core_utils/context_utils.dart';
import 'package:base_template_app/main/timer/timer_store.dart';
import 'package:base_template_app/widgets/app_action_button.dart';
import 'package:base_template_app/widgets/app_semi_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            style: context.textStyles.headlineLarge?.copyWith(color: context.colors.onSecondary),
          ),
        ),
        body: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) => Observer(
        builder: (context) => Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: _buildCircleAvatar(context),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTimerLabel(context),
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
              const Align(
                alignment: Alignment.bottomCenter,
                child: MySemiCircle(
                  height: 430,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildCircleAvatar(BuildContext context) => const CircleAvatar(
        radius: 88.0,
        backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
      );

  Widget _buildTimerLabel(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(_store.myDuration.inMinutes.remainder(60));
    final seconds = strDigits(_store.myDuration.inSeconds.remainder(60));

    return Text(
      '$minutes:$seconds',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 48.0),
    );
  }

  Widget _buildStartTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: Observer(
            builder: (context) => AppActionButton(
                  onPressed: () {
                    if (_store.countdownTimer == null || !_store.countdownTimer!.isActive) {
                      _store.startTimer();
                    } else {
                      _store.stopTimer();
                    }
                  },
                  child: _store.shouldStartTimer ? const Icon(Icons.stop) : const Icon(Icons.play_arrow_rounded),
                )),
      );

  Widget _buildResetTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: AppActionButton(
          onPressed: () => _store.resetTimer(),
          child: const Icon(Icons.restart_alt_rounded),
        ),
      );
}
