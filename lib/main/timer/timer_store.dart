import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pomodoro_timer/core_utils/preferences/app_preferences.dart';

part 'timer_store.g.dart';

class TimerStore = TimerStoreBase with _$TimerStore;

abstract class TimerStoreBase with Store {
  final AppPreferences _preferences;

  @observable
  Timer? countdownTimer;

  @observable
  Duration myDuration = const Duration(minutes: 25);

  @observable
  bool shouldStartTimer = false;

  TimerStoreBase({
    required AppPreferences preferences,
  }) : _preferences = preferences;

  @action
  Future<void> load() async {}

  @action
  void startTimer() {
    shouldStartTimer = true;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => _setCountDown());
  }

  @action
  void stopTimer() {
    countdownTimer!.cancel();
    shouldStartTimer = false;
  }

  @action
  void resetTimer() {
    stopTimer();
    myDuration = const Duration(minutes: 25);
  }

  void _setCountDown() {
    final reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;

    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
  }

  @action
  Future<void> dispose() async {
    countdownTimer?.cancel();
  }
}
