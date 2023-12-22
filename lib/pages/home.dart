import 'package:flutter/material.dart';
import 'package:habit_tracker/components/alert_dialog.dart';
import 'package:habit_tracker/components/habit_tile.dart';
import 'package:habit_tracker/components/heatmap.dart';
import 'package:habit_tracker/date_time/date_time.dart';
import 'package:hive/hive.dart';
import 'package:habit_tracker/data/data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// habit data structure
  var myBox = Hive.box("Habits_Database");

  var db = HabitDatabase();
  @override
  void initState() {
    if (myBox.get("Current_habit_list") == null) {
      db.initdata();
      myBox.put("StartDate", getCurrentDateYYYYMMDD());
    } else {
      db.loaddata();
    }

    db.updatedate();
    super.initState();
  }

  TextEditingController habitTextFieldControler = TextEditingController();

  void checkHabit(bool? value, int index) {
    setState(() {
      db.habits[index][1] = value!;
    });
    db.updatedate();
  }

  void cancel() {
    habitTextFieldControler.clear();
    Navigator.of(context).pop();
  }

  void saveHabit() {
    setState(() {
      db.habits.add([habitTextFieldControler.text.trim(), false]);
    });
    habitTextFieldControler.clear();
    Navigator.of(context).pop();
    db.updatedate();
  }

  void editHabitdialog(context, index) {
    showDialog(
        context: context,
        builder: (contex) {
          return AlertDialogWidget(
            hinttext: db.habits[index][0],
            habitTextFieldControler: habitTextFieldControler,
            cancel: cancel,
            saveHabit: () => editHabit(index),
          );
        });
  }

  void editHabit(int index) {
    setState(() {
      db.habits[index][0] = habitTextFieldControler.text.trim();
    });
    habitTextFieldControler.clear();
    Navigator.of(context).pop();
    db.updatedate();
  }

  void deleteHabit(int index) {
    setState(() {
      db.habits.removeAt(index);
    });
    db.updatedate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.repeat),
          SizedBox(
            width: 10,
          ),
          Text("Habits Tracker"),
        ]),
        backgroundColor: Colors.green.shade100,
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
          // Important to prevent independent scrolling
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "🔥 Map Summary",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Heatmapcalndr(
              dataset: db.datasethabitstracker,
              startDate: myBox.get('StartDate'),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "🚀 Habits List",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: db.habits.length,
              itemBuilder: (context, index) => HabiteTile(
                habitName: db.habits[index][0],
                habitValue: db.habits[index][1],
                onChanged: (value) => checkHabit(value, index),
                onEdit: (context) => editHabitdialog(context, index),
                onDelete: (context) => deleteHabit(index),
              ),
            ),
          ]),
      floatingActionButton: MyFab(
        habitTextFieldControler: habitTextFieldControler,
        cancel: cancel,
        saveHabit: saveHabit,
      ),
    );
  }
}
