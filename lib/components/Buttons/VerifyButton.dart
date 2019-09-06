
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/ListMoves.dart';
import 'package:art_man/components/Utility/Function.dart';
import 'package:art_man/page/lists/ListOfMovesInClassroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyButton extends StatefulWidget {

  String text, goal,snackbarText,functioncode;
  final Fucntionman function;
  bool task=false;
  String numberclass;

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
  GlobalKey<FormState> _key;

  setkey(GlobalKey<FormState> _key) {
    this._key = _key;
  }

  VerifyButton(this.numberclass,this.goal, this.text, this.height, this.margintop,
      {this.marginleft,
        this.marginright,
        this.marginbottom,
        this.startcolor,
        this.endcolor,
        this.textcolor,
        this.width,
        this.fontWeight,
        this.textsize,
        this.task,
        this.function,
        this.snackbarText,
        this.functioncode});

  @override
  myVerifyButton createState() {
    // TODO: implement createState
    return myVerifyButton(numberclass, _key, goal, text, height, margintop,
        marginright: marginright,
        marginleft: marginleft,
        marginbottom: marginbottom,
        startcolor: startcolor,
        endcolor: endcolor,
        width: width,
        textcolor: textcolor,
        fontWeight: fontWeight,
        textsize: textsize,
        task: task,
        function: function,
        snackbarText: snackbarText,
        functioncode: functioncode);
  }
}

class myVerifyButton extends State<VerifyButton> {
  String cityvalue = null, goal,snackbarText,functioncode;
  String text;
 String numberclass;
  bool task=false;
  Fucntionman function;
  double height;
  double margintop;
  double marginleft,marginbottom;
  double marginright;
  Color startcolor;
  Color endcolor,textcolor;
  double width;
  FontWeight fontWeight;
  double textsize;



  GlobalKey<FormState> _key;

  myVerifyButton(
      this.numberclass,this._key, this.goal, this.text, this.height, this.margintop,
      {this.marginleft,
        this.marginright,
        this.marginbottom,
        this.startcolor,
        this.endcolor,
        this.textcolor,
        this.width,
        this.textsize,
        this.fontWeight,
        this.task,
        this.function,
        this.snackbarText,
        this.functioncode});
//MakeList makeList=new MakeList();
  @override
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


    return AnimatedContainer(
      alignment: Alignment(0, 0),
      width: width,
      height: height,
      duration: Duration(microseconds: 50),
      margin: EdgeInsets.only(top: margintop, left: left, right: right,bottom: bottom),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //border: Border.all(color: bordercolor,width: borderwidth),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [startcolor==null?Color(0xFF5AE100):startcolor, endcolor==null?Color(0xFF0F8F00):endcolor])),
      child: GestureDetector(
        onTapDown: (TapDetails) {
          setState(() {
            --width ;
            --height;
            startcolor = Colors.green[900].withOpacity(0.1);
            endcolor = Colors.green[800].withOpacity(0.3);
          });
        },
        onTapUp: (TapUpDetails) {

          setState(() {
            startcolor = Color(0xFF5AE100);
            endcolor = Color(0xFF0F8F00);
            ++width ;
            ++height;
          });
        },
        onTap: () async {

          if(functioncode=="justverify"){
            addUpdateclasses(numberclass,"",list);
            clearAllmoves();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovesInClassroom(numberclass:  numberclass,),
                ));
          }












        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: textcolor==null?Colors.white:textcolor,
              fontWeight: fontWeight==null?FontWeight.normal:fontWeight ,
              fontSize: textsize==null?16:textsize),
        ),
      ),
    );
  }
}
