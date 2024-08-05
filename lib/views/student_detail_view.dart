import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:library_qr/Api/api.dart';
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
  late TextEditingController field1Controller;
  late TextEditingController field2Controller;
  late TextEditingController field3Controller;
  final GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  late Api _api;

  @override
  void initState() {
    super.initState();
    field1Controller = TextEditingController(text: widget.rollno);
    field2Controller = TextEditingController(text: widget.name);
    field3Controller = TextEditingController(text: widget.department);
    _api = Api(this);
  }

  @override
  void dispose() {
    field1Controller.dispose();
    field2Controller.dispose();
    field3Controller.dispose();
    super.dispose();
  }

  Future<void> _clearImage() async {
    signaturePadKey.currentState!.clear();
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
                    controller: field1Controller,
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
                  controller: field2Controller,
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
                  controller: field3Controller,
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
                    key: signaturePadKey,
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
                        onPressed:() => _api.handleRegistration(context),
                        child: const Text('Register',
                            style: TextStyle(
                              fontSize: 30,
                            )
                        )))
              ],
            )));
  }
}