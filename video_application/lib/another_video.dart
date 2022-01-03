import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; //add pacakge to pubspec.yaml

List<String> videos = [
  'images/song_video.mp4',
  'images/general_video.mp4',
  'images/common_video.mp4'
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListView of VideoFeed'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            VideoPlayerRemote(
              url: videos[0],
            ),
            VideoPlayerRemote(
              url: videos[1],
            ),
            VideoPlayerRemote(
              url: videos[2],
            ),
          ],
        ),
      ),
    );
  }
}

//video code

class VideoPlayerRemote extends StatefulWidget {
  final String url;
  VideoPlayerRemote({required this.url});
  @override
  _VideoPlayerRemoteState createState() => _VideoPlayerRemoteState();
}

class _VideoPlayerRemoteState extends State<VideoPlayerRemote> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.url, //to access its parent class constructor or variable
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true); //loop through video
    _controller.initialize(); //initialize the VideoPlayer
  }

  @override
  void dispose() {
    _controller.dispose(); //dispose the VideoPlayer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _PlayPauseOverlay(
                    controller: _controller,
                  ),
                  VideoProgressIndicator(_controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                          backgroundColor: Colors.red,
                          bufferedColor: Colors.black,
                          playedColor: Colors.blueAccent)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.play();
          },
        ),
      ],
    );
  }
}
