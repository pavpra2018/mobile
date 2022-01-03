import 'package:flutter/material.dart';
import 'package:splash_login/splash_screen.dart';

void main() {
  runApp(const AstroMNCApp());
}

class AstroMNCApp extends StatelessWidget {
  const AstroMNCApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowMaterialGrid: false,
      home: SplashScreen(),
    );
  }
}
