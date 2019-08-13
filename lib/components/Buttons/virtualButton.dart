
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VirtualBotton extends StatefulWidget {
  String text;
  double height;
  double margintop;
  double marginbottom;
  double marginleft;
  double marginright;
  Color startcolor;
  Color endcolor,textcolor;
  double width;
  FontWeight fontWeight;
  double textsize;
  String snackbartext;




  VirtualBotton(this.snackbartext,  this.text, this.height, this.margintop,
      {this.marginleft,
        this.marginright,
        this.marginbottom,
        this.startcolor,
        this.endcolor,
        this.textcolor,
        this.width,
        this.fontWeight,
        this.textsize,

  });

  @override
  myButtom createState() {
    // TODO: implement createState
    return myButtom(  text, height, margintop,
        marginright: marginright,
        marginleft: marginleft,
        marginbottom: marginbottom,
        startcolor: startcolor,
        endcolor: endcolor,
        width: width,
        textcolor: textcolor,
        fontWeight: fontWeight,
        textsize: textsize,
        snackbartext: snackbartext
        );
  }
}

class myButtom extends State<VirtualBotton> {

  String text;
  double height;
  double margintop;
  double marginleft,marginbottom;
  double marginright;
  Color startcolor;
  Color endcolor,textcolor;
  double width;
  FontWeight fontWeight;
  double textsize;
  String snackbartext;

  myButtom(
       this.text, this.height, this.margintop,
      {this.marginleft,
        this.marginright,
        this.marginbottom,
        this.startcolor,
        this.endcolor,
        this.textcolor,
        this.width,
        this.textsize,
        this.fontWeight,
        this.snackbartext
   });
  @override
  Widget build(BuildContext context) {
    var right = 0.0;
    var left = 0.0;
    var bottom = 0.0;
    if (marginright != null) {
      right = marginright;
    }
    if (marginleft != null) {
      left = marginleft;
    }
    if (marginbottom != null) {
      bottom = marginbottom;
    }


    return Container(
      alignment: Alignment(0, 0),
      width: width,
      height: height,
      margin: EdgeInsets.only(top: margintop, left: left, right: right,bottom: bottom),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [startcolor==null?Color(0xFF5AE100):startcolor, endcolor==null?Color(0xFF0F8F00):endcolor])),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: textcolor==null?Colors.white:textcolor,
            fontWeight: fontWeight==null?FontWeight.normal:fontWeight ,
            fontSize: textsize==null?16:textsize),
      ),
    );
  }
}
