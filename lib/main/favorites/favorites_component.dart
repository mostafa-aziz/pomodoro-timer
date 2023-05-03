import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';

class FavoritesComponent extends StatefulWidget {
  const FavoritesComponent({Key? key}) : super(key: key);

  @override
  State<FavoritesComponent> createState() => _FavoritesComponentState();
}

class _FavoritesComponentState extends State<FavoritesComponent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.background,
          title: Text(
            'Favorites',
            style: context.textStyles.headlineLarge?.copyWith(color: context.colors.onBackground),
          ),
        ),
        body: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) => Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset('assets/images/bg.svg'),
            ),
          ],
        ),
      );
}
