import 'package:base_template_app/core_utils/context_utils.dart';
import 'package:flutter/material.dart';

class SettingsComponent extends StatefulWidget {
  const SettingsComponent({Key? key}) : super(key: key);

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.background,
          title: Text(
            'Settings',
            style: context.textStyles.headline6,
          ),
        ),
        body: ListView(
          children: [],
        ),
      );
}
