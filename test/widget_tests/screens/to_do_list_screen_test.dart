import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_to_do/screens/to_do_list_screen.dart';

void main() {
  testWidgets('Should find title', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ToDoListScreen(title: 'ToDoList'),
    ));

    expect(find.text('ToDoList'), findsOneWidget);
  });
}
