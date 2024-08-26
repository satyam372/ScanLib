import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:library_qr/views/scannerview.dart';

void main() {
  runApp(const MyApp());
  WidgetsApp.debugAllowBannerOverride = true;
  debugPaintSizeEnabled = false;
  debugRepaintRainbowEnabled = false;
  debugRepaintTextRainbowEnabled = false;
  debugProfilePaintsEnabled = true;
  debugProfileBuildsEnabled = true;

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
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



