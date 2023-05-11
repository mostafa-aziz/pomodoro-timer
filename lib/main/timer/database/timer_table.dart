import 'package:drift/drift.dart';

class TimerTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get completedSessions => integer()();
}
