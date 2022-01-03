import 'package:flutter/material.dart';

import 'package:astromnc360/components/chart_painter.dart';
import 'package:astromnc360/components/planet_table.dart';
import 'package:astromnc360/model/member.dart';
import 'package:astromnc360/services/astromnc_service.dart';

class CurrLocScreen extends StatelessWidget {
  const CurrLocScreen({Key? key}) : super(key: key);
  static const String id = "location_screen";

  Future<Member> getCurrentHoro() async {
    AstromncService astromncService = AstromncService();
    Member memData = await astromncService.getcurrentHoro();
    return memData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([getCurrentHoro()]),
      builder: (BuildContext context, AsyncSnapshot memberSnap) {
        Widget child;
        if (memberSnap.hasData) {
          Member membData = memberSnap.data[0];
          child = Scaffold(
            appBar: AppBar(
              title: const Text('Your Current Location Chart'),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        color: Colors.white,
                        width: 300,
                        height: 300,
                        child: CustomPaint(
                          painter: ChartPainter(memData: membData),
                        ),
                      ),
                    ),
                    PlanetTable(memData: membData),
                  ],
                ),
              ),
            ),
          );
        } else {
          child = Container();
        }
        return child;
      },
    );
  }
}
