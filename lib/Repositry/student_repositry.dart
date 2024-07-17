import 'package:drift/native.dart';
import '../model/database.dart';

class LocalApi {
  late AppDb db;
  // ignore: non_constant_identifier_names
  bool Found = false;
  void initState() {
    db = AppDb(NativeDatabase.memory()); // Initialize db properly
  }
  void dispose() {
    db.close();
  }
  Future<void> checkEntry(String rollno) async {
    final fetchedStudent = await db.studentDao.checkEntry(rollno);
    if (fetchedStudent != null) { // Use null instead of Null
      Found = true;
    }
    else {
      Found = false;
    }
  }
}