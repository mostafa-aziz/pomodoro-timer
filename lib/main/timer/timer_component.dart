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

  Widget _buildContent(BuildContext context) => Column(
        children: [
        ],
      );

  Widget _buildStartTimerButton(BuildContext context) => AppActionButton(
        onPressed: () {},
        child: Text('test'),
      );
}
