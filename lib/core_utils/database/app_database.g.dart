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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _completedSessionsMeta =
      const VerificationMeta('completedSessions');
  @override
  late final GeneratedColumn<int> completedSessions = GeneratedColumn<int>(
      'completed_sessions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, completedSessions];
  @override
  String get aliasedName => _alias ?? 'timer_table';
  @override
  String get actualTableName => 'timer_table';
  @override
  VerificationContext validateIntegrity(Insertable<TimerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
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
  final int id;
  final int completedSessions;
  const TimerTableData({required this.id, required this.completedSessions});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['completed_sessions'] = Variable<int>(completedSessions);
    return map;
  }

  TimerTableCompanion toCompanion(bool nullToAbsent) {
    return TimerTableCompanion(
      id: Value(id),
      completedSessions: Value(completedSessions),
    );
  }

  factory TimerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimerTableData(
      id: serializer.fromJson<int>(json['id']),
      completedSessions: serializer.fromJson<int>(json['completedSessions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completedSessions': serializer.toJson<int>(completedSessions),
    };
  }

  TimerTableData copyWith({int? id, int? completedSessions}) => TimerTableData(
        id: id ?? this.id,
        completedSessions: completedSessions ?? this.completedSessions,
      );
  @override
  String toString() {
    return (StringBuffer('TimerTableData(')
          ..write('id: $id, ')
          ..write('completedSessions: $completedSessions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, completedSessions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimerTableData &&
          other.id == this.id &&
          other.completedSessions == this.completedSessions);
}

class TimerTableCompanion extends UpdateCompanion<TimerTableData> {
  final Value<int> id;
  final Value<int> completedSessions;
  const TimerTableCompanion({
    this.id = const Value.absent(),
    this.completedSessions = const Value.absent(),
  });
  TimerTableCompanion.insert({
    this.id = const Value.absent(),
    required int completedSessions,
  }) : completedSessions = Value(completedSessions);
  static Insertable<TimerTableData> custom({
    Expression<int>? id,
    Expression<int>? completedSessions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (completedSessions != null) 'completed_sessions': completedSessions,
    });
  }

  TimerTableCompanion copyWith(
      {Value<int>? id, Value<int>? completedSessions}) {
    return TimerTableCompanion(
      id: id ?? this.id,
      completedSessions: completedSessions ?? this.completedSessions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (completedSessions.present) {
      map['completed_sessions'] = Variable<int>(completedSessions.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimerTableCompanion(')
          ..write('id: $id, ')
          ..write('completedSessions: $completedSessions')
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
