import 'package:pomodoro_timer/main/timer/database/timer_dao.dart';
import 'package:pomodoro_timer/main/timer/timer_repository.dart';

class ClearTimerSessionUsecase {
  final TimerDao _timerDao;
  final TimerRepository _repository;

  ClearTimerSessionUsecase({
    required TimerDao timerDao,
    required TimerRepository repository,
  })  : _timerDao = timerDao,
        _repository = repository;

  Future<void> clearTimerSessions() async => _timerDao.clearTimerSessions();

  Future<void> clearCompletedSessions() async => _repository.clearCompletedSessions();
}
