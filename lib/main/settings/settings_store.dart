import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoro_timer/core_utils/base_store.dart';
import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';
import 'package:pomodoro_timer/main/settings/usecases/update_settings_usecase.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase extends BaseStore with Store {
  final AppPreferences _preferences;
  final UpdateSettingsUseCase _updateSettingsUseCase;

  final focusDurationValues = [25, 30, 45];
  final breakDurationValues = [5, 10, 15];

  @observable
  int selectedFocusDuration = 25;

  @observable
  int selectedBreakDuration = 5;

  SettingsStoreBase({
    required AppPreferences preferences,
    required UpdateSettingsUseCase updateSettingsUseCase,
  })  : _preferences = preferences,
        _updateSettingsUseCase = updateSettingsUseCase;

  @action
  @override
  Future<void> load() async {
    selectedFocusDuration = await _updateSettingsUseCase.getFocusDuration();
    selectedBreakDuration = await _updateSettingsUseCase.getBreakDuration();
  }

  @action
  Future<void> updateFocusDuration(int focusDuration) async {
    try {
      await _updateSettingsUseCase.updateFocusDuration(focusDuration);
      selectedFocusDuration = focusDuration;
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
    }
  }

  @action
  Future<void> updateBreakDuration(int breakDuration) async {
    try {
      await _updateSettingsUseCase.updateBreakDuration(breakDuration);
      selectedBreakDuration = breakDuration;
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
    }
  }

  @action
  @override
  Future<void> dispose() async {}
}
