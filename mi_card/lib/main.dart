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
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/me.PNG'),
            ),
            Text(
              'Maged Elesseily',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 5.5,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans 3'),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+20 12 1102 8846',
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 20,
                      fontFamily: 'Source Sans 3'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'maged.work0@gmail.com',
                  style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 20,
                      fontFamily: 'Source Sans 3'),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
