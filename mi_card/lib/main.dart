import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            width: 120,
            height: 100,
            margin: EdgeInsets.only(left: 100),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
