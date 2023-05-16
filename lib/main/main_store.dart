import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pomodoro_timer/core_utils/base_store.dart';
import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';
import 'package:pomodoro_timer/onboarding/onboarding_store.dart';

part 'main_store.g.dart';

class MainStore = MainStoreBase with _$MainStore;

abstract class MainStoreBase extends BaseStore with Store {
  final AppPreferences _preferences;

  MainStoreBase({
    required AppPreferences preferences,
  }) : _preferences = preferences;

  @override
  @action
  Future<void> load() async {
    final lastOnboardingVersionShown = _preferences.getInt(KEY_CURRENT_ONBOARDING_VERSION);

  }

  @override
  @action
  Future<void> dispose() async {}
}
