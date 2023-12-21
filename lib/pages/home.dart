import 'package:flutter/material.dart';
import 'package:habit_tracker/components/alert_dialog.dart';
import 'package:habit_tracker/components/habit_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// habit data structure

  List habits = [
    ["Morning Runs", false],
    ["Evnings Runs", false],
    ["Noon Runs", false],
  ];

  TextEditingController habitTextFieldControler = TextEditingController();

  void checkHabit(bool? value, int index) {
    setState(() {
      habits[index][1] = value!;
    });
  }

  void cancel() {
    habitTextFieldControler.clear();
    Navigator.of(context).pop();
  }

  void saveHabit() {
    setState(() {
      habits.add([habitTextFieldControler.text.trim(), false]);
    });
    habitTextFieldControler.clear();
    Navigator.of(context).pop();
  }

  void editHabitdialog(context, index) {
    showDialog(
        context: context,
        builder: (contex) {
          return AlertDialogWidget(
            hinttext: habits[index][0],
            habitTextFieldControler: habitTextFieldControler,
            cancel: cancel,
            saveHabit: () => editHabit(index),
          );
        });
  }

  void editHabit(int index) {
    setState(() {
      habits[index][0] = habitTextFieldControler.text.trim();
    });
    habitTextFieldControler.clear();
    Navigator.of(context).pop();
  }

  void deleteHabit(int index) {
    setState(() {
      habits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) => HabiteTile(
          habitName: habits[index][0],
          habitValue: habits[index][1],
          onChanged: (value) => checkHabit(value, index),
          onEdit: (context) => editHabitdialog(context, index),
          onDelete: (context) => deleteHabit(index),
        ),
      )),
      floatingActionButton: MyFab(
        habitTextFieldControler: habitTextFieldControler,
        cancel: cancel,
        saveHabit: saveHabit,
      ),
    );
  }
}
