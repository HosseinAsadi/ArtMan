import 'package:flutter/material.dart';
import 'package:art_man/components/Strings.dart';
import 'package:art_man/components/drawLine.dart';
import 'package:art_man/components/Bottom.dart';

class StdPropertyBody extends StatefulWidget {
  @override
  MyStdproperty createState() {

    return MyStdproperty();
  }

}
class MyStdproperty extends State<StdPropertyBody>{
  drawLine line=new drawLine();
  Bottom bottom=new Bottom();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 1),
                    child: Column(
                      children: <Widget>[
                        Text(
                          Strings.titlestdprop,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        line.get(2.5,250.0, Color(0xFF0F8F00)),
                      ],
                    ),
                  )),
              Flexible(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    Strings.studentProperty,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/signinpage');
                  },
                  child: bottom.get("صفحه ورود/ثبت نام", 40.0, 10.0,startcolor:Color(0xFF5AE400),endcolor: Color(0xFF0F8F00),width: 130.0),
                ),)
            ],
          ),
        ),

    )  ;
  }



}
