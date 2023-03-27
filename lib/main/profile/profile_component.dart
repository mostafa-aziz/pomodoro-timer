import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  State<ProfileComponent> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
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

  Widget _buildContent(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCircleAvatar(context),
          ],
        ),
      );

  Widget _buildCircleAvatar(BuildContext context) => const CircleAvatar(
        radius: 88.0,
        backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
      );
}
