import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/tasks_provider.dart';
import 'screens/tasks_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksProvider(),
      builder: (context, child) {
        return const MaterialApp(
          home: TasksScreen(),
        );
      },
    );
  }
}
