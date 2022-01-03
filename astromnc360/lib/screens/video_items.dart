import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  const VideoItems({
    required this.videoPlayerController,
    required this.looping,
    required this.autoplay,
    Key? key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        autoInitialize: true,
        looping: widget.looping,
        autoPlay: widget.autoplay,
        aspectRatio: 3 / 2,
        showControls: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });

    super.initState();
  }

  @override
  void dispose() {
    print("Inside dispose.. method");
    print(widget.videoPlayerController);
    widget.videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          Center(
            child: Container(
                padding: const EdgeInsets.all(8),
                child: AspectRatio(
                  aspectRatio: widget.videoPlayerController.value.aspectRatio,
                  child: Chewie(controller: chewieController),
                )),
          ),
        ],
      ),
    );
  }
}
