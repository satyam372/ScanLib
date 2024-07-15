// lib/main.dart
import 'package:flutter/material.dart';
import 'views/scannerview.dart';

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
      home:  const Scannscreen(),
    );
  }
}







