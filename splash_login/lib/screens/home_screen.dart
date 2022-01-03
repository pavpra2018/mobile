import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../gene/colors.dart' as custcolor;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _playArea = false;
  List videoInfo = [];
  List info = [];
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initVideo() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
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

  @override
  void initState() {
    _initVideo();
    _initData();
    super.initState();
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
                  custcolor.AppColor.gradientFirst.withOpacity(0.8),
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
              ? Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: 30,
                    right: 30,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: custcolor.AppColor.iconHome,
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.info_outline,
                            size: 20,
                            color: custcolor.AppColor.iconHome,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Legs Toning',
                        style: TextStyle(
                          fontSize: 25,
                          color: custcolor.AppColor.pageTitle,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'and Glutes Workout',
                        style: TextStyle(
                          fontSize: 25,
                          color: custcolor.AppColor.pageTitle,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  custcolor.AppColor.gradientFirst,
                                  custcolor.AppColor.gradientSecond,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color: custcolor.AppColor.iconHome,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '68 min',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: custcolor.AppColor.iconHome,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 220,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  custcolor.AppColor.gradientFirst,
                                  custcolor.AppColor.gradientSecond,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.handyman_outlined,
                                  size: 20,
                                  color: custcolor.AppColor.iconHome,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Resistant Band, Kettebell',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: custcolor.AppColor.iconHome,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )
              : Container(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        padding: const EdgeInsets.only(
                          top: 50,
                          left: 30,
                          right: 30,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: custcolor.AppColor.iconHome,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: custcolor.AppColor.iconHome,
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
    return const AspectRatio(
      aspectRatio: 16 / 9,
      child: Center(
        child: Text(
          'Preparing....',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white60,
          ),
        ),
      ),
    );
  }

  _listView() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: videoInfo.length,
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
                        image: AssetImage(videoInfo[index]['thumbnail']),
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
                      color: Colors.white.withOpacity(0.7),
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
                      videoInfo[index]['title'],
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
                        videoInfo[index]['time'],
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        videoInfo[index]['time'],
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
                      color: Colors.white,
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

                  if (index >= 0 && videoInfo.isNotEmpty) {
                    _onTapVideo(index);
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: (_isPlayingIndex - 1) >= 0
                      ? Colors.white
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
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  final index = _isPlayingIndex + 1;
                  if (index <= (videoInfo.length - 1)) {
                    _onTapVideo(index);
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: (_isPlayingIndex + 1) <= (videoInfo.length - 1)
                      ? Colors.white
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
      videoInfo[index]['videoUrl'],
    );
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller.initialize().then((_) {
      old?.pause();
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }
}
