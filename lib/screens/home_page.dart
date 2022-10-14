import 'package:flutter/material.dart';

import '../components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ds for the list of habits
  List todaysHabits = [
    ["Morning Meditation", true],
    ["Morning Yoga", false],
    ["Morning Journaling", false],
    ["Morning Reading", false],
    ["Morning Exercise", false],
    ["Morning Breakfast", false],
    ["Morning Shower", false],
    ["Morning Brushing", false],
    ["Morning Stretching", false],
    ["Morning Coffee", false],
    ["Morning Tea", false],
    ["Morning Breakfast", false],
    ["Morning Shower", false],
    ["Morning Brushing", false],
    ["Morning Stretching", false],
    ["Morning Coffee", false],
    ["Morning Tea", false],
  ];

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabits[index][1] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: todaysHabits.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: todaysHabits[index][0],
            habitCompleted: todaysHabits[index][1],
            onCheckboxChanged: (value) => checkBoxTapped(value, index),
          );
        },
      ),
    );
  }
}
