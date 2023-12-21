import 'package:habit_tracker/date_time/date_time.dart';
import 'package:hive/hive.dart';

var _myBox = Hive.box('Habits_Database');

class HabitDatabase {
  List habits = [];

  // init data
  void initdata() {
    habits = [
      ["Run", false],
      ["Read a Book", false],
    ];
    _myBox.put(getCurrentDateYYYYMMDD(), habits);
  }

  // read Data
  void loaddata() {
    if (_myBox.get(getCurrentDateYYYYMMDD()) == null) {
      habits = _myBox.get("Current_habit_list");
      for (int i = 0; i < habits.length; i++) {
        habits[i][1] = false;
      }
    } else {
      habits = _myBox.get(getCurrentDateYYYYMMDD());
    }
  }

  // update the data
  void updatedate() {
    _myBox.put(getCurrentDateYYYYMMDD(), habits);
    _myBox.put("Current_habit_list", habits);
  }
}
