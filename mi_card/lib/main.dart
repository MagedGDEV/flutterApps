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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.white,
                width: 100,
                height: 100,
                child: Text('Container 1'),
              ),
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: Text('Container 2'),
              ),
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: Text('Container 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
