import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:pomodoro_timer/main/timer/database/timer_dao.dart';
import 'package:pomodoro_timer/main/timer/database/timer_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TimerTable], daos: [TimerDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(LazyDatabase openConnection) : super(openConnection);

  // For å sikre at kun en instanse av appdatabasen er tilgjengelig så lager vi en singleton
  static AppDatabase? _instance;

  static AppDatabase get instance => _instance ??= AppDatabase(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(path.join(dbFolder.path, 'pomodoro_db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
