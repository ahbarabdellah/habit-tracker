import 'package:flutter/material.dart';

class MyFab extends StatelessWidget {
  final TextEditingController habitTextFieldControler;
  final void Function() cancel;
  final void Function() saveHabit;

  const MyFab({
    super.key,
    required this.habitTextFieldControler,
    required this.cancel,
    required this.saveHabit,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: TextField(
                controller: habitTextFieldControler,
                decoration: InputDecoration(
                    hintText: "Enter a New Habit ..",
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              actions: [
                GestureDetector(
                  onTap: () => cancel(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 88, 88, 88),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: saveHabit,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 52, 148, 0),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
