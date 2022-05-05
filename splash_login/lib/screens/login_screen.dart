import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:splash_login/screens/main_screen.dart';
import 'package:splash_login/model/member.dart';
import '../gene/colors.dart' as custcolor;

final _firestore = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final membershipID = TextEditingController();
  bool _isValidMember = false;
  bool showSpinner = false;
  bool visibilityTag = false;
  String? membID;
  String? errorMessage;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  initState() {
    //startTimer();
    super.initState();
    getMember();
    debugPrint(membID);
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, mainnewRoute);
  }

  getMember() async {
    final SharedPreferences prefs = await _prefs;
    membID = prefs.getString('membID');
    if (membID != null) {
      membershipID.text = membID as String;
    }
    debugPrint(membID);
  }

  mainnewRoute() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(membData: getmemData()),
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

  mainRoute(Member membData) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(
          membData: membData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loginWidget();
  }

  Widget _loginWidget() {
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
            showSpinner
                ? SpinKitRotatingCircle(
                    color: custcolor.AppColor.pageTextBlack,
                    size: 50.0,
                  )
                : SizedBox(
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
                            controller: membershipID,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person,
                                  color: custcolor.AppColor.primaryColor),
                              hintText: 'Enter Your Member Id',
                              errorText: _isValidMember
                                  ? 'Enter your valid membership ID'
                                  : null,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String membID = membershipID.text.trim();
                            if (membID.isEmpty || membID.trim().length != 14) {
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
                              } else {
                                debugPrint("Setting the value ***");
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString('membID', membID);
                                debugPrint("Printing Member Data ***");
                                Member memberData = Member.fromMap(memberSnap);
                                debugPrint(memberData.toString());
                                mainRoute(memberData);
                              }
                              //print(memberSnap);

                            } catch (e) {
                              debugPrint(e.toString());
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          },
                          child: Container(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: custcolor.AppColor.pageTextWhite,
                              ),
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 60),
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
