import 'package:pomodoro_timer/main/timer/database/timer_dao.dart';
import 'package:pomodoro_timer/main/timer/domain/timer_session.dart';
import 'package:pomodoro_timer/main/timer/timer_repository.dart';

class GetTimerSessionUsecase {
  final TimerDao _timerDao;
  final TimerRepository _repository;

  GetTimerSessionUsecase({
    required TimerDao timerDao,
    required TimerRepository repository,
  })  : _timerDao = timerDao,
        _repository = repository;

  // Denne strømmer timerSession events
  Stream<List<TimerSession>> watchTimerSessions() => _timerDao.watchTimerSessions();

  Future<List<TimerSession>> getTimerSessions() async => _timerDao.fetchTimerSessions();

  Future<int> getCompletedSessions() async => _repository.getCompletedSessions();
}
