import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:splash_login/model/dashboard.dart';
import 'package:splash_login/model/member.dart';
import 'package:splash_login/services/astromnc_service.dart';
import 'package:video_player/video_player.dart';

import '../gene/colors.dart' as custcolor;
import 'det_post_art_screen.dart';

class HomeScreen extends StatefulWidget {
  final Member membData;
  const HomeScreen({Key? key, required this.membData}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _playArea = false;
  List _videoInfo = [];
  List info = [];
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  String _videoTitle = "";
  String _selectedDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  DashScore? dashScore;

  VideoPlayerController? _controller;

  _initVideo() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        _videoInfo = json.decode(value);
      });
    });
  }

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/info.json')
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: custcolor.AppColor.primaryColor,
                onPrimary: Colors.white,
                surface: custcolor.AppColor.primaryColor,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        }).then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
      });
    });
  }

  @override
  void initState() {
    _initVideo();
    _initData();
    _disposed = true;
    _controller = null;
    super.initState();
    debugPrint("Inside the init state");
    print(dashScore);
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: !_playArea
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  custcolor.AppColor.gradientFirst.withOpacity(1),
                  custcolor.AppColor.gradientSecond
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              ),
            )
          : BoxDecoration(
              color: custcolor.AppColor.gradientSecond,
            ),
      child: Column(
        children: [
          !_playArea
              ? _buildDash(context)
              : Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.09,
                          left: 30,
                          right: 30,
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _videoTitle,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: custcolor.AppColor.pageTextWhite),
                              ),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _playArea = !_playArea;
                                  _disposed = true;
                                  _controller?.pause();
                                  _controller?.dispose();
                                  _controller = null;
                                });
                              },
                              child: Icon(
                                Icons.home,
                                size: 20,
                                color: custcolor.AppColor.iconHome,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _playView(context),
                      _controlView(context),
                    ],
                  ),
                ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: custcolor.AppColor.pageTextWhite,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(70),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: _listView(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDash(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([_getDashData()]),
      builder: (BuildContext context, AsyncSnapshot memberSnap) {
        Widget child;

        if (memberSnap.hasData) {
          debugPrint(memberSnap.data[0].toString());
          DashScore dashscore = memberSnap.data[0];
          debugPrint(dashscore.dashList[8].chanGuru.toString());

          child = Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.09,
              left: 30,
              right: 30,
              bottom: 10,
            ),
            width: MediaQuery.of(context).size.width,
            height: 275,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${widget.membData.memName}: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: custcolor.AppColor.pageTextWhite),
                              ),
                              TextSpan(
                                text: _selectedDate.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: custcolor.AppColor.pageTextWhite),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _presentDatePicker();
                          },
                          child: CircleAvatar(
                            radius: 15.0,
                            child: Icon(
                              Icons.date_range,
                              color: custcolor.AppColor.pageTextBlack,
                            ),
                            backgroundColor: custcolor.AppColor.primaryColor
                                .withOpacity(0.5),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Transit Dahsboard Scores- ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              custcolor.AppColor.pageTextBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            'Chandra: ${dashscore.dashList[8].chanGuru.toString()}',
                            style: TextStyle(
                                fontSize: 18,
                                color: custcolor.AppColor.pageTextWhite),
                          )),
                          TableCell(
                            child: Text(
                              'Lagna: ${dashscore.dashList[8].lagShani.toString()}',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: custcolor.AppColor.pageTextWhite),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            'Avg Score: ${((dashscore.dashList[8].chanGuru + dashscore.dashList[8].lagShani) / 2).toString()}',
                            style: TextStyle(
                                fontSize: 18,
                                color: custcolor.AppColor.pageTextWhite),
                          )),
                          TableCell(
                            child: Text(
                              '',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: custcolor.AppColor.pageTextWhite),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Happiness Index Scores- ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              custcolor.AppColor.pageTextBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            'Guru: ${dashscore.happyList[10].chanGuru.toString()}',
                            style: TextStyle(
                                fontSize: 18,
                                color: custcolor.AppColor.pageTextWhite),
                          )),
                          TableCell(
                            child: Text(
                              'Shani: ${dashscore.happyList[10].lagShani.toString()}',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: custcolor.AppColor.pageTextWhite),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => DetPostArtScreen(
                                  descr: "123",
                                  title: "All good",
                                ));
                          },
                          child: const Text('Tap to Read More...'),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          child = Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.09,
              left: 30,
              right: 30,
              bottom: 10,
            ),
            width: MediaQuery.of(context).size.width,
            height: 275,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Preparing....',
                  style: TextStyle(
                    fontSize: 20,
                    color: custcolor.AppColor.pageTextWhite,
                  ),
                )
              ],
            ),
          );
        }
        return child;
      },
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(controller),
          ),
          VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              backgroundColor: custcolor.AppColor.gradientFirst,
              bufferedColor: custcolor.AppColor.pageTextWhite,
              playedColor: custcolor.AppColor.gradientThird,
            ),
          ),
        ],
      );
    }
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Center(
        child: Text(
          'Preparing....',
          style: TextStyle(
            fontSize: 20,
            color: custcolor.AppColor.pageTextWhite,
          ),
        ),
      ),
    );
  }

  Future<DashScore> _getDashData() async {
    AstromncService astromncService = AstromncService();

    dashScore = await astromncService.getDashData(
        _selectedDate, widget.membData.memID!);

    return dashScore!;
  }

  _listView() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: _videoInfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              setState(() {
                if (!_playArea) {
                  _playArea = !_playArea;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(_videoInfo[index]['thumbnail']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    margin: const EdgeInsets.only(
                      left: 23,
                      top: 23,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: custcolor.AppColor.pageTextWhite.withOpacity(0.7),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_arrow,
                      size: 32,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _videoInfo[index]['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        _videoInfo[index]['time'],
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        _videoInfo[index]['time'],
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Row(
                children: [
                  for (var i = 0;
                      i < MediaQuery.of(context).size.width - 320;
                      i++)
                    Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                        color: i.isEven
                            ? const Color(0xFF839fed)
                            : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          //margin: const EdgeInsets.only(bottom: 5),
          width: MediaQuery.of(context).size.width,
          color: custcolor.AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0))
                    ]),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: custcolor.AppColor.pageTextWhite,
                    ),
                  ),
                ),
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
              ),
              TextButton(
                onPressed: () {
                  final index = _isPlayingIndex - 1;

                  if (index >= 0 && _videoInfo.isNotEmpty) {
                    _onTapVideo(index);
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: (_isPlayingIndex - 1) >= 0
                      ? custcolor.AppColor.pageTextWhite
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(
                  !_isPlaying ? Icons.play_arrow : Icons.pause,
                  size: 36,
                  color: custcolor.AppColor.pageTextWhite,
                ),
              ),
              TextButton(
                onPressed: () {
                  final index = _isPlayingIndex + 1;
                  if (index <= (_videoInfo.length - 1)) {
                    _onTapVideo(index);
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: (_isPlayingIndex + 1) <= (_videoInfo.length - 1)
                      ? custcolor.AppColor.pageTextWhite
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }

    final controller = _controller;

    if (controller == null) {
      return;
    } else if (!controller.value.isInitialized) {
      return;
    }
  }

  _onTapVideo(int index) {
    final controller = VideoPlayerController.asset(
      _videoInfo[index]['videoUrl'],
    );
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {
      _videoTitle = _videoInfo[index]['title'];
      _isPlaying = true;
    });
    controller.initialize().then((_) {
      old?.pause();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }
}
