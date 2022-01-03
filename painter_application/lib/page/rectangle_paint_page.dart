import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RectanglePaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            width: 400,
            height: 400,
            child: CustomPaint(
              painter: RectanglePainter(),
              // child: Text(
              //   "Custom Paint",
              //   style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              // ),
            ),
          ),
        ),
      );
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.shade500
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    // print(size.width * 1 / 12);
    // print(size.height * 1 / 8);
    // print(size.height * 11 / 12);
    // print(size.height * 7 / 8);
    final a = Offset(size.width * 1 / 12, size.height * 1 / 8);
    final b = Offset(size.width * 11 / 12, size.height * 7 / 8);
    final rect = Rect.fromPoints(a, b);

    final c = Offset(size.width * 11 / 12, size.height * 1 / 8);
    final d = Offset(size.width * 1 / 12, size.height * 7 / 8);

    final e = Offset(size.width * 6 / 12, size.height * 1 / 8);
    final f = Offset(size.width * 1 / 12, size.height * 4 / 8);

    final g = Offset(size.width * 6 / 12, size.height * 1 / 8);
    final h = Offset(size.width * 11 / 12, size.height * 4 / 8);

    final i = Offset(size.width * 1 / 12, size.height * 4 / 8);
    final j = Offset(size.width * 6 / 12, size.height * 7 / 8);

    final k = Offset(size.width * 11 / 12, size.height * 4 / 8);
    final l = Offset(size.width * 6 / 12, size.height * 7 / 8);

    canvas.drawRect(rect, paint);
    canvas.drawLine(a, b, paint);
    canvas.drawLine(c, d, paint);
    canvas.drawLine(e, f, paint);
    canvas.drawLine(g, h, paint);

    canvas.drawLine(i, j, paint);
    canvas.drawLine(k, l, paint);
