
import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:library_qr/model/database.dart';

class InsertData {
  late AppDb db;
  final String rollno;
  final String name;
  bool found = false;


  bool isInserted = false;

  InsertData({
    required this.rollno,
    required this.name,

  }) {
    db = AppDb(NativeDatabase.memory());
  }

  void dispose() {
    db.close();
  }

  Future<void> insert() async {
    final existingStudent = await db.studentDao.checkEntry(rollno);

    if (existingStudent == null) {
      // Insert new student with intime
      final student = StudentsCompanion(
        rollno: drift.Value(rollno),
        name: drift.Value(name),
        intime: drift.Value(DateTime.now()),
        outtime: const drift.Value.absent(),
      );

      await db.studentDao.insertstudent(student);
    }
 // else {
 //        await (db.update(db.students)
 //          ..where((tbl) => tbl.rollno.equals(rollno)))
 //            .write(StudentsCompanion(outtime: drift.Value(DateTime.now())));
 //        print('Both intime and outtime are already filled.');
 //      }

  }

Future<void> outgoing(String rollno) async {
  final fetched = await db.studentDao.checkEntry(rollno);
  if (fetched != null && fetched.outtime == null) {
    await (db.update(db.students)..where((tbl) => tbl.rollno.equals(rollno)))
        .write(StudentsCompanion(outtime: drift.Value(DateTime.now())));
    found = true;
  }
  else {
    found = false;
  }
}
}


