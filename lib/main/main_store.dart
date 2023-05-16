import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pomodoro_timer/core_utils/base_store.dart';

part 'main_store.g.dart';

class MainStore = MainStoreBase with _$MainStore;

abstract class MainStoreBase extends BaseStore with Store {
  MainStoreBase();

  @override
  @action
  Future<void> load() async {}

  @override
  @action
  Future<void> dispose() async {}
}
