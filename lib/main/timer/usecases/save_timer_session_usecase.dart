import 'package:pomodoro_timer/main/timer/database/timer_dao.dart';
import 'package:pomodoro_timer/main/timer/domain/timer_session.dart';
import 'package:pomodoro_timer/main/timer/timer_repository.dart';

class SaveTimerSessionUsecase {
  final TimerDao _timerDao;
  final TimerRepository _repository;

  SaveTimerSessionUsecase({
    required TimerDao timerDao,
    required TimerRepository repository,
  })  : _timerDao = timerDao,
        _repository = repository;

  Future<void> saveTimerSession(TimerSession timerSession) async => _timerDao.insertTimerSession(timerSession);

  Future<void> saveCompletedSessions(int completedSessions) async =>
      _repository.storeCompletedSessions(completedSessions);
}
