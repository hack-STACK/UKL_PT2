import 'package:flutter/material.dart';
import 'package:ukl2/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Homepage2(),
        ),
      ),
    );
  }
}
