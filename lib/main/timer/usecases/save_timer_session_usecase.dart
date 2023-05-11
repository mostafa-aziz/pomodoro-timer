import 'package:pomodoro_timer/main/timer/database/timer_dao.dart';
import 'package:pomodoro_timer/main/timer/domain/timer_session.dart';

class SaveTimerSessionUsecase {
  final TimerDao _timerDao;

  SaveTimerSessionUsecase({
    required TimerDao timerDao,
  }) : _timerDao = timerDao;

  Future<void> saveTimerSession(TimerSession timerSession) async => _timerDao.insertTimerSession(timerSession);
}
