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
        textColor: Colors.black,
        colorMode: ColorMode.opacity,
        datasets: widget.dataset,
        colorsets: const {1: Colors.green},
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
