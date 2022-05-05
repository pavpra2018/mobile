import 'package:flutter/material.dart';
import 'package:splash_login/components/birth_chart.dart';
import 'package:splash_login/components/text_display.dart';
import 'package:splash_login/model/member.dart';
import 'package:splash_login/services/astromnc_service.dart';
import '../gene/colors.dart' as custcolor;

// ignore: must_be_immutable
class CurLocChartScreen extends StatelessWidget {
  final Member membData;
  const CurLocChartScreen({Key? key, required this.membData}) : super(key: key);

  Future<Member> getCurrentHoro(Member membData) async {
    AstromncService astromncService = AstromncService();
    Member newmemData = await astromncService.getcurrentHoro();
    newmemData.memName = membData.memName;
    debugPrint(newmemData.memName);
    debugPrint(newmemData.memID);
    return newmemData;
  }

  @override
  Widget build(BuildContext context) {
    Member _membData = membData;
    debugPrint(_membData.toString());
    return FutureBuilder(
      future: Future.wait([getCurrentHoro(_membData)]),
      builder: (BuildContext context, AsyncSnapshot memberSnap) {
        Widget child;
        if (memberSnap.hasData) {
          Member _membData = memberSnap.data[0];

          child = Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextDisplay(membData: _membData),
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  color: custcolor.AppColor.pageTextWhite,
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.75,
                      child: CustomPaint(
                        painter: BirthChart(memData: _membData),
                      ),
                    ),
                  ),
                ),
              ],
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
