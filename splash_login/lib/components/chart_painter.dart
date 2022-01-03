import 'package:flutter/material.dart';
import 'package:splash_login/model/member.dart';
import '../gene/colors.dart' as custcolor;

const int nextPoshor = 55;
const int nextPosVer = 20;

class ChartPainter extends CustomPainter {
  final Member memData;
  const ChartPainter({required this.memData});

  TextSpan defaultTextSpan(String text) => TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black45,
          fontSize: 13,
        ),
      );

  TextSpan colorTextSpan(String text, Color color) => TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 13,
          color: color,
        ),
      );

  Color getHsgColor(String newtext) {
    Color hsgColor = Colors.black;

    if (newtext.isNotEmpty) {
      var text = newtext.substring(0, 2);
      if (text == 'Su') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Mo') {
        hsgColor = const Color(0xff050505);
      } else if (text == 'Ma') {
        hsgColor = const Color(0xff080808);
      } else if (text == 'Me') {
        hsgColor = const Color(0xff0A0A0A);
      } else if (text == 'Ju') {
        hsgColor = const Color(0xff0D0D0D);
      } else if (text == 'Ve') {
        hsgColor = const Color(0xff121212);
      } else if (text == 'Sa') {
        hsgColor = const Color(0xff141414);
      } else if (text == 'Ra') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Ke') {
        hsgColor = const Color(0xff171717);
      } else if (text == 'Ur') {
        hsgColor = const Color(0xff1C1C1C);
      } else if (text == 'Ne') {
        hsgColor = const Color(0xff212121);
      } else if (text == 'Pl') {
        hsgColor = const Color(0xff242424);
      }
    }
    return hsgColor;
  }

  List<String> planHsgText(Member memData) {
    List<String> planHsgStrArray = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
    ];
    //surHsg	chaHsg	manHsg	budHsg	gurHsg	shuHsg	shaHsg	rahHsg	ketHsg	uraHsg	nepHsg	pluHsg
    int surHsg = memData.surHsg - 1;
    int chaHsg = memData.chaHsg - 1;
    int manHsg = memData.manHsg - 1;
    int budHsg = memData.budHsg - 1;
    int gurHsg = memData.gurHsg - 1;
    int shuHsg = memData.shuHsg - 1;
    int shaHsg = memData.shaHsg - 1;
    int rahHsg = memData.rahHsg - 1;
    int ketHsg = memData.ketHsg - 1;
    int uraHsg = memData.uraHsg - 1;
    int nepHsg = memData.nepHsg - 1;
    int pluHsg = memData.pluHsg - 1;

    String surDeg =
        'Su${memData.surRetro ? '(R)' : ''} ${lon2dmsz(memData.suryaDegree)}';
    String chaDeg =
        'Mo${memData.chaRetro ? '(R)' : ''} ${lon2dmsz(memData.chandraDegree)}';
    String maDeg =
        'Ma${memData.manRetro ? '(R)' : ''} ${lon2dmsz(memData.mangalDegree)}';
    String buDeg =
        'Me${memData.budRetro ? '(R)' : ''} ${lon2dmsz(memData.budhDegree)}';
    String guDeg =
        'Ju${memData.gurRetro ? '(R)' : ''} ${lon2dmsz(memData.guruDegree)}';
    String shDeg =
        'Ve${memData.shuRetro ? '(R)' : ''} ${lon2dmsz(memData.shukraDegree)}';
    String saDeg =
        'Sa${memData.shaRetro ? '(R)' : ''} ${lon2dmsz(memData.shaniDegree)}';
    String raDeg =
        'Ra${memData.rahRetro ? '(R)' : ''} ${lon2dmsz(memData.rahuDegree)}';
    String keDeg =
        'Ke${memData.ketRetro ? '(R)' : ''} ${lon2dmsz(memData.ketuDegree)}';
    String urDeg =
        'Ur${memData.uraRetro ? '(R)' : ''} ${lon2dmsz(memData.uranuDegree)}';
    String neDeg =
        'Ne${memData.nepRetro ? '(R)' : ''} ${lon2dmsz(memData.neptuneDegree)}';
    String plDeg =
        'Pl${memData.pluRetro ? '(R)' : ''} ${lon2dmsz(memData.plutoDegree)}';

    String tmpHsg = "";
    tmpHsg = planHsgStrArray[surHsg];
    planHsgStrArray[surHsg] = tmpHsg == "" ? surDeg : "$tmpHsg,$surDeg";

    tmpHsg = planHsgStrArray[chaHsg];
    planHsgStrArray[chaHsg] = tmpHsg == "" ? chaDeg : "$tmpHsg,$chaDeg";

    tmpHsg = planHsgStrArray[manHsg];
    planHsgStrArray[manHsg] = tmpHsg == "" ? maDeg : "$tmpHsg,$maDeg";

    tmpHsg = planHsgStrArray[budHsg];
    planHsgStrArray[budHsg] = tmpHsg == "" ? buDeg : "$tmpHsg,$buDeg";

    tmpHsg = planHsgStrArray[gurHsg];
    planHsgStrArray[gurHsg] = tmpHsg == "" ? guDeg : "$tmpHsg,$guDeg";

    tmpHsg = planHsgStrArray[shuHsg];
    planHsgStrArray[shuHsg] = tmpHsg == "" ? shDeg : "$tmpHsg,$shDeg";

    tmpHsg = planHsgStrArray[shaHsg];
    planHsgStrArray[shaHsg] = tmpHsg == "" ? saDeg : "$tmpHsg,$saDeg";

    tmpHsg = planHsgStrArray[rahHsg];
    planHsgStrArray[rahHsg] = tmpHsg == "" ? raDeg : "$tmpHsg,$raDeg";

    tmpHsg = planHsgStrArray[ketHsg];
    planHsgStrArray[ketHsg] = tmpHsg == "" ? keDeg : "$tmpHsg,$keDeg";

    tmpHsg = planHsgStrArray[uraHsg];
    planHsgStrArray[uraHsg] = tmpHsg == "" ? urDeg : "$tmpHsg,$urDeg";

    tmpHsg = planHsgStrArray[nepHsg];
    planHsgStrArray[nepHsg] = tmpHsg == "" ? neDeg : "$tmpHsg,$neDeg";

    tmpHsg = planHsgStrArray[pluHsg];
    planHsgStrArray[pluHsg] = tmpHsg == "" ? plDeg : "$tmpHsg,$plDeg";

    return planHsgStrArray;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = custcolor.AppColor.gradientFirst.withOpacity(0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    // print(size.width * 1 / 12);
    // print(size.height * 1 / 8);
    // print(size.height * 11 / 12);
    // print(size.height * 7 / 8);
    // final a = Offset(size.width * 1 / 12, size.height * 1 / 8);
    // final b = Offset(size.width * 11 / 12, size.height * 7 / 8);
    const double w1 = 0.2;
    const double h1 = 0.2;
    const double w2 = 11.8;
    const double h2 = 7.8;
    const double w3 = (w2 - w1) / 2;
    const double h3 = (h2 - h1) / 2;

    final a = Offset(size.width * w1 / 12, size.height * h1 / 8);
    final b = Offset(size.width * w2 / 12, size.height * h2 / 8);
    final rect = Rect.fromPoints(a, b);

    final c = Offset(size.width * w2 / 12, size.height * h1 / 8);
    final d = Offset(size.width * w1 / 12, size.height * h2 / 8);

    final e = Offset(size.width * w3 / 12, size.height * h1 / 8);
    final f = Offset(size.width * w1 / 12, size.height * h3 / 8);

    final k = Offset(size.width * w2 / 12, size.height * h3 / 8);
    final l = Offset(size.width * w3 / 12, size.height * h2 / 8);

    final g = Offset(size.width * w3 / 12, size.height * h1 / 8);
    final h = Offset(size.width * w2 / 12, size.height * h3 / 8);

    final i = Offset(size.width * w1 / 12, size.height * h3 / 8);
    final j = Offset(size.width * w3 / 12, size.height * h2 / 8);

    canvas.drawRect(rect, paint);
    canvas.drawLine(a, b, paint);
    canvas.drawLine(c, d, paint);
    canvas.drawLine(e, f, paint);
    canvas.drawLine(g, h, paint);

    canvas.drawLine(i, j, paint);
    canvas.drawLine(k, l, paint);
//**********************-1
    int lagNaRashi = memData.lagnaRashi;

    List<int> intHsgArr = [
      (lagNaRashi) > 12 ? (lagNaRashi) - 12 : (lagNaRashi),
      (lagNaRashi + 1) > 12 ? (lagNaRashi + 1) - 12 : (lagNaRashi + 1),
      (lagNaRashi + 2) > 12 ? (lagNaRashi + 2) - 12 : (lagNaRashi + 2),
      (lagNaRashi + 3) > 12 ? (lagNaRashi + 3) - 12 : (lagNaRashi + 3),
      (lagNaRashi + 4) > 12 ? (lagNaRashi + 4) - 12 : (lagNaRashi + 4),
      (lagNaRashi + 5) > 12 ? (lagNaRashi + 5) - 12 : (lagNaRashi + 5),
      (lagNaRashi + 6) > 12 ? (lagNaRashi + 6) - 12 : (lagNaRashi + 6),
      (lagNaRashi + 7) > 12 ? (lagNaRashi + 7) - 12 : (lagNaRashi + 7),
      (lagNaRashi + 8) > 12 ? (lagNaRashi + 8) - 12 : (lagNaRashi + 8),
      (lagNaRashi + 9) > 12 ? (lagNaRashi + 9) - 12 : (lagNaRashi + 9),
      (lagNaRashi + 10) > 12 ? (lagNaRashi + 10) - 12 : (lagNaRashi + 10),
      (lagNaRashi + 11) > 12 ? (lagNaRashi + 11) - 12 : (lagNaRashi + 11),
    ];
    final List<Offset> offsetPost = [
      Offset(size.width * 6 / 12 - 5, (size.height * 3 / 8) + 8),
      Offset(size.width * 3 / 12 - 5, (size.height * 1 / 8) + 18),
      Offset(size.width * 2 / 12, (size.height * 2 / 8) - 8),
      Offset(size.width * 4.9 / 12, (size.height * 3.8 / 8)),
      Offset(size.width * 1.9 / 12, (size.height * 5.6 / 8)),
      Offset(size.width * 3 / 12 - 5, (size.height * 6 / 8) + 10),
      Offset(size.width * 6 / 12 - 5, (size.height * 4 / 8) + 20),
      Offset(size.width * 8.5 / 12, (size.height * 6 / 8) + 10),
      Offset(size.width * 9.5 / 12, (size.height * 5.5 / 8) + 10),
      Offset(size.width * 6.7 / 12, (size.height * 3.5 / 8) + 10),
      Offset(size.width * 9.6 / 12, (size.height * 1.9 / 8)),
      Offset(size.width * 8.9 / 12, (size.height * 1.4 / 8)),
    ];

    TextPainter painter;
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (var i = 0; i < intHsgArr.length; i++) {
      painter.text = defaultTextSpan(intHsgArr[i].toString());
      painter.layout();
      painter.paint(canvas, offsetPost[i]);
    }

    List<String> strPalnArr = planHsgText(memData);

    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    List<double> widthList;
    List<double> heightList;
    List<String> planList;
    //**********************-1
    planList = strPalnArr[0].split(',');
    planList.insert(0, 'As ${lon2dmsz(memData.lagnaDegree)}');
    paintFirstPattern(planList, painter, size, canvas, 5.0, 1.1);
    //**********************-2
    planList = strPalnArr[1].split(',');
    widthList = [2, 1.4, 2, 2];
    heightList = [0.3, 0.3, 0.7, 1.1];
    paintSecondPattern(planList, painter, size, canvas, widthList, heightList);
    //**********************-3
    planList = strPalnArr[2].split(',');
    widthList = [0.3, 0.3, 0.3];
    heightList = [2.1, 1.6, 1.3];
    paintThirdPattern(planList, painter, size, canvas, widthList, heightList);
    //**********************-4
    planList = strPalnArr[3].split(',');
    paintFirstPattern(planList, painter, size, canvas, 2.3, 3);
    //**********************-5
    planList = strPalnArr[4].split(',');
    widthList = [0.3, 0.3, 0.3];
    heightList = [6.0, 5.5, 5.2];
    paintThirdPattern(planList, painter, size, canvas, widthList, heightList);
    //**********************-6
    planList = strPalnArr[5].split(',');
    widthList = [2, 1.4, 2, 2];
    heightList = [7.4, 7.4, 7.0, 6.6];
    paintSecondPattern(planList, painter, size, canvas, widthList, heightList);
    //**********************-7
    planList = strPalnArr[6].split(',');
    paintFirstPattern(planList, painter, size, canvas, 5.0, 5.1);
    //**********************-8
    planList = strPalnArr[7].split(',');
    widthList = [7.8, 7.2, 7.8, 7.8];
    heightList = [7.4, 7.4, 7.0, 6.6];
    paintSecondPattern(planList, painter, size, canvas, widthList, heightList);
    //**********************-9
    planList = strPalnArr[8].split(',');
    widthList = [10, 10, 10];
    heightList = [6.0, 5.5, 5.2];
    paintThirdPattern(planList, painter, size, canvas, widthList, heightList);
    //**********************-10
    planList = strPalnArr[9].split(',');
    paintFirstPattern(planList, painter, size, canvas, 8.0, 3.0);
    //**********************-11
    planList = strPalnArr[10].split(',');
    widthList = [9.9, 9.9, 9.9];
    heightList = [2.1, 1.6, 1.3];
    paintThirdPattern(planList, painter, size, canvas, widthList, heightList);
    //**********************-12
    planList = strPalnArr[11].split(',');
    widthList = [8, 7.6, 8, 8];
    heightList = [0.3, 0.3, 0.7, 1.1];
    paintSecondPattern(planList, painter, size, canvas, widthList, heightList);
  }

  paintFirstPattern(List<String> planList, TextPainter painter, Size size,
      Canvas canvas, double width, double height) {
    int iniPos = 0;
    String pln = "";
    for (var i = 0; i < planList.length; i++) {
      pln = planList[i];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position = Offset(
          (size.width * width / 12), (size.height * height / 8) + iniPos);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPosVer;
    }
  }

  paintSecondPattern(List<String> planList, TextPainter painter, Size size,
      Canvas canvas, List<double> width, List<double> height) {
    int iniPos = 0;
    String pln = "";
    if (planList.length == 1) {
      pln = planList[0];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position = Offset(
          (size.width * width[0] / 12) + iniPos, (size.height * height[0] / 8));
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    } else {
      for (var i = 0; i < planList.length; i++) {
        if (i == 2) {
          break;
        }
        pln = planList[i];
        painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
        Offset position = Offset((size.width * width[1] / 12) + iniPos,
            (size.height * height[1] / 8));
        painter.layout();
        painter.paint(canvas, position);
        iniPos += nextPoshor + (pln.length > 8 ? 10 : 0);
      }
      iniPos = 0;
      for (var i = 2; i < planList.length; i++) {
        if (i == 3) {
          break;
        }
        pln = planList[i];
        painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
        Offset position = Offset((size.width * width[2] / 12) + iniPos,
            (size.height * height[2] / 8));
        painter.layout();
        painter.paint(canvas, position);
        iniPos += nextPoshor;
      }
      iniPos = 0;
      for (var i = 3; i < planList.length; i++) {
        pln = planList[i];
        painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
        Offset position = Offset((size.width * width[3] / 12),
            (size.height * height[3] / 8) + iniPos);
        painter.layout();
        painter.paint(canvas, position);
        iniPos += nextPosVer;
      }
    }
  }

  paintThirdPattern(planList, painter, size, canvas, List<double> width,
      List<double> height) {
    int iniPos = 0;
    String pln = "";
    if (planList.length <= 2) {
      for (var i = 0; i < planList.length; i++) {
        if (i == 0) {
          iniPos = 0;
          pln = planList[i];
          painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
          Offset position = Offset(size.width * width[0] / 12,
              (size.height * height[0] / 8) + iniPos);
          painter.layout();
          painter.paint(canvas, position);
          iniPos += nextPosVer;
        } else if (i == 1) {
          iniPos = 0;
          pln = planList[i];
          painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
          Offset position = Offset(size.width * width[1] / 12,
              (size.height * height[1] / 8) + iniPos);
          painter.layout();
          painter.paint(canvas, position);
          iniPos += nextPosVer;
        }
      }
    } else {
      iniPos = 0;
      for (var i = 0; i < planList.length; i++) {
        pln = planList[i];
        painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
        Offset position = Offset(
            size.width * width[1] / 12, (size.height * height[2] / 8) + iniPos);
        painter.layout();
        painter.paint(canvas, position);
        iniPos += nextPosVer;
      }
    }
  }

  String lon2dmsz(x) {
    var x1 = x.abs();
    //let z = Math.floor(x / 30);
    var d = x1.floor();
    var ss0 = ((x1 - d) * 3600).round();
    var m = (ss0 / 60).floor();
    //var s = (ss0 % 60) % 60;
    d = d % 30;
    //var str = d.toString() + " " + m.toString() + "'" + s.toString() + "\" ";
    var str = d.toString() + ":" + m.toString();
    return str;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
