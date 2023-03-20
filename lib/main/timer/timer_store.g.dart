// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimerStore on TimerStoreBase, Store {
  late final _$countdownTimerAtom =
      Atom(name: 'TimerStoreBase.countdownTimer', context: context);

  @override
  Timer? get countdownTimer {
    _$countdownTimerAtom.reportRead();
    return super.countdownTimer;
  }

  @override
  set countdownTimer(Timer? value) {
    _$countdownTimerAtom.reportWrite(value, super.countdownTimer, () {
      super.countdownTimer = value;
    });
  }

  late final _$myDurationAtom =
      Atom(name: 'TimerStoreBase.myDuration', context: context);

  @override
  Duration get myDuration {
    _$myDurationAtom.reportRead();
    return super.myDuration;
  }

  @override
  set myDuration(Duration value) {
    _$myDurationAtom.reportWrite(value, super.myDuration, () {
      super.myDuration = value;
    });
  }

  late final _$shouldStartTimerAtom =
      Atom(name: 'TimerStoreBase.shouldStartTimer', context: context);

  @override
  bool get shouldStartTimer {
    _$shouldStartTimerAtom.reportRead();
    return super.shouldStartTimer;
  }

  @override
  set shouldStartTimer(bool value) {
    _$shouldStartTimerAtom.reportWrite(value, super.shouldStartTimer, () {
      super.shouldStartTimer = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('TimerStoreBase.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$disposeAsyncAction =
      AsyncAction('TimerStoreBase.dispose', context: context);

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$TimerStoreBaseActionController =
      ActionController(name: 'TimerStoreBase', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$TimerStoreBaseActionController.startAction(
        name: 'TimerStoreBase.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$TimerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$TimerStoreBaseActionController.startAction(
        name: 'TimerStoreBase.stopTimer');
    try {
      return super.stopTimer();
    } finally {
      _$TimerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTimer() {
    final _$actionInfo = _$TimerStoreBaseActionController.startAction(
        name: 'TimerStoreBase.resetTimer');
    try {
      return super.resetTimer();
    } finally {
      _$TimerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
countdownTimer: ${countdownTimer},
myDuration: ${myDuration},
shouldStartTimer: ${shouldStartTimer}
    ''';
  }
}