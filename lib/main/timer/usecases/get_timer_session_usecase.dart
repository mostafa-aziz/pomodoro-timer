import 'package:pomodoro_timer/main/timer/database/timer_dao.dart';
import 'package:pomodoro_timer/main/timer/domain/timer_session.dart';

class GetTimerSessionUsecase {
  final TimerDao _timerDao;

  GetTimerSessionUsecase({
    required TimerDao timerDao,
  }) : _timerDao = timerDao;

  // Denne strømmer timerSession events
  Stream<List<TimerSession>> watchTimerSessions() => _timerDao.watchTimerSessions();

  Future<List<TimerSession>> getTimerSessions() async => _timerDao.fetchTimerSessions();

}
