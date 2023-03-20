import 'package:base_template_app/core_utils/context_utils.dart';
import 'package:base_template_app/widgets/app_action_button.dart';
import 'package:flutter/material.dart';

class TimerComponent extends StatefulWidget {
  const TimerComponent({Key? key}) : super(key: key);

  @override
  State<TimerComponent> createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
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
          children: [
            const SizedBox(height: 24.0),
            Text('Test'),
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

  Widget _buildStartTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: AppActionButton(
          onPressed: () {},
          child: const Icon(Icons.play_arrow_rounded),
        ),
      );

  Widget _buildResetTimerButton(BuildContext context) => SizedBox(
        width: 88.0,
        child: AppActionButton(
          onPressed: () {},
          child: const Icon(Icons.restart_alt_rounded),
        ),
      );
}
