import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';
import 'package:pomodoro_timer/main/settings/settings_store.dart';
import 'package:provider/provider.dart';

class SettingsComponent extends StatefulWidget {
  const SettingsComponent({Key? key}) : super(key: key);

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  late final _store = context.read<SettingsStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.background,
          title: Text(
            'Settings',
            style: context.textStyles.headline1,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      'Durations',
                      style: context.textStyles.headlineMedium,
                    ),
                    const SizedBox(height: 16.0),
                    _buildFocusDuration(context),
                    const SizedBox(height: 16.0),
                    _buildBreakDuration(context),
                    const SizedBox(height: 32.0),
                    Text(
                      'About',
                      style: context.textStyles.headlineMedium,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Version'),
                        Spacer(),
                        Text('1.0.0'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildFocusDuration(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Focus Duration',
            style: context.textStyles.subtitle2,
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: double.infinity,
            child: Observer(
                builder: (context) => DropdownButton(
                      value: _store.selectedFocusDuration,
                      items: _store.durationValues
                          .map((int value) => DropdownMenuItem(
                                value: value,
                                child: Text(value.toString()),
                              ))
                          .toList(),
                      onChanged: (int? focusDuration) async {
                        if (focusDuration == null) {
                          return;
                        }

                        await _store.updateFocusDuration(focusDuration);
                      },
                    )),
          )
        ],
      );

  Widget _buildBreakDuration(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Break Duration',
            style: context.textStyles.subtitle2,
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: double.infinity,
            child: Observer(
              builder: (context) => DropdownButton(
                value: _store.selectedBreakDuration,
                items: _store.durationValues
                    .map(
                      (int value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.toString()),
                      ),
                    )
                    .toList(),
                onChanged: (int? breakDuration) async {
                  if (breakDuration == null) {
                    return;
                  }

                  await _store.updateBreakDuration(breakDuration);
                },
              ),
            ),
          )
        ],
      );
}
