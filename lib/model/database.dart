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
  TextColumn get department => text()();
  BlobColumn get signature => blob().nullable()();
}

class ArchiveStudents extends Table { // Changed to ArchiveStudents
  TextColumn get rollno => text()();
  TextColumn get name => text()();
  DateTimeColumn get intime => dateTime().nullable()();
  DateTimeColumn get outtime => dateTime().nullable()();
  TextColumn get department => text()();
}

@DriftDatabase(tables: [Students, ArchiveStudents], daos: [StudentDao, ArchiveStudentDao]) // Included both tables
class AppDb extends _$AppDb {
  AppDb._internal() : super(_openConnection());

  static final AppDb instance = AppDb._internal();

  @override
  int get schemaVersion => 3; // Updated to version 3

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
        await m.addColumn(students, students.department);
      }
      if (from < 3) { // Ensure consistency in adding new columns
        await m.createTable(archiveStudents);
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

  Future<List<Student>> fetchOutTime() async {
    return (select(students)..where((tbl) => tbl.intime.isNotNull())).get();
  }

  Future<List<Student>> fetchInTime() async {
    return (select(students)..where((tbl) => tbl.intime.isNotNull())).get();
  }

  Future<int> deleteAllEntries() {
    return delete(students).go();
  }

  Future<int> deleteRollno(String roll) {
    return (delete(students)..where((tbl) => tbl.rollno.equals(roll))).go();
  }
}

@DriftAccessor(tables: [ArchiveStudents]) // Correct reference to ArchiveStudents
class ArchiveStudentDao extends DatabaseAccessor<AppDb> with _$ArchiveStudentDaoMixin { // Correct mixin usage
  final AppDb db;
  ArchiveStudentDao(this.db) : super(db);

  Future<int> insertArchiveStudent(ArchiveStudentsCompanion studentArchive) => into(archiveStudents).insert(studentArchive);

  Future<List<ArchiveStudent>> fetchStudents() async {
      return (select(archiveStudents)).get();
  }

  Future<int> deleteall() {
    return delete(archiveStudents).go();
  }
}