//**********************-1
    TextPainter painter;
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    painter.text = TextSpan(
      text: '3',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );
    Offset position1 = Offset(size.width * 6 / 12, (size.height * 3 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position1);
//**********************-2
    painter.text = TextSpan(
      text: '4',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position2 = Offset(size.width * 3.2 / 12, (size.height * 2 / 8) - 5);
    painter.layout();
    painter.paint(canvas, position2);
//**********************-3
    painter.text = TextSpan(
      text: '5',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position3 =
        Offset(size.width * 1.3 / 12, (size.height * 1 / 8) + 30);
    painter.layout();
    painter.paint(canvas, position3);
//**********************-4
    painter.text = TextSpan(
      text: '6',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position4 =
        Offset(size.width * 5 / 12, (size.height * 3.5 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position4);
//**********************-5
    painter.text = TextSpan(
      text: '7',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position5 =
        Offset(size.width * 1.2 / 12, (size.height * 6 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position5);
//**********************-6
    painter.text = TextSpan(
      text: '9',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position6 = Offset(size.width * 6 / 12, (size.height * 4 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position6);
    //**********************-7
    painter.text = TextSpan(
      text: '8',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position7 =
        Offset(size.width * 3.2 / 12, (size.height * 5 / 8) + 40);
    painter.layout();
    painter.paint(canvas, position7);
    //**********************-8

    painter.text = TextSpan(
      text: '10',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position8 =
        Offset(size.width * 8.2 / 12, (size.height * 5 / 8) + 40);
    painter.layout();
    painter.paint(canvas, position8);
    //**********************-9
    painter.text = TextSpan(
      text: '11',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position9 =
        Offset(size.width * 10.2 / 12, (size.height * 6 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position9);
//**********************-10
    painter.text = TextSpan(
      text: '12',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position10 =
        Offset(size.width * 6.5 / 12, (size.height * 3.5 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position10);
//**********************-11
    painter.text = TextSpan(
      text: '1',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position11 =
        Offset(size.width * 10.3 / 12, (size.height * 1 / 8) + 30);
    painter.layout();
    painter.paint(canvas, position11);
//**********************-12
    painter.text = TextSpan(
      text: '2',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position12 =
        Offset(size.width * 8.3 / 12, (size.height * 2 / 8) - 5);
    painter.layout();
    painter.paint(canvas, position12);

    //**********************-1

    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    painter.text = TextSpan(
      text: 'La',
      style: TextStyle(
        color: Colors.orangeAccent,
        fontSize: 20.0,
      ),
    );
    Offset position110 =
        Offset(size.width * 4.5 / 12, (size.height * 1 / 8) + 50);
    painter.layout();
    painter.paint(canvas, position110);
//**********************-2
    painter.text = TextSpan(
      text: 'Mo',
      style: TextStyle(
        color: Colors.indigoAccent,
        fontSize: 18.0,
      ),
    );

    Offset position120 = Offset(size.width * 2 / 12, (size.height * 1 / 8) + 5);
    painter.layout();
    painter.paint(canvas, position120);
//**********************-3
    // painter.text = TextSpan(
    //   text: '',
    //   style: TextStyle(
    //     color: Colors.black,
    //     fontSize: 18.0,
    //   ),
    // );

    // Offset position13 =
    //     Offset(size.width * 1.3 / 12, (size.height * 1 / 8) + 30);
    // painter.layout();
    // painter.paint(canvas, position13);
//**********************-4
    // painter.text = TextSpan(
    //   text: '',
    //   style: TextStyle(
    //     color: Colors.black,
    //     fontSize: 18.0,
    //   ),
    // );

    // Offset position14 =
    //     Offset(size.width * 5 / 12, (size.height * 3.5 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position14);
//**********************-5
    painter.text = TextSpan(
      text: 'Ma',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 18.0,
      ),
    );

    Offset position15 =
        Offset(size.width * 1.2 / 12, (size.height * 5 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position15);
//**********************-6
    painter.text = TextSpan(
      text: 'Me, Ke, Su',
      style: TextStyle(
        color: Colors.redAccent,
        fontSize: 18.0,
      ),
    );

    Offset position16 =
        Offset(size.width * 2.3 / 12, (size.height * 6 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position16);
    //**********************-7
    // painter.text = TextSpan(
    //   text: '',
    //   style: TextStyle(
    //     color: Colors.black,
    //     fontSize: 18.0,
    //   ),
    // );

    // Offset position17 =
    //     Offset(size.width * 3.2 / 12, (size.height * 5 / 8) + 40);
    // painter.layout();
    // painter.paint(canvas, position17);
    //**********************-8

    painter.text = TextSpan(
      text: 'Pl, Sa',
      style: TextStyle(
        color: Colors.pinkAccent,
        fontSize: 18.0,
      ),
    );

    Offset position18 =
        Offset(size.width * 7.8 / 12, (size.height * 6 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position18);
    //**********************-9
    painter.text = TextSpan(
      text: 'Ju, Ne',
      style: TextStyle(
        color: Colors.blueGrey,
        fontSize: 18.0,
      ),
    );

    Offset position19 = Offset(size.width * 9 / 12, (size.height * 5 / 8) + 10);
    painter.layout();
    painter.paint(canvas, position19);
//**********************-10
    // painter.text = TextSpan(
    //   text: '',
    //   style: TextStyle(
    //     color: Colors.blueGrey,
    //     fontSize: 18.0,
    //   ),
    // );

    // Offset position1101 =
    //     Offset(size.width * 6.5 / 12, (size.height * 3.5 / 8) + 10);
    // painter.layout();
    // painter.paint(canvas, position1101);
//**********************-11
    painter.text = TextSpan(
      text: 'Ur',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );

    Offset position111 =
        Offset(size.width * 9.5 / 12, (size.height * 2 / 8) + 0);
    painter.layout();
    painter.paint(canvas, position111);
//**********************-12
    painter.text = TextSpan(
      text: 'Ra',
      style: TextStyle(
        color: Colors.cyanAccent,
        fontSize: 18.0,
      ),
    );

    Offset position112 =
        Offset(size.width * 7.5 / 12, (size.height * 1 / 8) + 5);
    painter.layout();
    painter.paint(canvas, position112);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
