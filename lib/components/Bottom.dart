import 'package:flutter/material.dart';
/*class DropDown extends StatefulWidget {
  String text;
  double height;
 double margintop;
  double marginleft;
 double marginright;
 Color startcolor;
 Color endcolor;
 double width;
  DropDown( this.text , this.height,this.margintop,
      {this.marginleft,this.marginright,this.startcolor,this.endcolor,this.width});
  @override
  myDropDown createState() {
    // TODO: implement createState
    return myDropDown( text ,  height,margintop,{marginleft,marginright,startcolor,endcolor,width});
  }
}
class myDropDown extends State<DropDown> {
  String cityvalue = null;
  String text;
  double height;
  double margintop;
  double marginleft;
  double marginright;
  Color startcolor;
  Color endcolor;
  double width;

  myDropDown( this.text , this.height,this.margintop, Set<Object> set,
      {this.marginleft,this.marginright,this.startcolor,this.endcolor,this.width});

  @override
  Widget build(BuildContext context) {

  }
}*/

class Bottom {
   get(String text , double height,margintop,{marginleft,marginright,startcolor,endcolor,width}) {
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
              colors:[startcolor,endcolor] )),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}


