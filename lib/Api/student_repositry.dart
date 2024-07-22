import 'package:drift/native.dart';
import '../model/database.dart';

class LocalApi {
  late AppDb db;
  bool found = false;
  void initState() {
    db = AppDb(NativeDatabase.memory()); // Initialize db properly
  }
  void dispose() {
    db.close();
  }
  Future<void> checkEntry(String rollno) async {
    final fetchedStudent = await db.studentDao.checkEntry(rollno);
    if (fetchedStudent != null) { // Use null instead of Null
      found = true;
    }
    else {
      found = false;
    }
  }
}