import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/MaterialText.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

class JoinedPage extends StatefulWidget {
  @override
  myJoinedPage createState() {
    return myJoinedPage();
  }
}

class myJoinedPage extends State<JoinedPage> {
  bool _accept = false;
  Button buttonenable = new Button([""], '/TeacherProfilePage', 'ورود به پنل کاربری', 40.0, 10.0,
      startcolor: Color(0xFF5AE400), endcolor: Color(0xFF0F8F00), width: 130.0);
  Button buttondisable = new Button([""], '/SportField', 'ورود به پنل کاربری', 40.0, 10.0,
      startcolor: Colors.grey, endcolor: Colors.grey, width: 130.0);

  MaterialText tilte = new MaterialText(
    40.0,
    "عضویت شما فعال گردیده است ...",
    Colors.black,
    bottom: 15.0,
    fontWeight: FontWeight.w700,
    fontsize: 18.0,

  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: <Widget>[
                      tilte,
                      Text(
                        Strings.joinExplain,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          InkWell(
                            onTap: (){
                              setState(() {
                                _accept=!_accept;
                              });
                            },

                            child: Icon(!_accept ? Icons.crop_square : Icons.done,color:Colors.white,),
                          ),

                             Text(
                              "قوانین و مقررات را می پذیرم.",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),

                          GestureDetector(
                            child: Text(
                              "(توضیحات)",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 11,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                     buttonenable
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
