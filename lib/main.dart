import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';
import 'package:pomodoro_timer/onboarding/onboarding_store.dart';
import 'package:pomodoro_timer/pomodoro_timer_app.dart';
import 'package:stack_trace/stack_trace.dart';

void main() {
  commonMain();
}

Future<void> commonMain() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = AppPreferences();
  final bool showOnboarding = !(await preferences.getInt(KEY_CURRENT_ONBOARDING_VERSION) == ONBOARDING_VERSION);

  _configureLogging();
  runApp(
    PomodoroTimerApp(
      showOnboarding: showOnboarding,
    ),
  );
}

void _configureLogging() {
  Logger.root.level = Level.ALL;
  assert(() {
    Logger.root.onRecord.listen(_printLogRecord);
    return true;
  }());
}

final lineSplitRegexp = RegExp('.{1,${const int.fromEnvironment('DART_LOG_LINE_LENGTH', defaultValue: 180)}}');

void _printLogRecord(LogRecord record) {
  if (record.error == null) {
    lineSplitRegexp.allMatches(record.message).forEach((match) {
      debugPrint('${record.level.name}: ${record.time}: ${match.group(0)}');
    });
  }
  if (record.error != null) {
    lineSplitRegexp.allMatches(record.error.toString()).forEach((match) {
      debugPrint('${record.level.name}: ${record.time}: ${match.group(0)}');
    });
  }
  if (record.stackTrace != null) {
    lineSplitRegexp.allMatches(Trace.format(StackTrace.current)).forEach((match) {
      debugPrint('${record.level.name}: ${record.time}: ${match.group(0)}');
    });
    debugPrint('${record.level.name}: ${record.time}: <asynchronous suspension>');
    lineSplitRegexp.allMatches(Trace.format(record.stackTrace!)).forEach((match) {
      debugPrint('${record.level.name}: ${record.time}: ${match.group(0)}');
    });
  }
}
