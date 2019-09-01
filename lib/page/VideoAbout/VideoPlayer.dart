import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';





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

  var reminedtime;
  String image;
  String time;
  IconData play=Icons.pause;

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
    controller.setLooping(true);
  }

   _resumeProgressTimer() async{

    _progressTimer = await Timer.periodic(Duration(seconds: 1), (Timer timer) {

      setState(() {
        savevlue+=1;
        value= ((savevlue*100)/reminedtime)/100;
        if (value >= 1) {
          _progressTimer.cancel();
          play=Icons.play_arrow;
          value=0.0;
          savevlue=0.0;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return loaded? Container(
           height: 300,
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


            ],
          ),
      ):
          Center(child:  Container(
            height: 50,
            child:  CircularProgressIndicator(),),);

  }

}
