// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
mixin _$StudentDaoMixin on DatabaseAccessor<AppDb> {
  $StudentsTable get students => attachedDatabase.students;
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _rollnoMeta = const VerificationMeta('rollno');
  @override
  late final GeneratedColumn<String> rollno = GeneratedColumn<String>(
      'rollno', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _intimeMeta = const VerificationMeta('intime');
  @override
  late final GeneratedColumn<DateTime> intime = GeneratedColumn<DateTime>(
      'intime', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, rollno, name, intime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(Insertable<Student> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('rollno')) {
      context.handle(_rollnoMeta,
          rollno.isAcceptableOrUnknown(data['rollno']!, _rollnoMeta));
    } else if (isInserting) {
      context.missing(_rollnoMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('intime')) {
      context.handle(_intimeMeta,
          intime.isAcceptableOrUnknown(data['intime']!, _intimeMeta));
    } else if (isInserting) {
      context.missing(_intimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rollno: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rollno'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      intime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}intime'])!,
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final String rollno;
  final String name;
  final DateTime intime;
  const Student(
      {required this.id,
      required this.rollno,
      required this.name,
      required this.intime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['rollno'] = Variable<String>(rollno);
    map['name'] = Variable<String>(name);
    map['intime'] = Variable<DateTime>(intime);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      rollno: Value(rollno),
      name: Value(name),
      intime: Value(intime),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      rollno: serializer.fromJson<String>(json['rollno']),
      name: serializer.fromJson<String>(json['name']),
      intime: serializer.fromJson<DateTime>(json['intime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rollno': serializer.toJson<String>(rollno),
      'name': serializer.toJson<String>(name),
      'intime': serializer.toJson<DateTime>(intime),
    };
  }

  Student copyWith({int? id, String? rollno, String? name, DateTime? intime}) =>
      Student(
        id: id ?? this.id,
        rollno: rollno ?? this.rollno,
        name: name ?? this.name,
        intime: intime ?? this.intime,
      );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      id: data.id.present ? data.id.value : this.id,
      rollno: data.rollno.present ? data.rollno.value : this.rollno,
      name: data.name.present ? data.name.value : this.name,
      intime: data.intime.present ? data.intime.value : this.intime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('rollno: $rollno, ')
          ..write('name: $name, ')
          ..write('intime: $intime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, rollno, name, intime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.rollno == this.rollno &&
          other.name == this.name &&
          other.intime == this.intime);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<String> rollno;
  final Value<String> name;
  final Value<DateTime> intime;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.rollno = const Value.absent(),
    this.name = const Value.absent(),
    this.intime = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    required String rollno,
    required String name,
    required DateTime intime,
  })  : rollno = Value(rollno),
        name = Value(name),
        intime = Value(intime);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<String>? rollno,
    Expression<String>? name,
    Expression<DateTime>? intime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rollno != null) 'rollno': rollno,
      if (name != null) 'name': name,
      if (intime != null) 'intime': intime,
    });
  }

  StudentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? rollno,
      Value<String>? name,
      Value<DateTime>? intime}) {
    return StudentsCompanion(
      id: id ?? this.id,
      rollno: rollno ?? this.rollno,
      name: name ?? this.name,
      intime: intime ?? this.intime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rollno.present) {
      map['rollno'] = Variable<String>(rollno.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (intime.present) {
      map['intime'] = Variable<DateTime>(intime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('rollno: $rollno, ')
          ..write('name: $name, ')
          ..write('intime: $intime')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final StudentDao studentDao = StudentDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [students];
}

typedef $$StudentsTableCreateCompanionBuilder = StudentsCompanion Function({
  Value<int> id,
  required String rollno,
  required String name,
  required DateTime intime,
});
typedef $$StudentsTableUpdateCompanionBuilder = StudentsCompanion Function({
  Value<int> id,
  Value<String> rollno,
  Value<String> name,
  Value<DateTime> intime,
});

class $$StudentsTableTableManager extends RootTableManager<
    _$AppDb,
    $StudentsTable,
    Student,
    $$StudentsTableFilterComposer,
    $$StudentsTableOrderingComposer,
    $$StudentsTableCreateCompanionBuilder,
    $$StudentsTableUpdateCompanionBuilder> {
  $$StudentsTableTableManager(_$AppDb db, $StudentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$StudentsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$StudentsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> rollno = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> intime = const Value.absent(),
          }) =>
              StudentsCompanion(
            id: id,
            rollno: rollno,
            name: name,
            intime: intime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String rollno,
            required String name,
            required DateTime intime,
          }) =>
              StudentsCompanion.insert(
            id: id,
            rollno: rollno,
            name: name,
            intime: intime,
          ),
        ));
}

class $$StudentsTableFilterComposer
    extends FilterComposer<_$AppDb, $StudentsTable> {
  $$StudentsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get rollno => $state.composableBuilder(
      column: $state.table.rollno,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get intime => $state.composableBuilder(
      column: $state.table.intime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$StudentsTableOrderingComposer
    extends OrderingComposer<_$AppDb, $StudentsTable> {
  $$StudentsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get rollno => $state.composableBuilder(
      column: $state.table.rollno,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get intime => $state.composableBuilder(
      column: $state.table.intime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
}
