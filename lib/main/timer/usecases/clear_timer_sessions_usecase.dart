import 'package:pomodoro_timer/main/timer/database/timer_dao.dart';
import 'package:pomodoro_timer/main/timer/domain/timer_session.dart';

class ClearTimerSessionUsecase {
  final TimerDao _timerDao;

  ClearTimerSessionUsecase({
    required TimerDao timerDao,
  }) : _timerDao = timerDao;

  Future<void> clearTimerSessions() async => _timerDao.clearTimerSessions();
}
