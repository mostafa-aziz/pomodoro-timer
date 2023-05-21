import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';

class ProfileRepository {
  final AppPreferences _preferences;

  const ProfileRepository({
    required AppPreferences preferences,
  }) : _preferences = preferences;

  Future<void> storeCompletedSessions(String setting, Object value) => _preferences.put(setting, value);
}
