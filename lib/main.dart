import 'package:flutter/material.dart';

import 'EditFormWidget.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: EditFormWidget(title: 'Forms', questions : []),
    );
  }
}
