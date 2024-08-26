import 'package:flutter/material.dart';
import '../services/local_database_service.dart';
import '../views/scannerview.dart';
import 'package:library_qr/views/student_detail_view.dart';
// ignore: depend_on_referenced_packages

class Api {
  late final StudentViewState _studentViewState;
  late InsertData _insertData;

  Api(this._studentViewState) {
    _insertData = InsertData(
      rollno: _studentViewState.field1Controller.text,
      name: _studentViewState.field2Controller.text,
      department: _studentViewState.field3Controller.text,
    );
  }

  Future<void> handleRegistration(BuildContext context) async {
    final insert = await _insertData.insert();
    _studentViewState.signaturePadKey.currentState!.clear();

    if (insert == true) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registered Successfully')),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('error')),
        );
      }
    }
    if (context.mounted) {
      // TODO:check for mounted
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ScanScreen(),
      ));
    }
  }
}