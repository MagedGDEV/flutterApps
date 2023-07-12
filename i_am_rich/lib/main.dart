import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Image(
          image: NetworkImage(
              'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'),
        ),
        backgroundColor: Colors.blueGrey,
      ),
    ),
  );
}
