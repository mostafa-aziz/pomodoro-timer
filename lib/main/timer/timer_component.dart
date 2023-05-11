import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/core_style/widgets/app_action_button.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';
import 'package:pomodoro_timer/core_utils/datetime_utils.dart';
import 'package:pomodoro_timer/main/settings/settings_store.dart';
import 'package:pomodoro_timer/main/timer/domain/timer_session.dart';
import 'package:pomodoro_timer/main/timer/timer_store.dart';
import 'package:pomodoro_timer/widgets/dialogs/app_dialog.dart';
import 'package:provider/provider.dart';

class TimerComponent extends StatefulWidget {
  const TimerComponent({Key? key}) : super(key: key);

  @override
  State<TimerComponent> createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  late final _store = context.read<TimerStore>();
  late final _settingsStore = context.read<SettingsStore>();

  @override
  void initState() {
    super.initState();
    _store.setDurationTimer(_settingsStore.selectedFocusDuration);
  }

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
          child: Stack(
            children: [
              Column(
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
                      const SizedBox(height: 48.0),
                    ],
                  ),
                  _buildTimerSessionsBoard(context),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildTimerSessionsBoard(BuildContext context) => Observer(
        builder: (context) => SizedBox(
          height: 224.0,
          child: ListView.separated(
            itemCount: _store.timerSessions.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (context, index) => ListTile(
              title: Center(
                child: Wrap(
                  children: [
                    Text(
                      _store.timerSessions[index]?.sessionName ?? 'No name',
                      style: context.textStyles.subtitle2,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      _store.timerSessions[index]?.sessionDate.dayAndMonthName ?? DateTime.now().toString(),
                      style: context.textStyles.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
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
            onPressed: () async {
              if (_store.countdownTimer == null || !_store.countdownTimer!.isActive) {
                _store.startTimer();
              } else {
                _store.stopTimer();

                showDialog(
                  context: context,
                  builder: (context) => _buildPauseDialog(context),
                );
              }
            },
            child: _store.shouldStartTimer ? const Icon(Icons.stop) : const Icon(Icons.play_arrow_rounded),
          ),
        ),
      );

  Widget _buildResetTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: AppActionButton(
          onPressed: () => _store.resetTimer(_settingsStore.selectedFocusDuration),
          child: const Icon(Icons.restart_alt_rounded),
        ),
      );

  Widget _buildPauseDialog(BuildContext context) => AppDialog(
        title: Text(
          'You paused the timer',
          style: context.textStyles.headline1,
        ),
        content: Text(
          'Have you lost your concentration already? Try not to stop the timer and concentrate!',
          style: context.textStyles.subtitle2,
        ),
        onNegativePressed: (context) {
          _store.startTimer();
          Navigator.of(context).pop();
        },
        onPositivePressed: (context) async {
          _store.resetTimer(_settingsStore.selectedFocusDuration);
          await _store.saveTimerSession(
            TimerSession(
              id: _store.completedSessions.toString(),
              sessionName: 'Session #${_store.completedSessions}',
              sessionDate: DateTime.now(),
              completedSessions: _store.completedSessions,
            ),
          );

          if (mounted) {
            Navigator.of(context).pop();
          }
        },
      );
}
