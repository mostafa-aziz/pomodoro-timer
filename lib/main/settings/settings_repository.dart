import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';

class SettingsRepository {
  final AppPreferences _preferences;

  const SettingsRepository({
    required AppPreferences preferences,
  }) : _preferences = preferences;

  Future<void> storeSettings(String setting, Object value) => _preferences.put(setting, value);

  Future<int> getSettingsForFocusDurations(String key) => _preferences.getInt(key, defaultValue: 25);

  Future<int> getSettingsForBreakDurations(String key) => _preferences.getInt(key, defaultValue: 5);
}
