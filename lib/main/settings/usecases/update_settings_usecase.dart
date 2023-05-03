import 'package:pomodoro_timer/main/settings/settings_repository.dart';

class UpdateSettingsUseCase {
  final SettingsRepository _repository;

  const UpdateSettingsUseCase({
    required SettingsRepository repository,
  }) : _repository = repository;

  Future<void> updateFocusDuration(int value) => _repository.storeSettings('focusDuration', value);

  Future<void> updateBreakDuration(int value) => _repository.storeSettings('breakDuration', value);

  Future<int> getFocusDuration() => _repository.getSettingsForDurations('focusDuration');

  Future<int> getBreakDuration() => _repository.getSettingsForDurations('breakDuration');
}
