import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final Widget title;
  final Widget content;

  final Function(BuildContext context)? onPositivePressed;
  final Function(BuildContext context)? onNegativePressed;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    this.onPositivePressed,
    this.onNegativePressed,
  });

  @override
  Widget build(BuildContext context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title,
            const SizedBox(height: 24.0),
            content,
            Row(
              children: [
                _buildNegativeButton(context),
                const Spacer(),
                _buildPositiveButton(context),
              ],
            )
          ],
        ),
      );

  Widget _buildPositiveButton(BuildContext context) => OutlinedButton(
        onPressed: onPositivePressed != null ? () async => onPositivePressed!(context) : null,
        child: Text('Confirm'),
      );

  Widget _buildNegativeButton(BuildContext context) => OutlinedButton(
        onPressed: onNegativePressed != null ? () async => onNegativePressed!(context) : null,
        child: Text('Continue'),
      );
}
