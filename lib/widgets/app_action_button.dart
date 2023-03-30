import 'package:flutter/material.dart';

class AppActionButton extends FilledButton {
  AppActionButton({
    Key? key,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    required Widget child,
  }) : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
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

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return FilledButton.styleFrom(
      foregroundColor: colorScheme.onPrimary,
      shadowColor: theme.shadowColor,
      disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      backgroundColor: colorScheme.primary,
      elevation: 0,
      textStyle: theme.textTheme.button?.copyWith(fontWeight: FontWeight.normal),
      minimumSize: const Size(64, 36),
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.forbidden,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: true,
      alignment: Alignment.center,
      splashFactory: InkRipple.splashFactory,
      maximumSize: const Size(256, 48),
      padding: EdgeInsets.zero,
      shape: const StadiumBorder(),
      side: BorderSide(
        width: 2.0,
        color: theme.colorScheme.primary,
      ),
    );
  }
}
