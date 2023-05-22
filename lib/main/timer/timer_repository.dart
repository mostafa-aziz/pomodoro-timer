import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';

class TimerRepository {
  final AppPreferences _preferences;

  const TimerRepository({
    required AppPreferences preferences,
  }) : _preferences = preferences;

  Future<void> storeCompletedSessions(Object value) => _preferences.put('completedSessions', value);

  Future<int> getCompletedSessions() => _preferences.getInt('completedSessions', defaultValue: 0);

  Future<void> clearCompletedSessions() => _preferences.put('completedSessions', 0);
}
