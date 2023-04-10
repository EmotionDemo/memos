import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../view/heat_map.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25, right: 25, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '14',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Memos')
                ],
              ),
              Column(
                children: [
                  Text(
                    '14',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Tags')
                ],
              ),
              Column(
                children: [
                  Text(
                    '14',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Days')
                ],
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 10, right: 5, top: 20),
          child: CusHeatMap(
            datasets: {
              DateTime(2023, 4, 6): 1,
              DateTime(2023, 4, 7): 10,
              DateTime(2023, 4, 8): 10,
              DateTime(2023, 4, 9): 10,
              DateTime(2023, 4, 13): 1,
            },
          ),
        ),
      ],
    );
  }
}
