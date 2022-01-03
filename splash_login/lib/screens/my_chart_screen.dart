import 'package:flutter/material.dart';
import 'package:splash_login/components/chart_painter.dart';
import 'package:splash_login/components/planet_table.dart';
import 'package:splash_login/components/text_display.dart';
import 'package:splash_login/model/member.dart';
import '../gene/colors.dart' as custcolor;

class MyChartScreen extends StatelessWidget {
  const MyChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Member membData = getmemData();

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              custcolor.AppColor.gradientFirst.withOpacity(0.8),
              custcolor.AppColor.gradientSecond
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextDisplay(membData: membData),
            Container(
              padding: const EdgeInsets.only(top: 8.0),
              color: Colors.white,
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.85,
                  child: CustomPaint(
                    painter: ChartPainter(memData: membData),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Member getmemData() {
    Map<String, dynamic>? memberSnap = {
      'guru': 313.97,
      'neptuneRashi': 8,
      'memName': 'Milind C',
      'plutoRashi': 6,
      'chandra': 236.06,
      'uranu': 183.13,
      'memStatus': 1,
      'ketuRashi': 2,
      'shaniRashi': 3,
      'uranuRashi': 7,
      'memEndDate': DateTime.now(),
      'memUTCOffset': 19800,
      'shukraRashi': 11,
      'memID': 30202112214106,
      'mangalRashi': 3,
      'rahuRashi': 8,
      'guruRashi': 11,
      'nakGraha': 9,
      'memDelres': 1,
      'nakshtraID': 18,
      'rahRetro': true,
      'shukraDegree': 11.7,
      'creationDate': DateTime.now(),
      'chandraRashi': 8,
      'memReports': false,
      'mangal': 61.4,
      'uraRetro': true,
      'surRetro': false,
      'neptune': 225.34,
      'shuRetro': false,
      'memTZName': 'India Standard Time',
      'gurRetro': false,
      'chaRetro': false,
      'shukra': 311.7,
      'chandraDegree': 26.06,
      'budh': 336.64,
      'mangalDegree': 1.4,
      'shaRetro': false,
      'ketuDegree': 29.09,
      'uranuDegree': 3.13,
      'memSearch': 'milind c',
      'suryaRashi': 12,
      'guruDegree': 13.97,
      'lagnaRashi': 8,
      'rahu': 239.09,
      'memYears': 1,
      'latti': 20.4619475,
      'longi': 75.00632879999999,
      'invitationMail': 'Pending',
      'surya': 357.94,
      'memBtime': 22,
      'plutoDegree': 11.47,
      'lagna': 232.07,
      'pluRetro': true,
      'manRetro': false,
      'memDOB': DateTime.now(),
      'shani': 66.27,
      'neptuneDegree': 15.34,
      'lastModifiedDate': DateTime.now(),
      'memMobile': 985059218,
      'ketu': 59.09,
      'budhDegree': 6.64,
      'pluto': 161.47,
      'budRetro': false,
      'shaniDegree': 6.27,
      'rahHsg': 1,
      'shaHsg': 2,
      'chaHsg': 3,
      'pluHsg': 4,
      'nepHsg': 5,
      'uraHsg': 6,
      'surHsg': 7,
      'manHsg': 8,
      'gurHsg': 9,
      'budHsg': 10,
      'ketHsg': 11,
      'shuHsg': 12,
      'nepRetro': true,
      'lagnaDegree': 22.07,
      'memEmail': 'service@astromnc.com',
      'memDST': 0,
      'createdBy': 'local@astromnc.com',
      'rahuDegree': 29.09,
      'memStartDate': DateTime.now(),
      'budhRashi': 12,
      'ketRetro': true,
      'memTZID': 'Asia/Calcutta',
      'memInActivedate': null,
      'memBcity': 'Chalisgaon, Maharashtra 424101, India',
      'suryaDegree': 27.94,
      'memPriID': 30202112214106,
    };
    Member membData = Member.fromMap(memberSnap);
    return membData;
  }
}
