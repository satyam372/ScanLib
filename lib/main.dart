// lib/main.dart
import 'package:flutter/material.dart';
import 'package:library_qr/views/scannerview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Entry System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const ScanScreen(),
    );
  }
}

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:library_qr/model/data_fetch.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Student Info Fetcher',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const StudentFetcherScreen(),
//     );
//   }
// }
//
// class StudentFetcherScreen extends StatefulWidget {
//   const StudentFetcherScreen({super.key});
//
//   @override
//   _StudentFetcherScreenState createState() => _StudentFetcherScreenState();
// }
//
// class _StudentFetcherScreenState extends State<StudentFetcherScreen> {
//   final TextEditingController _controller = TextEditingController();
//   late FetchClient _fetchClient;
//   Post? _post;
//   String _errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     final dio = Dio();
//     _fetchClient = FetchClient(dio);
//   }
//
//   Future<void> _fetchStudentData(String rollno) async {
//     setState(() {
//       _post = null;
//       _errorMessage = '';
//     });
//
//     try {
//       final dio = Dio();
//       final response = await dio.get('http://192.168.211.224:8080/library/fetch_info.php', queryParameters: {'rollno': rollno});
//       print('Raw Response: ${response.data}');
//
//       if (response.data is String) {
//         // Parse the response string into JSON
//         final List<dynamic> jsonData = jsonDecode(response.data);
//         final List<Post> posts = jsonData.map((json) => Post.fromJson(json)).toList();
//
//         if (posts.isNotEmpty) {
//           setState(() {
//             _post = posts.first;
//           });
//         } else {
//           setState(() {
//             _errorMessage = 'No data found for the given roll number.';
//           });
//         }
//       } else {
//         setState(() {
//           _errorMessage = 'Invalid response format.';
//         });
//       }
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         _errorMessage = 'Failed to fetch data: $e';
//       });
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student Info Fetcher'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: const InputDecoration(labelText: 'Enter Roll Number'),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 if (_controller.text.isNotEmpty) {
//                   _fetchStudentData(_controller.text);
//                 }
//               },
//               child: const Text('Fetch Data'),
//             ),
//             const SizedBox(height: 16),
//             if (_errorMessage.isNotEmpty)
//               Text(
//                 _errorMessage,
//                 style: const TextStyle(color: Colors.red),
//               ),
//             if (_post != null) ...[
//               Text('Roll Number: ${_post!.rollno}'),
//               Text('Name: ${_post!.name}'),
//               Text('Department: ${_post!.department}'),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }



