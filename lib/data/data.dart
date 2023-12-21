import 'package:habit_tracker/date_time/date_time.dart';
import 'package:hive/hive.dart';

var _myBox = Hive.box('Habits_Database');

class HabitDatabase {
  List habits = [];
  Map<DateTime, int> datasethabitstracker = {};
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
      _myBox.put("StartDate", getCurrentDateYYYYMMDD());

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
    claculatepercetagehabits();
    loadHeatMap();
  }

  void claculatepercetagehabits() {
    int contCompleted = 0;
    for (int i = 0; i < habits.length; i++) {
      if (habits[i][1]) {
        contCompleted++;
      }
    }
    String percent = habits.isEmpty
        ? "0.0"
        : (contCompleted / habits.length).toStringAsFixed(1);
    _myBox.put('Percent_${getCurrentDateYYYYMMDD()}', percent);
  }

  void loadHeatMap() {
    DateTime startDate = convertYYYYMMDDToDateTime(_myBox.get("StartDate"));

    int daysInBetwen = DateTime.now().difference(startDate).inDays;

    for (int i = 0; i < daysInBetwen + 1; i++) {
      String yyyymmdd =
          convertDateTimeToYYYYMMDD(startDate.add(Duration(days: i)));
      double power = double.parse(_myBox.get('Percent_$yyyymmdd') ?? "0.0");
      int year = startDate.add(Duration(days: i)).year;
      int month = startDate.add(Duration(days: i)).month;
      int day = startDate.add(Duration(days: i)).day;

      final percentageForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * power).toInt(),
      };
      datasethabitstracker.addEntries(percentageForEachDay.entries);
    }
  }
}
