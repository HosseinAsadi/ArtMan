import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seekbar/seekbar.dart';
class TestSeekBarPage extends StatefulWidget {
  int duration;

  TestSeekBarPage(this.duration);

  @override
  _TestSeekBarPageState createState() {
    return _TestSeekBarPageState(duration);
  }
}

class _TestSeekBarPageState extends State<TestSeekBarPage> {
  int duration;

  _TestSeekBarPageState(this.duration);
   double value = 0.0;
  Timer _progressTimer;

  bool _done = false;

  @override
  void initState() {
    _resumeProgressTimer();
    super.initState();
  }

  _resumeProgressTimer() {
    _progressTimer = Timer.periodic( Duration(milliseconds: duration), (_) {
      setState(() {
        value += 10.0;
        if (value >= duration) {
          _progressTimer.cancel();
          _done = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   SeekBar(
          value: value,
          progressColor: Colors.blue,

          onStartTrackingTouch: () {

            if (!_done) {
              _progressTimer?.cancel();
            }
          },
          
          onProgressChanged: (value) {
               
            value = value;
          },
          onStopTrackingTouch: () {

            if (!_done) {
              _resumeProgressTimer();
            }
          },


    );
  }
}