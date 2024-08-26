import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:library_qr/views/checkentry.dart';
import 'package:library_qr/services/local_database_service.dart';
import '../services/cloud_database_service.dart';
import 'package:library_qr/views/past_student.dart';
import 'package:visibility_detector/visibility_detector.dart';import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'dart:io' show Platform;

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});
  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  String _scanResult = 'Scan a barcode';
  String? _barcode;
  bool visible = false;
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




  Future<void> _startBarcodeScan(String barcodeScanRes) async {
    try {
      if (barcodeScanRes != '-1') {
        setState(() {
          _scanResult = barcodeScanRes;
        });

        final updateOutTime = await _insertData.updateOuttime(barcodeScanRes);
        if (updateOutTime) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Out time updated')));
          }
        } else if (updateOutTime == false) {
          final fetchFromArchiveStudent =
          await _insertData.fetchFromArchiveStudent(barcodeScanRes); // TODO:can we remove this line?
          if (fetchFromArchiveStudent) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registered Successfully')));
            }
          } else {
            final fetchStudent = await fetchStudentData(barcodeScanRes);
            if (mounted) {
              if (fetchStudent != null) {
                _insertData = InsertData(
                  rollno: fetchStudent.rollno,
                  name: fetchStudent.name,
                  department: fetchStudent.department,
                );
                final insert = await _insertData.insert();
                if (insert == true) {
                  if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registered Successfully')),
                  );
                  }
                }
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
    } catch (e) {
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
          builder: (context) => const CheckEntry(),
        ));
  }

  Future<void> navigateToPastStudent() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PastStudent(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: Center(
        child: VisibilityDetector(
          onVisibilityChanged: (VisibilityInfo info) {
            setState(() {
              visible = info.visibleFraction > 0;
            });
          },
          key: const Key('visible-detector-key'),
          child: BarcodeKeyboardListener(
            bufferDuration: const Duration(milliseconds: 200),
            onBarcodeScanned: (barcode) {
              if (!visible) return;
              setState(() {
                _barcode = barcode.replaceAll(RegExp(r'\s+'), '');
              });
              String stringWithoutSpaces = barcode.replaceAll(RegExp(r'\s+'), '');
              _startBarcodeScan(stringWithoutSpaces);
            },
            useKeyDownEvent: Platform.isWindows,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _barcode == null
                      ? _scanResult
                      : 'BARCODE: $_barcode',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: _startBarcodeScan(_barcode!),
                //   child: const Text('Scan Barcode'),
                // ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: navigateToCheckEntry,
                    child: const Text('Live students')),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: navigateToPastStudent,
                    child: const Text('Past Students')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
