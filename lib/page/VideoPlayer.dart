import 'dart:async';
import 'dart:io';
import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/Utility/HoursFormat.dart';
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
  String image;
  String time;

  double value = 0.0,savevlue=0.0;
  Timer _progressTimer;
  bool loaded=false;
  bool _done = false;

   gettime() async {
     setState(() async{
       time = await controller.value.duration.toString().split(".").first;
       reminedtime = await controller.value.duration.inSeconds;
       _resumeProgressTimer();
       controller.play();
       loaded=true;

       /*Thumb thumb=new Thumb();
       image=  thumb.getImage("https://as4.cdn.asset.aparat.com/aparat-video/91317f5fa48477e61040d68a42ed2c1916364187-144p__31501.mp4");
      print(image+"9999999999999999999999999999999999999999999999");*/
     });


   }

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network('https://as4.cdn.asset.aparat.com/aparat-video/91317f5fa48477e61040d68a42ed2c1916364187-720p__31501.mp4')
      ..initialize().then((_) {
        setState(() {
           });
        setState(() {});
        gettime();
      });
   // controller.setLooping(true);
  }

   _resumeProgressTimer() async{

    _progressTimer = await Timer.periodic(Duration(seconds: 1), (Timer timer) {

      setState(() {
        savevlue+=1;
        value= ((savevlue*100)/reminedtime)/100;
        if (value >= 1) {
          _progressTimer.cancel();
          _done = true;
          value=0.0;
          savevlue=0.0;
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
      body:loaded? Center(
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
                                        "${HoursFormat.hoursFormat(savevlue)} ",
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
      ):Center(

          child:Container(width: 50,height: 50,
        child:  CircularProgressIndicator(),)),
    );
  }

}
