import 'dart:convert';
import 'package:dio/dio.dart';
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


final db = AppDb.instance;
Future<Student?> fetchStudentData(String rollno) async {
  try {
    final dio = Dio();
    final response = await dio.get(
      'http://192.168.2.224:8080/library/fetch_info.php',
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

Future<bool> sendDataToServer() async {

  Dio dio = Dio();
  final entries = await db.archiveStudentDao.fetchEntries();
  try {
    for (var entry in entries) {
         await dio.post(
        'http://172.27.28.77:8080/library/insert_data.php',
           data: {
             'rollno': entry['rollno'],
             'name': entry['name'],
             'intime': entry['intime'],
             'outtime': entry['outtime'],
             'department': entry['department'],
           },
           options: Options(
             contentType: Headers.formUrlEncodedContentType,
      ));
    }
    return true;
  } catch (e) {
    return false;
  }
}