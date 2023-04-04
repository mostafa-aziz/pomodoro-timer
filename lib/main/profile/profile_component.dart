import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            style: context.textStyles.headlineLarge?.copyWith(color: context.colors.onBackground),
          ),
        ),
        body: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) => Center(
        child: Stack(
          children: [
            Align(
              child: _buildCircleAvatar(context),
            ),
            const SizedBox(height: 12.0),
            _buildFullName(context),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset('assets/images/bg.svg'),
            ),
          ],
        ),
      );

  Widget _buildCircleAvatar(BuildContext context) => const CircleAvatar(
        radius: 88.0,
        backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
      );

  Widget _buildFullName(BuildContext context) => Text(
        'Mostafus Koepern',
        style: context.textStyles.headline1,
      );

  Widget _buildStatisticsLine(BuildContext context) => Row();
}
