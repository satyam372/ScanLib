import 'dart:convert';
import 'package:dio/dio.dart';

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
  Future<Student?> fetchStudentData(String rollno) async {
    try {
      final dio = Dio();
      final response = await dio.get(
        'http://192.168.211.224:8080/library/fetch_info.php',
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
}
