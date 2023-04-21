import 'package:flutter/material.dart';
import 'package:sample_to_do/widgets/appbar_widget.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: Text(title),
      ),
    );
  }
}
