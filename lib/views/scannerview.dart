import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:library_qr/views/checkentry.dart';
import 'package:library_qr/views/student_detail_view.dart';
import 'package:library_qr/Api/server_info_fetch.dart';
import 'package:library_qr/model/database.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});
  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  String _scanResult = 'Scan a barcode';
  //late LocalApi _localApi;
 // late AppDb _appDb;

  @override
  void initState() {
    super.initState();
    AppDb db;
    //_localApi = LocalApi();
   // _appDb = AppDb(NativeDatabase.memory());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _startBarcodeScan() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      if (barcodeScanRes != '-1') {
        setState(() {
          _scanResult = barcodeScanRes;
        });


        // Use `mounted` check to ensure `context` is still valid

          final FetchStudent fetchStudent = FetchStudent();
          final student = await fetchStudent.fetchStudentData(barcodeScanRes);
        if (mounted) {

          if (student != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    StudentView(
                      rollno: student.rollno,
                      name: student.name,
                      department: student.department,
                    ),
              ),
            );
          } else {
            // Handle case where student data is not found
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Student data not found')),
            );
          }
        }

      }
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          _scanResult = 'Failed to get platform version.';
        });
      }
    }
  }


Future<void> navigateToCheckEntry() async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const CheckEntry(),
    ),
  );
}

  void _deleteAllEntries() async {
   // await _appDb.studentDao.deleteAllEntries();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _scanResult,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteAllEntries,
              child: const Text('Delete Entries'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startBarcodeScan,
              child: const Text('Scan Barcode'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: navigateToCheckEntry,
                child: const Text('Check Entry')
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _startBarcodeScan,
                child: const Text('Send data'))


          ])));
  }
}
