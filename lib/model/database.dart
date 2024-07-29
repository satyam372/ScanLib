import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';



class Students extends Table {
  TextColumn get rollno => text()();
  TextColumn get name => text()();
  DateTimeColumn get intime => dateTime().nullable()();
  DateTimeColumn get outtime => dateTime().nullable()();
}

@DriftDatabase(tables: [Students], daos: [StudentDao])
class AppDb extends _$AppDb {
  AppDb._internal() : super(_openConnection());

  static final AppDb instance = AppDb._internal();

  @override
  int get schemaVersion => 2;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from == 1) {
        await m.addColumn(students, students.outtime);
      }
    },
  );
}

@DriftAccessor(tables: [Students])
class StudentDao extends DatabaseAccessor<AppDb> with _$StudentDaoMixin {
  final AppDb db;

  StudentDao(this.db) : super(db);

  Future<int> insertStudent(StudentsCompanion student) => into(students).insert(student);

  Future<Student?> checkEntry(String rollNo) async {
    final student = await (select(students)..where((tbl) => tbl.rollno.equals(rollNo))).getSingleOrNull();

    if (student != null) {
      if (student.outtime == null) {
        await (update(students)..where((tbl) => tbl.rollno.equals(rollNo)))
            .write(StudentsCompanion(outtime: Value(DateTime.now())));
      }
    }

    return student;
  }

  Future<List<Student>> fetchOutime() async {
    return (select(students)..where((tbl) => tbl.outtime.isNotNull())).get();
  }

  Future<List<Student>> fetchIntTime() async {
    return (select(students)..where((tbl) => tbl.intime.isNotNull())).get();
  }

  Future<int> deleteAllEntries() {
    return delete(students).go();
  }
}
