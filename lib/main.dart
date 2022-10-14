import 'package:flutter/material.dart';
import 'package:habbit_tracker/screens/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // hive: local storage
  await Hive.initFlutter();

  //database name
  await Hive.openBox("Habit_Database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
