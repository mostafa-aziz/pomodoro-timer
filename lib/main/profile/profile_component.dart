import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';
import 'package:pomodoro_timer/main/settings/settings_store.dart';
import 'package:pomodoro_timer/main/timer/timer_store.dart';
import 'package:provider/provider.dart';

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  State<ProfileComponent> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  late final _settingsStore = context.read<SettingsStore>();
  late final _timerStore = context.read<TimerStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) => Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/bg_2.svg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 48.0),
              _buildCircleAvatar(context),
              const SizedBox(height: 24.0),
              _buildFullName(context),
              const SizedBox(height: 4.0),
              _buildFullEmail(context),
              const SizedBox(height: 48.0),
              _buildStatisticsLine(context),
            ],
          ),
        ],
      );

  Widget _buildCircleAvatar(BuildContext context) => const CircleAvatar(
        radius: 72.0,
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

  Widget _buildStatisticsLine(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                'Completed',
                style: context.textStyles.bodyLarge?.copyWith(color: context.colors.tertiary),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${_timerStore.completedSessions}',
                style: context.textStyles.headline2?.copyWith(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(width: 24.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Focus', style: context.textStyles.bodyLarge?.copyWith(color: context.colors.tertiary)),
              const SizedBox(height: 8.0),
              Text(
                '${_settingsStore.selectedFocusDuration}',
                style: context.textStyles.headline2?.copyWith(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(width: 24.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Break', style: context.textStyles.bodyLarge?.copyWith(color: context.colors.tertiary)),
              const SizedBox(height: 8.0),
              Text(
                '${_settingsStore.selectedBreakDuration}',
                style: context.textStyles.headline2?.copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      );
}
