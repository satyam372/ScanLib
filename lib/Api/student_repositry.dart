// import 'package:drift/native.dart';
// import '../model/database.dart';
// import 'package:drift/drift.dart' as drift;
//
// class LocalApi {
//   late AppDb db;
//   bool found = false;
//   void initState() {
//     db = AppDb(NativeDatabase.memory()); // Initialize db properly
//   }
//   void dispose() {
//     db.close();
//   }
//
//   // Future<void> checkEntry(String rollno) async {
//   //   final fetchedStudent = await db.studentDao.checkEntry(rollno);
//   //   if (fetchedStudent != null) { // Use null instead of Null
//   //     found = true;
//   //   }
//   //   else {
//   //     found = false;
//   //   }
//   // }
//
  // Future<void> Outgoing(String rollno) async {
  //   final fetched = await db.studentDao.checkEntry(rollno);
  //   if (fetched != null && fetched.outtime == null) {
  //     await (db.update(db.students)..where((tbl) => tbl.rollno.equals(rollno)))
  //         .write(StudentsCompanion(outtime: drift.Value(DateTime.now())));
  //     found = true;
  //   }
  //   else {
  //     found = false;
  //   }
  // }
// }