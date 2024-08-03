// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
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
      'intime', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _outtimeMeta =
      const VerificationMeta('outtime');
  @override
  late final GeneratedColumn<DateTime> outtime = GeneratedColumn<DateTime>(
      'outtime', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _departmentMeta =
      const VerificationMeta('department');
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
      'department', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _signatureMeta =
      const VerificationMeta('signature');
  @override
  late final GeneratedColumn<Uint8List> signature = GeneratedColumn<Uint8List>(
      'signature', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [rollno, name, intime, outtime, department, signature];
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
    }
    if (data.containsKey('outtime')) {
      context.handle(_outtimeMeta,
          outtime.isAcceptableOrUnknown(data['outtime']!, _outtimeMeta));
    }
    if (data.containsKey('department')) {
      context.handle(
          _departmentMeta,
          department.isAcceptableOrUnknown(
              data['department']!, _departmentMeta));
    } else if (isInserting) {
      context.missing(_departmentMeta);
    }
    if (data.containsKey('signature')) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      rollno: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rollno'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      intime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}intime']),
      outtime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}outtime']),
      department: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}department'])!,
      signature: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}signature']),
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final String rollno;
  final String name;
  final DateTime? intime;
  final DateTime? outtime;
  final String department;
  final Uint8List? signature;
  const Student(
      {required this.rollno,
      required this.name,
      this.intime,
      this.outtime,
      required this.department,
      this.signature});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rollno'] = Variable<String>(rollno);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || intime != null) {
      map['intime'] = Variable<DateTime>(intime);
    }
    if (!nullToAbsent || outtime != null) {
      map['outtime'] = Variable<DateTime>(outtime);
    }
    map['department'] = Variable<String>(department);
    if (!nullToAbsent || signature != null) {
      map['signature'] = Variable<Uint8List>(signature);
    }
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      rollno: Value(rollno),
      name: Value(name),
      intime:
          intime == null && nullToAbsent ? const Value.absent() : Value(intime),
      outtime: outtime == null && nullToAbsent
          ? const Value.absent()
          : Value(outtime),
      department: Value(department),
      signature: signature == null && nullToAbsent
          ? const Value.absent()
          : Value(signature),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      rollno: serializer.fromJson<String>(json['rollno']),
      name: serializer.fromJson<String>(json['name']),
      intime: serializer.fromJson<DateTime?>(json['intime']),
      outtime: serializer.fromJson<DateTime?>(json['outtime']),
      department: serializer.fromJson<String>(json['department']),
      signature: serializer.fromJson<Uint8List?>(json['signature']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rollno': serializer.toJson<String>(rollno),
      'name': serializer.toJson<String>(name),
      'intime': serializer.toJson<DateTime?>(intime),
      'outtime': serializer.toJson<DateTime?>(outtime),
      'department': serializer.toJson<String>(department),
      'signature': serializer.toJson<Uint8List?>(signature),
    };
  }

  Student copyWith(
          {String? rollno,
          String? name,
          Value<DateTime?> intime = const Value.absent(),
          Value<DateTime?> outtime = const Value.absent(),
          String? department,
          Value<Uint8List?> signature = const Value.absent()}) =>
      Student(
        rollno: rollno ?? this.rollno,
        name: name ?? this.name,
        intime: intime.present ? intime.value : this.intime,
        outtime: outtime.present ? outtime.value : this.outtime,
        department: department ?? this.department,
        signature: signature.present ? signature.value : this.signature,
      );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      rollno: data.rollno.present ? data.rollno.value : this.rollno,
      name: data.name.present ? data.name.value : this.name,
      intime: data.intime.present ? data.intime.value : this.intime,
      outtime: data.outtime.present ? data.outtime.value : this.outtime,
      department:
          data.department.present ? data.department.value : this.department,
      signature: data.signature.present ? data.signature.value : this.signature,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('rollno: $rollno, ')
          ..write('name: $name, ')
          ..write('intime: $intime, ')
          ..write('outtime: $outtime, ')
          ..write('department: $department, ')
          ..write('signature: $signature')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(rollno, name, intime, outtime, department,
      $driftBlobEquality.hash(signature));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.rollno == this.rollno &&
          other.name == this.name &&
          other.intime == this.intime &&
          other.outtime == this.outtime &&
          other.department == this.department &&
          $driftBlobEquality.equals(other.signature, this.signature));
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<String> rollno;
  final Value<String> name;
  final Value<DateTime?> intime;
  final Value<DateTime?> outtime;
  final Value<String> department;
  final Value<Uint8List?> signature;
  final Value<int> rowid;
  const StudentsCompanion({
    this.rollno = const Value.absent(),
    this.name = const Value.absent(),
    this.intime = const Value.absent(),
    this.outtime = const Value.absent(),
    this.department = const Value.absent(),
    this.signature = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentsCompanion.insert({
    required String rollno,
    required String name,
    this.intime = const Value.absent(),
    this.outtime = const Value.absent(),
    required String department,
    this.signature = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : rollno = Value(rollno),
        name = Value(name),
        department = Value(department);
  static Insertable<Student> custom({
    Expression<String>? rollno,
    Expression<String>? name,
    Expression<DateTime>? intime,
    Expression<DateTime>? outtime,
    Expression<String>? department,
    Expression<Uint8List>? signature,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (rollno != null) 'rollno': rollno,
      if (name != null) 'name': name,
      if (intime != null) 'intime': intime,
      if (outtime != null) 'outtime': outtime,
      if (department != null) 'department': department,
      if (signature != null) 'signature': signature,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentsCompanion copyWith(
      {Value<String>? rollno,
      Value<String>? name,
      Value<DateTime?>? intime,
      Value<DateTime?>? outtime,
      Value<String>? department,
      Value<Uint8List?>? signature,
      Value<int>? rowid}) {
    return StudentsCompanion(
      rollno: rollno ?? this.rollno,
      name: name ?? this.name,
      intime: intime ?? this.intime,
      outtime: outtime ?? this.outtime,
      department: department ?? this.department,
      signature: signature ?? this.signature,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rollno.present) {
      map['rollno'] = Variable<String>(rollno.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (intime.present) {
      map['intime'] = Variable<DateTime>(intime.value);
    }
    if (outtime.present) {
      map['outtime'] = Variable<DateTime>(outtime.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (signature.present) {
      map['signature'] = Variable<Uint8List>(signature.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('rollno: $rollno, ')
          ..write('name: $name, ')
          ..write('intime: $intime, ')
          ..write('outtime: $outtime, ')
          ..write('department: $department, ')
          ..write('signature: $signature, ')
          ..write('rowid: $rowid')
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
  required String rollno,
  required String name,
  Value<DateTime?> intime,
  Value<DateTime?> outtime,
  required String department,
  Value<Uint8List?> signature,
  Value<int> rowid,
});
typedef $$StudentsTableUpdateCompanionBuilder = StudentsCompanion Function({
  Value<String> rollno,
  Value<String> name,
  Value<DateTime?> intime,
  Value<DateTime?> outtime,
  Value<String> department,
  Value<Uint8List?> signature,
  Value<int> rowid,
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
            Value<String> rollno = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime?> intime = const Value.absent(),
            Value<DateTime?> outtime = const Value.absent(),
            Value<String> department = const Value.absent(),
            Value<Uint8List?> signature = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudentsCompanion(
            rollno: rollno,
            name: name,
            intime: intime,
            outtime: outtime,
            department: department,
            signature: signature,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String rollno,
            required String name,
            Value<DateTime?> intime = const Value.absent(),
            Value<DateTime?> outtime = const Value.absent(),
            required String department,
            Value<Uint8List?> signature = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudentsCompanion.insert(
            rollno: rollno,
            name: name,
            intime: intime,
            outtime: outtime,
            department: department,
            signature: signature,
            rowid: rowid,
          ),
        ));
}

class $$StudentsTableFilterComposer
    extends FilterComposer<_$AppDb, $StudentsTable> {
  $$StudentsTableFilterComposer(super.$state);
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

  ColumnFilters<DateTime> get outtime => $state.composableBuilder(
      column: $state.table.outtime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get department => $state.composableBuilder(
      column: $state.table.department,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<Uint8List> get signature => $state.composableBuilder(
      column: $state.table.signature,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$StudentsTableOrderingComposer
    extends OrderingComposer<_$AppDb, $StudentsTable> {
  $$StudentsTableOrderingComposer(super.$state);
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

  ColumnOrderings<DateTime> get outtime => $state.composableBuilder(
      column: $state.table.outtime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get department => $state.composableBuilder(
      column: $state.table.department,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<Uint8List> get signature => $state.composableBuilder(
      column: $state.table.signature,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
}

mixin _$StudentDaoMixin on DatabaseAccessor<AppDb> {
  $StudentsTable get students => attachedDatabase.students;
}
