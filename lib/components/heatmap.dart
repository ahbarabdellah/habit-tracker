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
      padding: const EdgeInsets.all(20),
      child: HeatMap(
        startDate: convertYYYYMMDDToDateTime(widget.startDate),
        defaultColor: Colors.white,
        textColor: Colors.black,
        colorMode: ColorMode.color,
        datasets: widget.dataset,
        colorsets: {
          1: Colors.green.shade100,
          2: Colors.green.shade200,
          3: Colors.green.shade300,
          4: Colors.green.shade400,
          5: Colors.green.shade500,
          6: Colors.green.shade600,
          7: Colors.green.shade700,
          8: Colors.green.shade800,
          9: Colors.green.shade900,
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
