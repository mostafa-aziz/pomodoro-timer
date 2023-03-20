import 'package:flutter/material.dart';

class AppActionButton extends FilledButton {
  AppActionButton({
    Key? key,
    required VoidCallback onPressed,
    required Widget child,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: SizedBox.expand(
            child: Ink(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: child,
              ),
            ),
          ),
        );
}
