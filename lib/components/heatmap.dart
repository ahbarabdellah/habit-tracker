import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_tracker/date_time/date_time.dart';

class Heatmapcalndr extends StatefulWidget {
  const Heatmapcalndr({
    super.key,
    required this.startDate,
    required this.dataset,
  });

  final Map<DateTime, int> dataset;
  final String startDate;

  @override
  State<Heatmapcalndr> createState() => _HeatmapcalndrState();
}

class _HeatmapcalndrState extends State<Heatmapcalndr> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: HeatMap(
        startDate: convertYYYYMMDDToDateTime(widget.startDate),
        defaultColor: Colors.white,
        colorMode: ColorMode.opacity,
        datasets: widget.dataset,
        colorsets: const {
          1: Color.fromARGB(255, 0, 81, 0),
          3: Color.fromARGB(255, 36, 128, 17),
          5: Color.fromARGB(255, 86, 159, 44),
          7: Color.fromARGB(255, 84, 231, 89),
          9: Color.fromARGB(255, 141, 255, 149),
          11: Color.fromARGB(255, 164, 229, 151),
          13: Color.fromARGB(255, 193, 221, 185),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
