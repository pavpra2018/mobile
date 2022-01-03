import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/rectangle_paint_page.dart';
import 'widget/tabber_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'AstroMNC 360';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.black),
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: MyApp.title,
        tabs: [
          Tab(icon: Icon(Icons.crop_landscape), text: 'Your Chart'),
        ],
        children: [
          RectanglePaintPage(),
        ],
      );
}
