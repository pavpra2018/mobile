import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_application/video_info.dart';

import 'colors.dart' as custcolor;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/info.json')
        .then((value) {
      setState(() {
        info = json.decode(value);
        print(info);
      });
    });
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: custcolor.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 30,
                    color: custcolor.AppColor.homePageTitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: custcolor.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: custcolor.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: custcolor.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Your Program',
                  style: TextStyle(
                    fontSize: 20,
                    color: custcolor.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: custcolor.AppColor.homePageDetail,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: custcolor.AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    custcolor.AppColor.gradientFirst.withOpacity(0.8),
                    custcolor.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 10),
                    blurRadius: 20,
                    color: custcolor.AppColor.gradientSecond.withOpacity(0.2),
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 25,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Workout',
                      style: TextStyle(
                        fontSize: 16,
                        color: custcolor.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Legs Toning',
                      style: TextStyle(
                        fontSize: 25,
                        color: custcolor.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'and Glutes Workout',
                      style: TextStyle(
                        fontSize: 25,
                        color: custcolor.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color:
                                  custcolor.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '60 minutes',
                              style: TextStyle(
                                fontSize: 14,
                                color: custcolor
                                    .AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: custcolor.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4, 8),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color:
                                custcolor.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage('images/card.png'),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            offset: const Offset(8, 10),
                            color: custcolor.AppColor.gradientSecond
                                .withOpacity(0.3),
                          ),
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(-1, -5),
                            color: custcolor.AppColor.gradientSecond
                                .withOpacity(0.3),
                          )
                        ]),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      right: 200,
                      bottom: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('images/figure.png'),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: custcolor.AppColor.homePageDetail,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Keep it up\n",
                            style: TextStyle(
                              color: custcolor.AppColor.homePagePlanColor,
                              fontSize: 16,
                            ),
                            children: const [
                              TextSpan(text: 'Stick to your plan'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area of focus',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: custcolor.AppColor.homePageTitle,
                  ),
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    itemCount: info.length.toDouble() ~/ 2,
                    itemBuilder: (_, i) {
                      int a = i * 2 + 0;
                      int b = i * 2 + 1;
                      return Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            height: 170,
                            margin: const EdgeInsets.only(
                                left: 30, bottom: 15, top: 15),
                            padding: const EdgeInsets.only(
                              bottom: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[a]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                  color: custcolor.AppColor.gradientSecond
                                      .withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),
                                  color: custcolor.AppColor.gradientSecond
                                      .withOpacity(0.1),
                                )
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: custcolor.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            height: 170,
                            margin: const EdgeInsets.only(
                              left: 30,
                              bottom: 15,
                              top: 15,
                            ),
                            padding: const EdgeInsets.only(
                              bottom: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[b]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                  color: custcolor.AppColor.gradientSecond
                                      .withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),
                                  color: custcolor.AppColor.gradientSecond
                                      .withOpacity(0.1),
                                )
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: custcolor.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
