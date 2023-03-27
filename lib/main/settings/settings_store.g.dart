// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on SettingsStoreBase, Store {
  late final _$selectedFocusDurationAtom =
      Atom(name: 'SettingsStoreBase.selectedFocusDuration', context: context);

  @override
  int get selectedFocusDuration {
    _$selectedFocusDurationAtom.reportRead();
    return super.selectedFocusDuration;
  }

  @override
  set selectedFocusDuration(int value) {
    _$selectedFocusDurationAtom.reportWrite(value, super.selectedFocusDuration,
        () {
      super.selectedFocusDuration = value;
    });
  }

  late final _$selectedBreakDurationAtom =
      Atom(name: 'SettingsStoreBase.selectedBreakDuration', context: context);

  @override
  int get selectedBreakDuration {
    _$selectedBreakDurationAtom.reportRead();
    return super.selectedBreakDuration;
  }

  @override
  set selectedBreakDuration(int value) {
    _$selectedBreakDurationAtom.reportWrite(value, super.selectedBreakDuration,
        () {
      super.selectedBreakDuration = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('SettingsStoreBase.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$updateFocusDurationAsyncAction =
      AsyncAction('SettingsStoreBase.updateFocusDuration', context: context);

  @override
  Future<void> updateFocusDuration(int focusDuration) {
    return _$updateFocusDurationAsyncAction
        .run(() => super.updateFocusDuration(focusDuration));
  }

  late final _$disposeAsyncAction =
      AsyncAction('SettingsStoreBase.dispose', context: context);

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  @override
  String toString() {
    return '''
selectedFocusDuration: ${selectedFocusDuration},
selectedBreakDuration: ${selectedBreakDuration}
    ''';
  }
}
