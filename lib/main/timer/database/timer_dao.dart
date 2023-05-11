import 'package:drift/drift.dart';
import 'package:pomodoro_timer/core_utils/database/app_database.dart';
import 'package:pomodoro_timer/main/timer/database/timer_table.dart';

part 'timer_dao.g.dart';

@DriftAccessor(tables: [TimerTable])
class TimerDao extends DatabaseAccessor<AppDatabase> with _$TimerDaoMixin {
  TimerDao(AppDatabase database) : super(database);
}
