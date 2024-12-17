// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_hello_template/main.dart'; // Đảm bảo tên package trùng với tên ứng dụng

// void main() {
//   group('Flutter Hello Github Classroom App Tests', () {
//     testWidgets('Displays correct text', (WidgetTester tester) async {
//       // Build the app
//       await tester.pumpWidget(const MainApp());

//       // Verify that 'Hello Github Classroom' is found
//       expect(find.text('Hello Github Classroom'), findsOneWidget);
//     });

//     testWidgets('Text is centered on the screen', (WidgetTester tester) async {
//       await tester.pumpWidget(const MainApp());

//       // Find the Center widget
//       final centerWidget = find.byType(Center);
//       expect(centerWidget, findsOneWidget);

//       // Verify the Center widget contains the Text widget
//       final textWidget = find.descendant(
//           of: centerWidget, matching: find.text('Hello Github Classroom'));
//       expect(textWidget, findsOneWidget);
//     });

//     testWidgets('Text has correct style', (WidgetTester tester) async {
//       await tester.pumpWidget(const MainApp());

//       // Verify the Text widget style
//       final textFinder = find.text('Hello Github Classroom');
//       final textWidget = tester.widget<Text>(textFinder);

//       // Check font size and other properties
//       expect(textWidget.style?.fontSize, 24);
//       expect(textWidget.style?.color, isNull); // Expect default color
//     });

//     testWidgets('App has a Scaffold widget', (WidgetTester tester) async {
//       await tester.pumpWidget(const MainApp());

//       // Verify there is a Scaffold widget
//       expect(find.byType(Scaffold), findsOneWidget);
//     });
//   });
// }
