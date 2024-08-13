
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:library_qr/views/checkentry.dart';
import 'package:library_qr/views/student_detail_view.dart';
import 'package:library_qr/services/local_database_service.dart';
import '../services/cloud_database_service.dart';
import 'package:library_qr/views/past_student.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});
  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  String _scanResult = 'Scan a barcode';
  late InsertData _insertData;

  @override
  void initState() {
    super.initState();
    _insertData = InsertData(rollno: '', name: '', department: '');
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


        final updateOutTime = await _insertData.updateOuttime(barcodeScanRes);
        if (updateOutTime) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Out time updated'))
            );
          }
        }
        else if(updateOutTime == false) {
          final fetchFromArchiveStudent = await _insertData.fetchFromArchiveStudent(barcodeScanRes);
          if (fetchFromArchiveStudent) {
            Fluttertoast.showToast(
              msg: 'Registered Successfully',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
          else {
          final fetchStudent = await fetchStudentData(barcodeScanRes);
          if (mounted) {
            if (fetchStudent != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StudentView(
                        rollno: fetchStudent.rollno,
                        name: fetchStudent.name,
                        department: fetchStudent.department,
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
      }
    }
      }catch (e) {
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
        ));
  }

  Future<void> navigateToPastStudent() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
        const PastStudent(),
        ));
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
                    onPressed: _startBarcodeScan,
                    child: const Text('Scan Barcode'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: navigateToCheckEntry,
                      child: const Text('Live students')
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: navigateToPastStudent,
                      child: const Text('Past Students'))
                ])));
  }
}