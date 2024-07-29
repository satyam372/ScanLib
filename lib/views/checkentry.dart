import 'package:flutter/material.dart';
import 'package:library_qr/model/database.dart';

class CheckEntry extends StatefulWidget {
  const CheckEntry({super.key});

  @override
  CheckEntryState createState() => CheckEntryState();
}

class CheckEntryState extends State<CheckEntry> {
  late AppDb db;
  late Future<List<Student>> outgoingStudents;
  late Future<List<Student>> presentStudents;

  @override
  void initState() {
    super.initState();
    db = AppDb.instance;
    presentStudents = db.studentDao.fetchIntTime();
    outgoingStudents = db.studentDao.fetchOutime();
  }

  @override
  void dispose() {

    super.dispose();
  }

  void _deleteAllEntries() async {
    await db.studentDao.deleteAllEntries();
    setState(() {
      presentStudents = db.studentDao.fetchIntTime();
      outgoingStudents = db.studentDao.fetchOutime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Outgoing Students'),
              Tab(text: 'Present Students'),
            ],

          ),
            title: const Text('Check Entry'),
            actions: [
        IconButton(
        icon: const Icon(Icons.delete),
        onPressed: _deleteAllEntries,
      ),
        ]
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Student>>(
              future: presentStudents,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Outgoing students'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final student = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          title: Text(student.name),
                          subtitle: Text('Roll No: ${student.rollno}\nOuttime: ${student.outtime}'),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            FutureBuilder<List<Student>>(
              future: outgoingStudents,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Present students'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final student = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          title: Text(student.name),
                          subtitle: Text('Roll No: ${student.rollno}\nintime: ${student.intime}\nouttime: ${student.outtime}'),

                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}