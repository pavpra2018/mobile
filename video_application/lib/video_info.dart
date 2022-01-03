import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart' as custcolor;
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;

  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
        print(videoInfo.length);
        print(videoInfo);
      });
    });
  }

  @override
  void initState() {
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
    return Scaffold(
      body: Container(
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
                    padding: const EdgeInsets.only(
                      top: 70,
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
                                color: custcolor.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: custcolor.AppColor.secondPageIconColor,
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
                            color: custcolor.AppColor.secondPageTitleColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'and Glutes Workout',
                          style: TextStyle(
                            fontSize: 25,
                            color: custcolor.AppColor.secondPageTitleColor,
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
                                    custcolor.AppColor
                                        .secondPageContainerGradient1stColor,
                                    custcolor.AppColor
                                        .secondPageContainerGradient2ndColor,
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
                                    color:
                                        custcolor.AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '68 min',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: custcolor
                                          .AppColor.secondPageIconColor,
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
                                    custcolor.AppColor
                                        .secondPageContainerGradient1stColor,
                                    custcolor.AppColor
                                        .secondPageContainerGradient2ndColor,
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
                                    color:
                                        custcolor.AppColor.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Resistant Band, Kettebell',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: custcolor
                                          .AppColor.secondPageIconColor,
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
                                  color: custcolor.AppColor.secondPageIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color:
                                    custcolor.AppColor.secondPageTopIconColor,
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
                      height: 30,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Circuit 1: Legs Toning',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: custcolor.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: custcolor.AppColor.loopColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '3 Sets',
                              style: TextStyle(
                                fontSize: 15,
                                color: custcolor.AppColor.setsColor,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
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
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? '0$value' : '$value';
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

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
                  } else {
                    Get.snackbar(
                      'Video',
                      'No more video to Play',
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: custcolor.AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text(
                        'No more video to Play',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: Colors.white,
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
                  } else {
                    Get.snackbar(
                      'Video',
                      'No more video to Play',
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: custcolor.AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text(
                        'No more video to Play',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
                child: const Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Text(
                '$mins:$secs',
                style: const TextStyle(color: Colors.white, shadows: [
                  Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0))
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
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

  Duration? _duration;
  Duration? _position;
  var _onUpdateControllerTime;
  var _progress;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }

    final controller = _controller;

    if (controller == null) {
      print('Controller is null');
      return;
    } else if (!controller.value.isInitialized) {
      print('Controller can not be initialized');
      return;
    }
    _onUpdateControllerTime = 0;

    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    _duration ??= _controller?.value.duration;
    var duartion = _duration;
    if (duartion == null) {
      return;
    }
    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) {
        return;
      }

      setState(() {
        if (position?.inMilliseconds != null) {
          var tmpValue = position!.inMilliseconds;
          _progress =
              tmpValue.ceilToDouble() / duartion.inMilliseconds.ceilToDouble();
        }
      });
    }

    _isPlaying = playing;
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
    controller
      ..initialize().then((_) {
        old?.pause();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _listView() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: videoInfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              print(index.toString());
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
      height: 135,
      width: 200,
      child: Column(
        children: [
          Row(
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
              const SizedBox(
                width: 10,
              ),
              Column(
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
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]['time'],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    '15s rest',
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (var i = 0; i < 70; i++)
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
}




// SliderTheme(
//           data: SliderTheme.of(context).copyWith(
//               activeTrackColor: Colors.red[700],
//               inactiveTrackColor: Colors.red[100],
//               trackShape: const RoundedRectSliderTrackShape(),
//               trackHeight: 2.0,
//               thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
//               thumbColor: Colors.redAccent,
//               overlayColor: Colors.red.withAlpha(32),
//               overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
//               tickMarkShape: const RoundSliderTickMarkShape(),
//               activeTickMarkColor: Colors.red[700],
//               inactiveTickMarkColor: Colors.red[100],
//               valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
//               valueIndicatorTextStyle: const TextStyle(color: Colors.white)),
//           child: Slider(
//             value: max(0, min(_progress == null ? 0 : _progress * 100, 100)),
//             min: 0,
//             max: 100,
//             divisions: 100,
//             label: _position?.toString().split('.')[0],
//             onChanged: (value) {
//               setState(() {
//                 _progress = value * 0.01;
//               });
//             },
//             onChangeStart: (value) {
//               _controller?.pause();
//             },
//             onChangeEnd: (value) {
//               final duartion = _controller?.value.duration;
//               if (duration != null) {
//                 var newValue = max(0, min(value, 99)) * 0.01;
//                 if (duartion?.inMilliseconds != null) {
//                   var tmpmil = duartion?.inMilliseconds;
//                   var millis = (tmpmil! * newValue).toInt();
//                   _controller?.seekTo(
//                     Duration(milliseconds: millis),
//                   );
//                   _controller?.play();
//                 }
//               }
//             },
//           ),
//         ),
        