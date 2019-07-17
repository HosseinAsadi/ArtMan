import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Sender.dart';

class Button extends StatefulWidget {
  String text, goal;
  double height;
  double margintop;
  double marginleft;
  double marginright;
  Color startcolor;
  Color endcolor;
  double width;
  List<String> input;
  GlobalKey<FormState> _key;
  setkey(GlobalKey<FormState> _key) {
    this._key = _key;
  }

  Button(this.input, this.goal, this.text, this.height, this.margintop,
      {this.marginleft,
      this.marginright,
      this.startcolor,
      this.endcolor,
      this.width});

  @override
  myBottom createState() {
    // TODO: implement createState
    return myBottom(input, _key, goal, text, height, margintop,
        marginright: marginright,
        marginleft: marginleft,
        startcolor: startcolor,
        endcolor: endcolor,
        width: width);
  }
}

class myBottom extends State<Button> {
  String cityvalue = null, goal;
  String text;
  double height;
  double margintop;
  double marginleft;
  double marginright;
  Color startcolor;
  Color endcolor;
  double width;
  List<String> input;

  GlobalKey<FormState> _key;

  myBottom(
      this.input, this._key, this.goal, this.text, this.height, this.margintop,
      {this.marginleft,
      this.marginright,
      this.startcolor,
      this.endcolor,
      this.width});

  @override
  @override
  Widget build(BuildContext context) {
    var right = 0.0;
    var left = 0.0;
    if (marginright != null) {
      right = marginright;
    }
    if (marginleft != null) {
      left = marginleft;
    }

    return Container(
      alignment: Alignment(0, 0),
      width: width,
      height: height,

      margin: EdgeInsets.only(top: margintop, left: left, right: right),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [startcolor, endcolor])),


        child: GestureDetector(
          onTapDown: (tapDetails) {
            setState(() {
              width=width-2;
              --height;
              startcolor=Colors.green[900];
              endcolor=Colors.green[800];
            });
          },
          onTapUp: (TapUpDetails) {
            setState(() {
              startcolor = Color(0xFF5AE100);
              endcolor = Color(0xFF0F8F00);
              width=width+2;
              ++height;
            });
          },
          onTap:  () {
            Navigator.pushReplacementNamed(context, goal);
          },
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),


        ),

    );
  }
}
