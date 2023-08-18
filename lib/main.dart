import 'package:flutter/material.dart';
import 'package:habitflow/screens/habit_list.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white), bodyLarge: TextStyle(fontSize: 25)),
      ),
      home: HabitList(),
    );
  }
}
