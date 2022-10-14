import 'package:habbit_tracker/datetime/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _myBox = Hive.box("Habit_Database");

class HabitDatabase {
  List todaysHabits = [];

  void createDefaultData() {
    todaysHabits = [
      ["Morning Run", false],
      ["Read Book", false],
      ["LeetCode", false],
    ];
    _myBox.put("START_DATE", todaysDateFormatted());
  }

  void loadData() {
    // if new day, get habit list from database
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabits = _myBox.get("CURRENT_HABIT_LIST");

      for (var i = 0; i < todaysHabits.length; i++) {
        todaysHabits[i][1] = false;
      }
    }
    // else load todays list
    else {
      todaysHabits = _myBox.get(todaysDateFormatted());
    }
  }

  void updateDatabase() {
    _myBox.put(todaysDateFormatted(), todaysHabits);
    _myBox.put("CURRENT_HABIT_LIST", todaysHabits);
  }
}
