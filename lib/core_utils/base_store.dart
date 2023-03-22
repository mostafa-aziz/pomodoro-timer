import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

class BaseStore = BaseStoreBase with _$BaseStore;

abstract class BaseStoreBase with Store {
  @observable
  bool _isLoading = false;

  @protected
  set isLoading(bool value) => _isLoading = value;

  @computed
  bool get isLoading => _isLoading;

  @observable
  dynamic _error;

  @protected
  set error(dynamic value) => _error = value;

  @action
  Future<void> markErrorHandled() async => _error = null;

  @computed
  dynamic get error => _error;

  @action
  Future<void> load() async {}

  @action
  Future<void> dispose() async {}
}
