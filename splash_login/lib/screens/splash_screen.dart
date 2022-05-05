import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initScreen();
  }

  Widget initScreen() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffEEB72F),
              gradient: LinearGradient(
                colors: [
                  Color(0xffEEB72F),
                  Color(0xffF7C14F),
                  Color(0xffA57227)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.only(top: 50, left: 40, right: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('images/logo.png'),
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 50, bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultTextStyle(
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Welcome to',
                            textAlign: TextAlign.center,
                            speed: const Duration(milliseconds: 75),
                            curve: Curves.easeInOutCirc),
                      ],
                      totalRepeatCount: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  DefaultTextStyle(
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('AstroMNC360',
                            textAlign: TextAlign.center,
                            speed: const Duration(milliseconds: 75),
                            curve: Curves.easeInOutCirc),
                      ],
                      totalRepeatCount: 2,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
