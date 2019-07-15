import 'package:flutter/material.dart';

import 'Sender.dart';


class Button extends StatefulWidget {
  String text,goal;
  double height;
 double margintop;
  double marginleft;
 double marginright;
 Color startcolor;
 Color endcolor;
 double width;
 List<String> input;
 GlobalKey<FormState> _key;
  setkey(GlobalKey<FormState> _key){
    this._key = _key;
  }

  Button(this.input,this.goal, this.text , this.height,this.margintop,
      {this.marginleft,this.marginright,this.startcolor,this.endcolor,this.width});
  @override
  myBottom createState() {
    // TODO: implement createState
    return myBottom(input,_key, goal, text ,  height,margintop,marginright:marginright,marginleft:marginleft ,startcolor:startcolor ,endcolor:endcolor ,width: width);
  }
}
class myBottom extends State<Button> {
  String cityvalue = null,goal;
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
  myBottom( this.input,this._key, this.goal,this.text , this.height,this.margintop,
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
          if(_key != null)
            if(_key.currentState.validate()){
              Sender sender=new Sender();
              sender.send(input);
               Navigator.pushNamed(context, goal);

            }
            else
                Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("لطفا همه ی فیلد ها را پر کنید",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red[900]));
          else
            Navigator.pushNamed(context, goal);
            
        },
      )

    );
  }
}




