import 'package:HabitTracker/datetime/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';

final _myBox = Hive.box("Habit_Database");

class HabitDatabase {
  List todaysHabits = [];
  Map<DateTime, int> heatMapDataSet = {};

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

    calculateHabitPercentages();

    loadHeatMap();
  }

  void calculateHabitPercentages() {
    int completedHabits = 0;

    for (var i = 0; i < todaysHabits.length; i++) {
      if (todaysHabits[i][1] == true) {
        completedHabits++;
      }
    }
    String percent = todaysHabits.isEmpty
        ? "0.0"
        : ((completedHabits / todaysHabits.length)).toStringAsFixed(1);
    _myBox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(_myBox.get("START_DATE"));

    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // "PERCENTAGE_SUMMARY_yyyymmdd" will be the key in the database
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercent = double.parse(
        _myBox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
      );

      int year = startDate.add(Duration(days: i)).year;

      int month = startDate.add(Duration(days: i)).month;

      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}
