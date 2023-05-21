import 'package:pomodoro_timer/main/settings/settings_repository.dart';

class GetSettingsUseCase {
  final SettingsRepository _repository;

  const GetSettingsUseCase({
    required SettingsRepository repository,
  }) : _repository = repository;

  Future<int> getFocusDuration() => _repository.getSettingsForFocusDurations('focusDuration');

  Future<int> getBreakDuration() => _repository.getSettingsForBreakDurations('breakDuration');
}
