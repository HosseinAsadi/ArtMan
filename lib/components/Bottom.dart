import 'package:flutter/material.dart';
class Bottom extends StatefulWidget {
  String text,goal;
  double height;
 double margintop;
  double marginleft;
 double marginright;
 Color startcolor;
 Color endcolor;
 double width;
  Bottom(this.goal, this.text , this.height,this.margintop,
      {this.marginleft,this.marginright,this.startcolor,this.endcolor,this.width});
  @override
  myBottom createState() {
    // TODO: implement createState
    return myBottom(goal, text ,  height,margintop,marginright:marginright,marginleft:marginleft ,startcolor:startcolor ,endcolor:endcolor ,width: width);
  }
}
class myBottom extends State<Bottom> {
  String cityvalue = null,goal;
  String text;
  double height;
  double margintop;
  double marginleft;
  double marginright;
  Color startcolor;
  Color endcolor;
  double width;

  myBottom( this.goal,this.text , this.height,this.margintop,
      {this.marginleft,this.marginright,this.startcolor,this.endcolor,this.width});

  @override
  Widget build(BuildContext context) {
    var right=0.0;
    var left=0.0;
    if(marginright!=null){
      right=marginright;
    }
    if(marginleft!=null){
      left=marginleft;
    }
    return Container(
      alignment: Alignment(0, 0),
      width: width,

      margin: EdgeInsets.only(top: margintop,left: left,right: right),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors:[ startcolor,endcolor] )),
      child: InkWell(
        child:  Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        onTap: (){
          Navigator.pushNamed(context, goal);
        },
      )

    );
  }
}




