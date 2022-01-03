import 'package:flutter/material.dart';
import 'package:splash_login/model/member.dart';

const int nextPoshor = 55;
const int nextPosVer = 20;

class ChartPainter extends CustomPainter {
  final Member memData;
  const ChartPainter({required this.memData});

  TextSpan defaultTextSpan(String text) => TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
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
        hsgColor = const Color(0xff030303);
      } else if (text == 'Ma') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Me') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Ju') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Ve') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Sa') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Ra') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Ke') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Ur') {
        hsgColor = const Color(0xff030303);
      } else if (text == 'Ne') {
        hsgColor = Colors.yellow;
      } else if (text == 'Pl') {
        hsgColor = Colors.blueGrey;
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
      ..color = Colors.orange.shade100
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
      Offset(size.width * 1.8 / 12, (size.height * 2 / 8) - 8),
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
    int iniPos = 0;
    List<String> planList;
    //**********************-1

    planList = strPalnArr[0].split(',');

    for (var i = 0; i < planList.length; i++) {
      var pln = planList[i];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 5 / 12), (size.height * 1.1 / 8) + iniPos);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPosVer;
    }

    //painter.text = colorTextSpan(strPalnArr[0], Colors.orangeAccent);
    //Offset position1 = Offset(size.width * 4 / 12, (size.height * 2 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position1);
//**********************-2
    //painter.text = colorTextSpan(strPalnArr[1], Colors.indigoAccent);
    //Offset position2 = Offset(size.width * 2 / 12, (size.height * 1 / 8) + 5);
    //painter.layout();
    //painter.paint(canvas, position);
    iniPos = 0;
    planList = strPalnArr[1].split(','); //['Su', 'Ma', 'Bu'];
    print(planList);
    for (var i = 0; i < (planList.length - 2); i++) {
      var pln = planList[i];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 1.4 / 12) + iniPos, (size.height * 0.3 / 8));
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }
    iniPos = 0;
    for (var i = 2; i < (planList.length - 1); i++) {
      var pln = planList[i];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 1.8 / 12) + iniPos, (size.height * 0.8 / 8));
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }
    iniPos = 0;
    for (var i = 3; i < planList.length; i++) {
      var pln = planList[i];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 1.8 / 12) + iniPos, (size.height * 1.2 / 8));
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }
//**********************-3
    // painter.text = colorTextSpan(strPalnArr[2], Colors.black);
    // Offset position3 =
    //     Offset(size.width * 1.1 / 12, (size.height * 2 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position3);
    iniPos = 10;
    planList = strPalnArr[2].split(',');
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset(size.width * 0.4 / 12, (size.height * 1 / 8) + iniPos);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPosVer;
    }
//**********************-4
    // painter.text = colorTextSpan(strPalnArr[3], Colors.deepPurple);
    // Offset position4 =
    //     Offset(size.width * 1.6 / 12, (size.height * 3.5 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position4);
    iniPos = 0;
    planList = strPalnArr[3].split(',');
    for (var i = 0; i < 1; i++) {
      var pln = planList[i];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position = Offset(
          (size.width * 1.9 / 12) + iniPos, (size.height * 2.6 / 8) + 10);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }
    iniPos = 0;
    for (var i = 1; i < 3; i++) {
      var pln = planList[i];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position = Offset(
          (size.width * 1.5 / 12) + iniPos, (size.height * 3.1 / 8) + 10);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }

    iniPos = 0;
    for (var i = 3; i < planList.length; i++) {
      var pln = planList[i];
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position = Offset(
          (size.width * 1.5 / 12) + iniPos, (size.height * 3.6 / 8) + 10);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }

//**********************-5
    // painter.text = colorTextSpan(strPalnArr[4], Colors.cyan);
    // Offset position5 =
    //     Offset(size.width * 1.1 / 12, (size.height * 5 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position5);

    iniPos = 10;
    planList = strPalnArr[4].split(',');
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset(size.width * 0.4 / 12, (size.height * 4.5 / 8) + iniPos);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPosVer;
    }
//**********************-6
    // painter.text = colorTextSpan(strPalnArr[5], Colors.redAccent);
    // Offset position6 =
    //     Offset(size.width * 2.0 / 12, (size.height * 6 / 8) + 20);
    // painter.layout();
    // painter.paint(canvas, position6);

    iniPos = 0;
    planList = strPalnArr[5].split(',');
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 1.3 / 12) + iniPos, (size.height * 7.3 / 8));
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }
    //**********************-7
    // painter.text = colorTextSpan(strPalnArr[6], Colors.green);
    // Offset position7 = Offset(size.width * 4 / 12, (size.height * 5 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position7);
    iniPos = 0;
    planList = strPalnArr[6].split(',');
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 4 / 12) + iniPos, (size.height * 5.7 / 8));
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }
    //**********************-8
    // painter.text = colorTextSpan(strPalnArr[7], Colors.pinkAccent);
    // Offset position8 =
    //     Offset(size.width * 7.0 / 12, (size.height * 6 / 8) + 20);
    // painter.layout();
    // painter.paint(canvas, position8);
    iniPos = 0;
    planList = strPalnArr[7].split(',');
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 6.5 / 12) + iniPos, (size.height * 7.3 / 8));
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }

    //**********************-9
    // painter.text = colorTextSpan(strPalnArr[8], Colors.blueGrey);
    // Offset position9 = Offset(size.width * 9 / 12, (size.height * 5 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position9);
    iniPos = 10;
    planList = strPalnArr[8].split(',');
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 10.8 / 12), (size.height * 4.5 / 8) + iniPos);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPosVer;
    }
//**********************-10

    // painter.text = colorTextSpan(strPalnArr[9], Colors.teal);
    // Offset position10 =
    //     Offset(size.width * 7.1 / 12, (size.height * 3.5 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position10);

    iniPos = 10;
    planList = strPalnArr[9].split(',');
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position = Offset(
          (size.width * 6.5 / 12) + iniPos, (size.height * 3.3 / 8) + 10);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }
//**********************-11
    // painter.text = colorTextSpan(strPalnArr[10], Colors.brown);
    // Offset position11 = Offset(size.width * 9 / 12, (size.height * 2 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position11);
    iniPos = 10;
    planList = strPalnArr[10].split(',');
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 10.8 / 12), (size.height * 0.7 / 8) + iniPos);
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPosVer;
    }
//**********************-12
    // painter.text = colorTextSpan(strPalnArr[11], Colors.cyanAccent);
    // Offset position112 =
    //     Offset(size.width * 7.1 / 12, (size.height * 1 / 8) + 5);
    // painter.layout();
    // painter.paint(canvas, position112);

    iniPos = 0;
    planList = strPalnArr[11].split(','); //['Ve', 'Ne', 'Pl', 'Su'];
    for (var pln in planList) {
      painter.text = colorTextSpan(pln, getHsgColor(pln.trim()));
      Offset position =
          Offset((size.width * 6.7 / 12) + iniPos, (size.height * 0.3 / 8));
      painter.layout();
      painter.paint(canvas, position);
      iniPos += nextPoshor;
    }
  }

  String lon2dmsz(x) {
    var x1 = x.abs();
    //let z = Math.floor(x / 30);
    var d = x1.floor();
    var ss0 = ((x1 - d) * 3600).round();
    var m = (ss0 / 60).floor();
    var s = (ss0 % 60) % 60;
    d = d % 30;
    //var str = d.toString() + " " + m.toString() + "'" + s.toString() + "\" ";
    var str = d.toString() + ":" + m.toString();
    return str;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
