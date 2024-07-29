import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_qr/model/database.dart';

void main() {
  late AppDb db;

  setUp(() {
    db = AppDb.instance; // Use an in-memory database for testing
  });

  tearDown(() async {
    await db.close();
  });

  test('Insert student data', () async {
    // TODO: Complete this Tests
    // ignore: unused_local_variable
    final student = StudentsCompanion(
      rollno: const Value('MITU21BTCS0550'),
      name: const Value('Satyam Pokharna'),
      intime: Value(DateTime.now()),
    );
  });
}
