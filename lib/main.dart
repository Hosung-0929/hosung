import 'package:dev/height_input_screen.dart.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Height Input',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HeightInputScreen(),

    );
  }
}