import 'dart:async';

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

  SettingsStoreBase({
    required AppPreferences preferences,
  }) : _preferences = preferences;

  @action
  @override
  Future<void> load() async {}

  @action
  @override
  Future<void> dispose() async {}
}
