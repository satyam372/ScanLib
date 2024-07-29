


import 'package:drift/drift.dart' as drift;
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



  Future<void> insert() async {
    final student = StudentsCompanion(
      rollno: drift.Value(rollno),
      name: drift.Value(name),

     // image: drift.Value(signature),
      intime: drift.Value(DateTime.now()),
      outtime: drift.Value(DateTime.now()),
      department: drift.Value(department),

    );

    await db.studentDao.insertStudent(student);
    print('Student inserted');
  }
}
