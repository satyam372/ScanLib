import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:library_qr/model/database.dart';

class Student {
  final String rollno;
  final String name;
  final String department;


  Student({required this.rollno, required this.name, required this.department});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      rollno: json['rollno'],
      name: json['name'],
      department: json['department'],
    );
  }
}

class FetchStudent {
  final db = AppDb.instance;

  Future<Student?> fetchStudentData(String rollno) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'http://192.168.126.224:8080/library/fetch_info.php',
        queryParameters: {'rollno': rollno},
      );

      if (response.data is String) {
        final List<dynamic> jsonData = jsonDecode(response.data);
        if (jsonData.isNotEmpty) {
          return Student.fromJson(jsonData[0]);
        }
      }
    } catch (e) {
    }
    return null;
  }

  //
  // Future<void> updateOuttime(String rollNo) async {
  //   await (db.update(db.students)..where((tbl) => tbl.rollno.equals(rollNo)))
  //       .write(StudentsCompanion(outtime: Value(DateTime.now())));
  // }
  //
  //




}
