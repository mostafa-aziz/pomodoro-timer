import 'package:flutter/material.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';
import 'package:pomodoro_timer/main/settings/settings_store.dart';
import 'package:provider/provider.dart';

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  State<ProfileComponent> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  late final _settingsStore = context.read<SettingsStore>();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: context.colors.background,
            title: Text(
              'Profile',
              style: context.textStyles.headlineLarge?.copyWith(color: context.colors.onBackground),
            ),
          ),
          body: _buildContent(context),
        ),
      );

  Widget _buildContent(BuildContext context) => Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  _buildCircleAvatar(context),
                  const SizedBox(height: 24.0),
                  _buildFullName(context),
                  const SizedBox(height: 4.0),
                  _buildFullEmail(context),
                  const SizedBox(height: 24.0),
                  _buildStatisticsLine(context),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildCircleAvatar(BuildContext context) => const CircleAvatar(
        radius: 88.0,
        backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
      );

  Widget _buildFullName(BuildContext context) => Text(
        'Mostafus Aziz',
        style: context.textStyles.headline1,
      );

  Widget _buildFullEmail(BuildContext context) => Text(
        'mostafa.sa.aziz@gmail.com',
        style: context.textStyles.subtitle1,
      );

  Widget _buildStatisticsLine(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total completed sessions: ',
                style: context.textStyles.subtitle2,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current focus duration: ',
                style: context.textStyles.subtitle2,
              ),
              Text(
                '${_settingsStore.selectedFocusDuration}',
                style: context.textStyles.subtitle2,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current break duration: ',
                style: context.textStyles.subtitle2,
              ),
              Text(
                '${_settingsStore.selectedBreakDuration}',
                style: context.textStyles.subtitle2,
              ),
            ],
          ),
        ],
      );
}
