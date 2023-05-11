import 'package:drift/drift.dart';

class TimerTable extends Table {
  TextColumn get id => text().named('_id')(); //

  TextColumn get sessionName => text().named('sessionName')();

  DateTimeColumn get sessionDate => dateTime().nullable()(); //

  IntColumn get completedSessions => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String? get tableName => 'timer';
}
