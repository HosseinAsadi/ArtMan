import 'dart:convert';
import 'package:art_man/components/Networking/SendData.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OnlineInputText extends StatefulWidget {
  double height;
  Color color,hintconlor,textcolor;
  double radius,hintsize;
  double length;
  int maxlines;
  String hint;
  double right;
  double top;
  double iconsize;
  String fileforsend;
  String id;

  OnlineInputText( {this.color, this.hintconlor, this.radius,
      this.hintsize, this.maxlines, this.hint, this.right, this.top,
      this.iconsize, this.fileforsend,  this.id,this.textcolor,this.height,this.length});

  @override
  _OnlineInputTextState createState() => _OnlineInputTextState(color,
  hintconlor,radius,hintsize,maxlines,hint,right,top,iconsize,fileforsend,id,textcolor,height: height,length: length);
}

class _OnlineInputTextState extends State<OnlineInputText> {
  double height;
  Color color,hintconlor,textcolor;
  double radius,hintsize;
  double length;
 int maxlines;
 String _hint;
 double right;
 double top;
 bool send=false;
 double iconsize;
 String fileforsend;

 String id;

  _OnlineInputTextState( this.color, this.hintconlor, this.radius,
      this.hintsize, this.maxlines, this._hint, this.right, this.top,
      this.iconsize, this.fileforsend,  this.id,this.textcolor,{this.height,this.length});

  var ctrl = new TextEditingController();

 @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(seconds: 1),
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 20),
          height: height == null ? 40.0 : height,
          decoration: BoxDecoration(

              color: color ,
              borderRadius: BorderRadius.circular(radius == null ? 25 : radius)),
          child: TextField(

            inputFormatters: [
              new LengthLimitingTextInputFormatter(length==null?30:length.toInt()),
            ],
            onChanged: (value){
              Kelid.setter(id, value);
              setState(() {
                send=true;
                color=Colors.white;
                textcolor=Colors.black;

              });


            },
            textAlign:   TextAlign.right,
            maxLines: maxlines==null?1:maxlines,

            style: TextStyle(
              fontSize: 12,
              color: textcolor
            ),

            textDirection: TextDirection.rtl,
            controller: ctrl,


            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0.0),
                hintText: _hint,
                errorStyle: TextStyle(height: 0),
                hintStyle: TextStyle(

                    color: hintconlor == null ? Colors.grey : hintconlor,
                    fontSize: hintsize == null ? 12 : hintsize)),
          ),
        ),
        Positioned(
          right: right,
          top: top,
          child: GestureDetector(
            onTap: ()async{
              Strings strings=new Strings();
              String username=await getusername();
             await Put.apiRequest("${strings.baseurl}/teachers/$fileforsend", json.encode({
                "username" : username,
                "$fileforsend" : Kelid.getter(id),
              }));
              setState(() {
                send=false;
                color=Colors.white.withOpacity(0.0);
                if(id=="bio")
                  textcolor=Colors.white;
                else
                  textcolor=Colors.black;

              });

            },
            child: send?Icon(Icons.send,color: Colors.blue,size: iconsize,): Container(width: 0,height: 0,),
          ),
        )
      ],
    )
      ;
  }
}
