import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabiteTile extends StatelessWidget {
  final String habitName;
  final bool habitValue;
  final void Function(BuildContext)? onEdit;
  final void Function(BuildContext)? onDelete;

  final void Function(bool?)? onChanged;
  const HabiteTile({
    super.key,
    required this.habitName,
    required this.habitValue,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          SlidableAction(
            onPressed: onEdit,
            icon: Icons.edit,
            backgroundColor: const Color.fromARGB(255, 42, 43, 43),
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(20),
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
              Expanded(child: Container()),
              const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_back),
              )
            ],
          ),
        ),
      ),
    );
  }
}
