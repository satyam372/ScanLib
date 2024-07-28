import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui';
import 'package:library_qr/Api/insert_data.dart';

Future<Uint8List> imageToBytes(ui.Image image) async {
  final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}



class StudentView extends StatefulWidget {
  final String rollno;
  final String name;
  final String department;

  const StudentView({super.key,
    required this.rollno,
    required this.name,
    required this.department,
  });

  @override
  StudentViewState createState() => StudentViewState();
}

class StudentViewState extends State<StudentView> {
  late TextEditingController _field1Controller;
  late TextEditingController _field2Controller;
  late TextEditingController _field3Controller;
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();



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

  Future<void> _clearImage() async {
    _signaturePadKey.currentState!.clear();
  }

  Future<void> _handleSubmit() async {
    // Obtain the signature as an image
    // Convert the image to Uint8List

    // Create an instance of InsertData and call the insert method
    final insertData = InsertData(
      rollno: _field1Controller.text,
      name: _field2Controller.text,
    );

    await insertData.insert();

    // Clear the signature pad after obtaining the image
    _signaturePadKey.currentState!.clear();

    // Print the signature dimensions for demonstration

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                    controller: _field1Controller,
                    decoration: const InputDecoration(
                      labelText: 'Rollno',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    enabled: false,
                    style: const TextStyle(color: Colors.black, fontSize: 30)),
                const SizedBox(height: 20),
                TextField(
                  controller: _field2Controller,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  enabled: false,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _field3Controller,
                  decoration: const InputDecoration(
                      labelText: 'Department',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  enabled: false,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Signature:-',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 1),
                SizedBox(
                  height: 150,
                  width: 400,
                  child: SfSignaturePad(
                    minimumStrokeWidth: 3,
                    maximumStrokeWidth: 3,
                    strokeColor: Colors.blue,
                    key: _signaturePadKey,
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _clearImage,
                  child: const Text('Clear'),
                ),
                const SizedBox(height: 60),
                SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          shadowColor: Colors.blue,
                          minimumSize: const Size(100, 40),
                        ),
                        onPressed: _handleSubmit,
                        child: const Text('Register',
                            style: TextStyle(
                              fontSize: 30,
                            ))))
              ],
            )));
  }
}
