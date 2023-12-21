import 'package:flutter/material.dart';

class HabiteTile extends StatelessWidget {
  final String habitName;
  final bool habitValue;
  final void Function(bool?)? onChanged;
  const HabiteTile(
      {super.key,
      required this.habitName,
      required this.habitValue,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Checkbox(value: habitValue, onChanged: onChanged),
          const SizedBox(width: 15),
          Text(
            habitName,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
