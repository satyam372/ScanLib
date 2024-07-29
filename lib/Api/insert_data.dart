


import 'package:drift/drift.dart' as drift;
import 'package:library_qr/model/database.dart';

class InsertData {
  final AppDb db = AppDb.instance;
  final String rollno;
  final String name;



  bool isInserted = false;

  InsertData({
    required this.rollno,
    required this.name,


  });



  Future<void> insert() async {
    final student = StudentsCompanion(
      rollno: drift.Value(rollno),
      name: drift.Value(name),

     // image: drift.Value(signature),
      intime: drift.Value(DateTime.now()),
      outtime: drift.Value(DateTime.now()),
    );

    await db.studentDao.insertStudent(student);
    print('Student inserted');
  }
}
