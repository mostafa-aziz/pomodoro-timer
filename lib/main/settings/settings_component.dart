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
            child: DropdownButton(
              items: [
                DropdownMenuItem(child: Text('25')),
              ],
              onChanged: (_) {},
            ),
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
            child: DropdownButton(
              items: [
                DropdownMenuItem(child: Text('25')),
              ],
              onChanged: (_) {},
            ),
          )
        ],
      );
}
