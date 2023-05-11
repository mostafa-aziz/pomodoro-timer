import 'package:drift/drift.dart';
import 'package:pomodoro_timer/core_utils/database/app_database.dart';
import 'package:pomodoro_timer/main/timer/database/timer_table.dart';
import 'package:pomodoro_timer/main/timer/domain/timer_session.dart';

part 'timer_dao.g.dart';

@DriftAccessor(tables: [TimerTable])
class TimerDao extends DatabaseAccessor<AppDatabase> with _$TimerDaoMixin {
  final AppDatabase database;

  TimerDao(this.database) : super(database);

  Stream<List<TimerSession>> watchTimerSessions() => select(timerTable)
      .watch() //
      .map((timerSession) => timerSession.map((timerSession) => timerSession.toDomain()).toList());

  Future<List<TimerSession>> fetchTimerSessions() async =>
      (await select(timerTable).get()).map((timerSession) => timerSession.toDomain()).toList();

  Future<void> insertTimerSession(TimerSession timerSession) async {
    await transaction(() async {
      final option = TimerTableData(
        id: timerSession.id,
        sessionName: timerSession.sessionName,
        sessionDate: timerSession.sessionDate,
        completedSessions: timerSession.completedSessions,
      );
      await into(timerTable).insertOnConflictUpdate(option);
    });
  }
}

extension Factory on TimerTableData {
  TimerSession toDomain() => TimerSession(
        id: id,
        sessionName: sessionName,
        sessionDate: DateTime.now(),
        completedSessions: completedSessions,
      );
}
