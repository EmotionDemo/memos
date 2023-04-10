import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class CusHeatMap extends StatefulWidget {
  const CusHeatMap({Key? key, required this.datasets}) : super(key: key);
  final Map<DateTime, int>? datasets;

  @override
  State<CusHeatMap> createState() => _CusHeatMapState();
}

class _CusHeatMapState extends State<CusHeatMap> {
  @override
  Widget build(BuildContext context) {
    return HeatMap(
        showColorTip: false,
        size: 16,
        datasets: widget.datasets,
        startDate: DateTime.now().subtract(const Duration(days: 30)),
        endDate: DateTime.now().add(const Duration(days: 60)),
        colorMode: ColorMode.color,
        showText: false,
        scrollable: false,
        defaultColor: Colors.grey.withOpacity(0.08),
        colorsets: const {
          0: Color.fromARGB(10, 2, 179, 8),
          1: Color.fromARGB(20, 2, 179, 8),
          2: Color.fromARGB(40, 2, 179, 8),
          3: Color.fromARGB(60, 2, 179, 8),
          4: Color.fromARGB(80, 2, 179, 8),
          5: Color.fromARGB(100, 2, 179, 8),
          6: Color.fromARGB(120, 2, 179, 8),
          7: Color.fromARGB(150, 2, 179, 8),
          8: Color.fromARGB(180, 2, 179, 8),
          9: Color.fromARGB(220, 2, 179, 8),
          10: Color.fromARGB(255, 2, 179, 8),
          13: Color.fromARGB(255, 2, 161, 59),
        });
  }
}
