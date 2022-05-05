import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:astromnc360/components/rounded_button.dart';
import 'package:astromnc360/components/visible.dart';
import 'package:astromnc360/constants.dart';
import 'package:astromnc360/model/member.dart';
import 'package:astromnc360/screens/home_screen.dart';

final _firestore = FirebaseFirestore.instance;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = "welcome_screen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  final membershipNO = TextEditingController();
  bool _isValidMember = false;
  bool showSpinner = false;
  bool visibilityTag = false;
  String? errorMessage;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Visible(
                  showSpinner: showSpinner,
                  colors: const Color(0xFFf6941d),
                ),
                Visible(
                  showSpinner: !showSpinner,
                  colors: Colors.white,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: SizedBox(
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            "images/logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    DefaultTextStyle(
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFf6941d),
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
                          color: Color(0xFFf6941d),
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
                        onFinished: () {
                          setState(() {
                            visibilityTag = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    !visibilityTag
                        ? Container()
                        : TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                              if (errorMessage != null) {
                                if (value.trim().length == 14) {
                                  setState(() {
                                    errorMessage = null;
                                    _isValidMember = false;
                                  });
                                }
                              }
                            },
                            controller: membershipNO,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter Your Membership ID',
                                errorText: _isValidMember
                                    ? 'Enter your valid membership ID'
                                    : null),
                          ),
                    _isValidMember
                        ? const SizedBox(height: 24)
                        : const SizedBox(height: 46),
                    !visibilityTag
                        ? Container()
                        : RoundedButton(
                            color: Colors.lightBlueAccent,
                            title: 'Log in',
                            onPressed: () async {
                              String membID = membershipNO.text.trim();
                              if (membID.isEmpty ||
                                  membID.trim().length != 14) {
                                setState(() {
                                  errorMessage = "Enter valid member ID";
                                  _isValidMember = true;
                                  return;
                                });
                              }
                              setState(() {
                                showSpinner = true;
                              });

                              try {
                                final memberSnapShot = await _firestore
                                    .collection("memberships")
                                    .doc(membID)
                                    .get();
                                final Map<String, dynamic>? memberSnap =
                                    memberSnapShot.data();

                                if (memberSnap == null) {
                                  setState(() {
                                    errorMessage = "Enter valid member ID";
                                    showSpinner = false;
                                    _isValidMember = true;
                                    return;
                                  });
                                }
                                print("Member Data***");
                                //print(memberSnap);

                                debugPrint(memberSnap.toString(),
                                    wrapWidth: 1024);
                                Member memberData = Member.fromMap(memberSnap!);
                                print("member detaild data");
                                debugPrint(memberData.toString());
                                Navigator.pushNamed(
                                  context,
                                  HomeScreen.id,
                                  arguments: memberData,
                                );
                              } catch (e) {
                                print(e);
                                setState(() {
                                  showSpinner = false;
                                });
                              }
                            },
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
