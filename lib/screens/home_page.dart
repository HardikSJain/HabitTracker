import 'package:flutter/material.dart';
import 'package:habbit_tracker/components/fab.dart';
import 'package:habbit_tracker/components/habit_tile.dart';
import 'package:habbit_tracker/components/new_habit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ds for the list of habits
  List todaysHabits = [
    ["Morning yo", true],
    ["Morning Yoga", false],
    ["Morning Journaling", false],
    ["Morning Reading", false],
  ];

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabits[index][1] = value!;
    });
  }

  final _newHabitNameController = TextEditingController();

  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return EnterNewHabitDialog(
          controller: _newHabitNameController,
          onSave: saveNewHabit,
          onCancel: cancelNewHabit,
        );
      },
    );
  }

  void saveNewHabit() {
    setState(() {
      todaysHabits.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
  }

  void cancelNewHabit() {
    _newHabitNameController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: createNewHabit,
      ),
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
