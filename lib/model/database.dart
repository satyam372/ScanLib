import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'database.g.dart';

// Define the Students table
class Students extends Table {
 // IntColumn get id => integer().autoIncrement()();
  TextColumn get rollno => text()();
  TextColumn get name => text()();
  DateTimeColumn get intime => dateTime()();
  DateTimeColumn get outtime => dateTime().nullable()();
  // Correct the capitalization to match your code
}



@DriftAccessor(tables: [Students])
class StudentDao extends DatabaseAccessor<AppDb> with _$StudentDaoMixin{
     final AppDb db;
     StudentDao(this.db) : super(db);

     Future<int> insertstudent(StudentsCompanion student) => into(students).insert(student);

     Future<Student?> checkEntry(String rollNo) async {
       return (select(students)..where((tbl) => tbl.rollno.equals(rollNo))).getSingleOrNull();
     }

     Future<List<Student>> fetchIntime() async {
       return (select(students)..where((tbl) => tbl.intime.isNull())).get();
     }

     Future<List<Student>> fetchOutTime() async {
       return (select(students)..where((tbl) => tbl.intime.isNotNull())).get();
     }

     Future<int> deleteAllEntries() {
       return delete(students).go();
     }

}
// Define the Drift database
@DriftDatabase(tables: [Students] ,daos: [StudentDao])
class AppDb extends _$AppDb {
  AppDb(NativeDatabase nativeDatabase) : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// Function to open the database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
