import 'package:drift/drift.dart' as drift;
import 'package:drift/drift.dart';
import 'package:library_qr/model/database.dart';

class InsertData {
  final AppDb db = AppDb.instance;
  final String rollno;
  final String name;
  final String department;
  bool isInserted = false;

  InsertData({
    required this.rollno,
    required this.name,
    required this.department,
  });

  Future<bool> insert() async {
    try {
      final student = StudentsCompanion(
        rollno: drift.Value(rollno),
        name: drift.Value(name),
        intime: drift.Value(DateTime.now()),
        department: drift.Value(department),
      );
      await db.studentDao.insertStudent(student);
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> updateOuttime(String rollNo) async {
    final student3 = await (db.select(db.students)
      ..where((tbl) => tbl.rollno.equals(rollNo))).getSingleOrNull();
    if (student3 != null) {
      if (student3.outtime == null) {
        await (db.update(db.students)
          ..where((tbl) => tbl.rollno.equals(rollNo)))
            .write(StudentsCompanion(outtime: Value(DateTime.now())));

        final studentInsertIntoArchive = ArchiveStudentsCompanion(
          rollno: drift.Value(student3.rollno),
          name: drift.Value(student3.name),
          intime: drift.Value(student3.intime),
          outtime: drift.Value(DateTime.now()),
          department: drift.Value(student3.department),
        );
        await db.archiveStudentDao.insertArchiveStudent(studentInsertIntoArchive);
        await db.studentDao.deleteRollno(rollNo);
        return true; // triggers the snackbar('outtime updates)
      }
    }
    return false;
  }

  Future<bool> fetchFromArchiveStudent(String rollNo) async {
    // Query the database and sort by `intime` in descending order, limit to 1 result
    final student = await (db.select(db.archiveStudents)
      ..where((tbl) => tbl.rollno.equals(rollNo))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.intime)])
      ..limit(1)).getSingleOrNull();

    if (student != null) {
      final insert = InsertData(
        rollno: student.rollno,
        name: student.name,
        department: student.department,
      );
      final isInserted = await insert.insert();
      return isInserted; // Return true if inserted successfully
    }
    return false; // Return false if student is not found
  }
}