import 'dart:async';
import 'package:flutter/material.dart';

import 'package:splash_login/main_screen.dart';
import 'gene/colors.dart' as custcolor;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, mainRoute);
  }

  mainRoute() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loginWidget();
  }

  Widget loginWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(90),
                ),
                color: custcolor.AppColor.primaryColor,
                gradient: LinearGradient(
                  colors: [
                    custcolor.AppColor.gradientFirst,
                    custcolor.AppColor.gradientSecond,
                    custcolor.AppColor.gradientThird
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Image.asset('images/logo.png'),
                      height: 120,
                      width: 120,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(
                        right: 20,
                        top: 20,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: custcolor.AppColor.pageTextWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 425,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xFFEEEEEE))
                        ]),
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.person,
                            color: custcolor.AppColor.primaryColor),
                        hintText: 'Enter Your Member Id',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 60),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              custcolor.AppColor.gradientFirst,
                              custcolor.AppColor.gradientSecond,
                              custcolor.AppColor.gradientThird
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xFFEEEEEE))
                          ]),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
