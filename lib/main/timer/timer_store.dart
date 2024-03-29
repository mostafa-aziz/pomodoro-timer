import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mobx/mobx.dart';
import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';
import 'package:pomodoro_timer/main/timer/domain/timer_session.dart';
import 'package:pomodoro_timer/main/timer/usecases/clear_timer_sessions_usecase.dart';
import 'package:pomodoro_timer/main/timer/usecases/get_timer_session_usecase.dart';
import 'package:pomodoro_timer/main/timer/usecases/save_timer_session_usecase.dart';

part 'timer_store.g.dart';

class TimerStore = TimerStoreBase with _$TimerStore;

// TODO(mostafa): Block screen transitions with timer.

abstract class TimerStoreBase with Store {
  final AppPreferences _preferences;
  final GetTimerSessionUsecase _getTimerSessionUsecase;
  final SaveTimerSessionUsecase _saveTimerSessionUsecase;
  final ClearTimerSessionUsecase _clearTimerSessionUsecase;

  @observable
  Timer? countdownTimer;

  @observable
  Duration myDuration = const Duration(minutes: 25);

  @observable
  bool shouldStartTimer = false;

  @observable
  int completedSessions = 0;

  @observable
  bool shouldShowNavigationBar = true;

  @observable
  List<TimerSession?> timerSessions = [];

  StreamSubscription? _timerSubscription;

  TimerStoreBase({
    required AppPreferences preferences,
    required GetTimerSessionUsecase getTimerSessionUsecase,
    required SaveTimerSessionUsecase saveTimerSessionUsecase,
    required ClearTimerSessionUsecase clearTimerSessionUsecase,
  })  : _preferences = preferences,
        _getTimerSessionUsecase = getTimerSessionUsecase,
        _saveTimerSessionUsecase = saveTimerSessionUsecase,
        _clearTimerSessionUsecase = clearTimerSessionUsecase;

  @action
  Future<void> load() async {
    await getTimerSessions();
    // Denne lytter til strømmen av timerSessions
    _timerSubscription = _getTimerSessionUsecase.watchTimerSessions().listen(_updateTimerSessions);
    myDuration = Duration(minutes: await _preferences.getInt('focusDuration'));
  }

  // Her oppdaterer vi vår "observable" timerSessions liste hver gang det kommer inn en ny event til streamen
  @action
  Future<void> _updateTimerSessions(List<TimerSession> timerSessions) async {
    this.timerSessions = timerSessions;
  }

  @action
  void startTimer() {
    shouldStartTimer = true;
    shouldShowNavigationBar = false;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => _setCountDown());
  }

  @action
  void setDurationTimer(int minutes) {
    myDuration = Duration(minutes: minutes);
  }

  @action
  void stopTimer() {
    countdownTimer!.cancel();
    shouldStartTimer = false;
  }

  @action
  void resetTimer(int duration) {
    stopTimer();
    shouldShowNavigationBar = true;
    myDuration = Duration(minutes: duration);
    completedSessions++;
  }

  void _setCountDown() {
    const reduceSecondsBy = 1;

    final seconds = myDuration.inSeconds - reduceSecondsBy;

    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
  }

  @action
  Future<void> getTimerSessions() async {
    try {
      completedSessions = await _getTimerSessionUsecase.getCompletedSessions();
      timerSessions = await _getTimerSessionUsecase.getTimerSessions();
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
    }
  }

  @action
  Future<void> saveTimerSession(TimerSession timerSession) async {
    try {
      await _saveTimerSessionUsecase.saveTimerSession(timerSession);
      await _saveTimerSessionUsecase.saveCompletedSessions(completedSessions);
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
    }
  }

  @action
  Future<void> clearTimerSessions() async {
    try {
      await _clearTimerSessionUsecase.clearTimerSessions();
      await _clearTimerSessionUsecase.clearCompletedSessions();
      completedSessions = 0;
    } catch (cause, stacktrace) {
      Logger.root.info(cause.toString(), cause, stacktrace);
    }
  }

  @action
  Future<void> dispose() async {
    countdownTimer?.cancel();
    _timerSubscription?.cancel();
  }
}
