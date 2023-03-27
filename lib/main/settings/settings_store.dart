import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoro_timer/core_utils/base_store.dart';
import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase extends BaseStore with Store {
  final AppPreferences _preferences;

  @observable
  int selectedFocusDuration = 25;

  @observable
  int selectedBreakDuration = 25;

  final durationValues = [25, 30, 45, 60];

  SettingsStoreBase({
    required AppPreferences preferences,
  }) : _preferences = preferences;

  @action
  @override
  Future<void> load() async {}

  @action
  Future<void> updateFocusDuration(int focusDuration) async {
    try {
      selectedFocusDuration = focusDuration;
      //await _updatePreferredLanguageUseCase.updatePrefferedLanguage(locale);
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
    }
  }

  @action
  Future<void> updateBreakDuration(int breakDuration) async {
    try {
      selectedBreakDuration = breakDuration;
      //await _updatePreferredLanguageUseCase.updatePrefferedLanguage(locale);
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
    }
  }

  @action
  @override
  Future<void> dispose() async {}
}