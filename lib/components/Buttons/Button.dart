import 'package:art_man/components/Utility/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  String text, goal;
  bool task=false;
  List<String> list;
  double height;
  double margintop;
  double marginbottom;
  double marginleft;
  double marginright;
  Color startcolor;
  Color endcolor,textcolor;
  double width;
  var function;
  FontWeight fontWeight;
  double textsize;
  GlobalKey<FormState> _key;

  setkey(GlobalKey<FormState> _key) {
    this._key = _key;
  }

  Button(this.list,this.goal, this.text, this.height, this.margintop,
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
      this.function(arg)});

  @override
  myBottom createState() {
    // TODO: implement createState
    return myBottom(list, _key, goal, text, height, margintop,
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
    function: function);
  }
}

class myBottom extends State<Button> {
  String cityvalue = null, goal;
  String text;
  List<String> list;
  bool task=false;
  var function;
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

  myBottom(
       this.list,this._key, this.goal, this.text, this.height, this.margintop,
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
      this.function});
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


    return Container(
      alignment: Alignment(0, 0),
      width: width,
      height: height,
      margin: EdgeInsets.only(top: margintop, left: left, right: right,bottom: bottom),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //border: Border.all(color: bordercolor,width: borderwidth),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [startcolor==null?Color(0xFF5AE100):startcolor, endcolor==null?Color(0xFF0F8F00):endcolor])),
      child: GestureDetector(
        onTapDown: (tapDetails) {
          setState(() {
            width = width - 2;
            --height;
            startcolor = Colors.green[900];
            endcolor = Colors.green[800];
          });
        },
        onTapUp: (TapUpDetails) {
          setState(() {
            startcolor = Color(0xFF5AE100);
            endcolor = Color(0xFF0F8F00);
            width = width + 2;
            ++height;
          });
        },
        onTap: () {
          Validator validator=new Validator();

          if(list.length==0)
          Navigator.pushNamed(context, goal);

           else if (validator.isvalid(list)) {
             print("----------------------------> validator is ok");
            Navigator.pushNamed(context, goal);
          }

          else
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  "لطفا همه ی فیلد ها را پر کنید",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red[900]));

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
