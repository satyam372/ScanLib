import 'package:flutter/material.dart';


class StudentView extends StatefulWidget {
  final String rollno;
  final String name;
  final String department;

  const StudentView({
    required this.rollno,
    required this.name,
    required this.department,

});

  @override
  _StudentViewState createState() => _StudentViewState();

}

class _StudentViewState extends State<StudentView> {
  late TextEditingController _field1Controller;
  late TextEditingController _field2Controller;
  late TextEditingController _field3Controller;



  @override
  void initState() {
    super.initState();
    _field1Controller = TextEditingController(text: widget.rollno);
    _field2Controller = TextEditingController(text: widget.name);
    _field3Controller = TextEditingController(text: widget.department);
  }

  @override
  void dispose() {
    _field1Controller.dispose();
    _field2Controller.dispose();
    _field3Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _field1Controller,
              decoration: const InputDecoration(labelText: 'Rollno'),
            ),
            TextField(
              controller: _field2Controller,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _field3Controller,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _field3Controller,
              decoration: const InputDecoration(labelText: 'Name'),
            )
          ],
        )
      ),
    );

  }
}
