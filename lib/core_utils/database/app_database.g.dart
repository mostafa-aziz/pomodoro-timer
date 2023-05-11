// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TimerTableTable extends TimerTable
    with TableInfo<$TimerTableTable, TimerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      '_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionNameMeta =
      const VerificationMeta('sessionName');
  @override
  late final GeneratedColumn<String> sessionName = GeneratedColumn<String>(
      'sessionName', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionDateMeta =
      const VerificationMeta('sessionDate');
  @override
  late final GeneratedColumn<DateTime> sessionDate = GeneratedColumn<DateTime>(
      'session_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedSessionsMeta =
      const VerificationMeta('completedSessions');
  @override
  late final GeneratedColumn<int> completedSessions = GeneratedColumn<int>(
      'completed_sessions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sessionName, sessionDate, completedSessions];
  @override
  String get aliasedName => _alias ?? 'timer';
  @override
  String get actualTableName => 'timer';
  @override
  VerificationContext validateIntegrity(Insertable<TimerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sessionName')) {
      context.handle(
          _sessionNameMeta,
          sessionName.isAcceptableOrUnknown(
              data['sessionName']!, _sessionNameMeta));
    } else if (isInserting) {
      context.missing(_sessionNameMeta);
    }
    if (data.containsKey('session_date')) {
      context.handle(
          _sessionDateMeta,
          sessionDate.isAcceptableOrUnknown(
              data['session_date']!, _sessionDateMeta));
    }
    if (data.containsKey('completed_sessions')) {
      context.handle(
          _completedSessionsMeta,
          completedSessions.isAcceptableOrUnknown(
              data['completed_sessions']!, _completedSessionsMeta));
    } else if (isInserting) {
      context.missing(_completedSessionsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimerTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}_id'])!,
      sessionName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sessionName'])!,
      sessionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}session_date']),
      completedSessions: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}completed_sessions'])!,
    );
  }

  @override
  $TimerTableTable createAlias(String alias) {
    return $TimerTableTable(attachedDatabase, alias);
  }
}

class TimerTableData extends DataClass implements Insertable<TimerTableData> {
  final String id;
  final String sessionName;
  final DateTime? sessionDate;
  final int completedSessions;
  const TimerTableData(
      {required this.id,
      required this.sessionName,
      this.sessionDate,
      required this.completedSessions});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['_id'] = Variable<String>(id);
    map['sessionName'] = Variable<String>(sessionName);
    if (!nullToAbsent || sessionDate != null) {
      map['session_date'] = Variable<DateTime>(sessionDate);
    }
    map['completed_sessions'] = Variable<int>(completedSessions);
    return map;
  }

  TimerTableCompanion toCompanion(bool nullToAbsent) {
    return TimerTableCompanion(
      id: Value(id),
      sessionName: Value(sessionName),
      sessionDate: sessionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionDate),
      completedSessions: Value(completedSessions),
    );
  }

  factory TimerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimerTableData(
      id: serializer.fromJson<String>(json['id']),
      sessionName: serializer.fromJson<String>(json['sessionName']),
      sessionDate: serializer.fromJson<DateTime?>(json['sessionDate']),
      completedSessions: serializer.fromJson<int>(json['completedSessions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionName': serializer.toJson<String>(sessionName),
      'sessionDate': serializer.toJson<DateTime?>(sessionDate),
      'completedSessions': serializer.toJson<int>(completedSessions),
    };
  }

  TimerTableData copyWith(
          {String? id,
          String? sessionName,
          Value<DateTime?> sessionDate = const Value.absent(),
          int? completedSessions}) =>
      TimerTableData(
        id: id ?? this.id,
        sessionName: sessionName ?? this.sessionName,
        sessionDate: sessionDate.present ? sessionDate.value : this.sessionDate,
        completedSessions: completedSessions ?? this.completedSessions,
      );
  @override
  String toString() {
    return (StringBuffer('TimerTableData(')
          ..write('id: $id, ')
          ..write('sessionName: $sessionName, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('completedSessions: $completedSessions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sessionName, sessionDate, completedSessions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimerTableData &&
          other.id == this.id &&
          other.sessionName == this.sessionName &&
          other.sessionDate == this.sessionDate &&
          other.completedSessions == this.completedSessions);
}

class TimerTableCompanion extends UpdateCompanion<TimerTableData> {
  final Value<String> id;
  final Value<String> sessionName;
  final Value<DateTime?> sessionDate;
  final Value<int> completedSessions;
  final Value<int> rowid;
  const TimerTableCompanion({
    this.id = const Value.absent(),
    this.sessionName = const Value.absent(),
    this.sessionDate = const Value.absent(),
    this.completedSessions = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimerTableCompanion.insert({
    required String id,
    required String sessionName,
    this.sessionDate = const Value.absent(),
    required int completedSessions,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sessionName = Value(sessionName),
        completedSessions = Value(completedSessions);
  static Insertable<TimerTableData> custom({
    Expression<String>? id,
    Expression<String>? sessionName,
    Expression<DateTime>? sessionDate,
    Expression<int>? completedSessions,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (sessionName != null) 'sessionName': sessionName,
      if (sessionDate != null) 'session_date': sessionDate,
      if (completedSessions != null) 'completed_sessions': completedSessions,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimerTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? sessionName,
      Value<DateTime?>? sessionDate,
      Value<int>? completedSessions,
      Value<int>? rowid}) {
    return TimerTableCompanion(
      id: id ?? this.id,
      sessionName: sessionName ?? this.sessionName,
      sessionDate: sessionDate ?? this.sessionDate,
      completedSessions: completedSessions ?? this.completedSessions,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (sessionName.present) {
      map['sessionName'] = Variable<String>(sessionName.value);
    }
    if (sessionDate.present) {
      map['session_date'] = Variable<DateTime>(sessionDate.value);
    }
    if (completedSessions.present) {
      map['completed_sessions'] = Variable<int>(completedSessions.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimerTableCompanion(')
          ..write('id: $id, ')
          ..write('sessionName: $sessionName, ')
          ..write('sessionDate: $sessionDate, ')
          ..write('completedSessions: $completedSessions, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TimerTableTable timerTable = $TimerTableTable(this);
  late final TimerDao timerDao = TimerDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [timerTable];
}
