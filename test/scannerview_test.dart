import 'package:flutter_test/flutter_test.dart';
import 'package:library_qr/views/scannerview.dart';

void main() {
  testWidgets('Complete barcode scan flow', (WidgetTester tester) async {
    await tester.pumpWidget(const Scannscreen());

    // Simulate the scanning of a barcode
    await tester.tap(find.text('Scan Barcode'));
    await tester.pumpAndSettle();
  });
}
