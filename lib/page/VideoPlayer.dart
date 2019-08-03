import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seekbar/seekbar.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:screen/screen.dart';

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
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController controller;
  int possition;
  bool isshow = true;
  var reminedtime;
  String time;
  double value = 0.0,savevlue=0.0;
  Timer _progressTimer;
  bool _done = false;

  Future gettime() async {
    time = await controller.value.duration.toString().split(".").first;
    reminedtime = await controller.value.duration.inSeconds;
  }

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/images/aaa.mp4')
      ..initialize().then((_) {
        gettime();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    controller.setLooping(true);
  }

  Future _resumeProgressTimer() async{

    _progressTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {

      setState(() {
        savevlue+=1;
        value= ((savevlue*100)/reminedtime)/100;
        if (value >= 1) {
          _progressTimer.cancel();
          _done = true;
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    Screen.keepOn(true);

    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),

                    )
                  : Container(
                      color: Colors.white,
                      child: CircularProgressIndicator(),
                    ),

              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: isshow
                    ? Container(
                        child: Column(
                        children: <Widget>[
                          SeekBar(
                            value: value,
                            progressColor: Colors.blue,

                            onProgressChanged: (valuee) {
                              value = valuee;
                              int x=(((valuee*1000)* (reminedtime))/1000).toInt();
                              savevlue=x.toDouble();
                              controller.seekTo(Duration(seconds:x));


                            },

                          ),
                          Container(
                            height: 40,
                            color: Colors.black.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                          icon: controller.value.volume == 0
                                              ? Icon(
                                                  Icons.volume_off,
                                                  color: Colors.white,
                                                )
                                              : Icon(Icons.volume_up,
                                                  color: Colors.white),
                                          onPressed: () {
                                            setState(() {
                                              if (controller.value.volume ==
                                                  0) {
                                                controller.setVolume(100);
                                              } else {
                                                controller.setVolume(0);
                                              }
                                            });
                                          }),
                                      IconButton(
                                        icon: Icon(Icons.skip_previous,
                                            color: Colors.white),
                                        onPressed: () {
                                          controller.seekTo(Duration(seconds: (savevlue.toInt()-5)));
                                        },
                                      ),

                                      IconButton(
                                          icon: controller.value.isPlaying
                                              ? Icon(Icons.pause,
                                                  color: Colors.white)
                                              : Icon(Icons.play_arrow,
                                                  color: Colors.white),
                                          onPressed: () {
                                            setState(() {
                                              if (controller.value.isPlaying) {
                                                controller.pause();
                                                savevlue=value;
                                                _progressTimer?.cancel();
                                              } else {
                                                controller.play();
                                                _resumeProgressTimer();

                                              }
                                            });
                                          }),
                                      IconButton(
                                          icon: Icon(Icons.skip_next,
                                              color: Colors.white),
                                          onPressed: () {
                                            controller.seekTo(Duration(seconds: (savevlue.toInt()+30)));
                                          }),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "${hoursFormat()} ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "/",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        time,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                    : Container(),
              )
            ],
          ),
          onTap: () {
            setState(() {
              isshow = !isshow;
            });
          },
        ),
      ),
    );
  }
  hoursFormat(){
    int second,minut,hours;
    String rslt="";
      second = (savevlue.toInt() % 60);
      minut = (savevlue / 60).toInt();
      hours=(savevlue / 3600).toInt();

      if(hours<10){
        rslt+="0"+hours.toString();
      }
      else{
        rslt+=hours.toString();

      }
      rslt+=":";
    if(minut<10){
      rslt+="0"+minut.toString();
    }
    else{
      rslt+=minut.toString();

    }
    rslt+=":";
    if(second<10){
      rslt+="0"+second.toString();
    }
    else{
      rslt+=second.toString();

    }
    return rslt;
  }
}
