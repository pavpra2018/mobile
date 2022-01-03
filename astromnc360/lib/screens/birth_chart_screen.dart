import 'package:astromnc360/components/text_display.dart';
import 'package:flutter/material.dart';

import 'package:astromnc360/components/chart_painter.dart';
import 'package:astromnc360/components/planet_table.dart';
import 'package:astromnc360/model/member.dart';

class BirthChartScreen extends StatelessWidget {
  final Member membData;
  const BirthChartScreen({Key? key, required this.membData}) : super(key: key);
  static const String id = "landing_screen";

  @override
  Widget build(BuildContext context) {
    // final membData =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Chart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextDisplay(membData: membData),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: SizedBox(
                  width: 325,
                  height: 325,
                  child: CustomPaint(
                    painter: ChartPainter(memData: membData),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: PlanetTable(memData: membData),
            ),
          ],
        ),
      ),
    );
  }
}
