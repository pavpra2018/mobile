import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../gene/colors.dart' as custcolor;

// ignore: must_be_immutable
class DetPostArtScreen extends StatelessWidget {
  late String descr;
  late String title;
  DetPostArtScreen({Key? key, required this.descr, required this.title})
      : super(key: key);
  final htmlData = """<div>
        <h1>Demo Page</h1>
        <p>This is a fantastic product that you should buy!</p>
        <h3>Features</h3>
        <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
            <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
        <!--You can pretty much put any html in here!-->
      </div>""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custcolor.AppColor.primaryColor,
        shadowColor: custcolor.AppColor.gradientSecond,
        title: const Text('All is goog All is goog All is goog All is goog'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: custcolor.AppColor.pageTextWhite,
                    child: Html(
                      data: this.descr,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
