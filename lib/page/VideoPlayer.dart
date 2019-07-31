import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;


  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      'assets/images/normal.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
 bool isshow=true;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body:GestureDetector(child:  Stack(
        children: <Widget>[
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child:isshow? Container(
                child: Column(
                  children: <Widget>[
                    LinearPercentIndicator(
                      width: 620.0,
                      lineHeight: 4.0,
                      percent: 0.5,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                    Container(
                      height: 40,
                      color: Colors.black.withOpacity(0.5),

                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: _controller.value.volume == 0
                                  ? Icon(Icons.volume_off,color: Colors.white,)
                                  : Icon(Icons.volume_up,color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  if (_controller.value.volume == 0) {
                                    _controller.setVolume(100);
                                  } else {
                                    _controller.setVolume(0);
                                  }
                                });
                              }),
                          IconButton(
                            icon: Icon(Icons.skip_previous,color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                              icon: _controller.value.isPlaying
                                  ? Icon(Icons.pause,color: Colors.white)
                                  : Icon(
                                Icons.play_arrow,color: Colors.white
                              ),
                              onPressed: () {
                              //  VideoDetail()._flutterFFmpeg;
                                setState(() {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                });
                              }),
                          IconButton(icon: Icon(Icons.skip_next,color: Colors.white), onPressed: () {}),

                         // Text(_controller.value.size),
                        ],
                      ),
                    ),
                  ],
                )):Container(height: 3,),
          )
        ],
      ),onTap: (){
        setState(() {
          isshow=!isshow;
        });
      },),
    );
  }

}
/*class VideoDetail {
 // final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
  VideoDetail() {
    _flutterFFmpeg
        .getMediaInformation("<file path or uri>")
        .then((info) => print(info));
  }
}*/
