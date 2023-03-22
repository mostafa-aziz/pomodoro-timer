// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on BaseStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'BaseStoreBase.isLoading'))
          .value;
  Computed<dynamic>? _$errorComputed;

  @override
  dynamic get error => (_$errorComputed ??=
          Computed<dynamic>(() => super.error, name: 'BaseStoreBase.error'))
      .value;

  late final _$_isLoadingAtom =
      Atom(name: 'BaseStoreBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_errorAtom =
      Atom(name: 'BaseStoreBase._error', context: context);

  @override
  dynamic get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(dynamic value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$markErrorHandledAsyncAction =
      AsyncAction('BaseStoreBase.markErrorHandled', context: context);

  @override
  Future<void> markErrorHandled() {
    return _$markErrorHandledAsyncAction.run(() => super.markErrorHandled());
  }

  late final _$loadAsyncAction =
      AsyncAction('BaseStoreBase.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$disposeAsyncAction =
      AsyncAction('BaseStoreBase.dispose', context: context);

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
