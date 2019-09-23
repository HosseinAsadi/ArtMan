import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputPass.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Utility/Function.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/profile/StudentProfile.dart';
import 'package:flutter/material.dart';

import 'SignUpPage.dart';
import 'SignUpTeacher.dart';

class MyCustomForm extends StatefulWidget {
  @override
  SingInPage createState() {
    return SingInPage();
  }
}

class SingInPage extends State<MyCustomForm> {
   String type;
   Button signup;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double width,height=40.0;

  gettypee()async{
   String t= await gettype();
   setState(() {
     type=t;
     print(type);
   });
  signup=new  Button(
       [],
       type == "teachers" ? Register() : SignUp(),
       "ثبت نام",
       40.0,
       20.0,
       marginright: 5.0,
       startcolor: Color(0xFF5AE400),
       endcolor: Color(0xFF0F8F00));
   }
  @override
  void initState() {
    super.initState();
    gettypee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
            child: Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text("نام کاربری :"),
                InputText("نام کاربری خود را وارد نمایید ...", "username",textAlign: TextAlign.center,),
                  text("رمز عبور :"),
                InputPass("password", "password"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, "/ForgetPass");
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              "فراموشی رمز عبور",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Button(["username", "password"],
                          ProfilePage(),
                            "ورود",
                            40.0,
                            20.0,
                            marginleft: 5.0,
                            function: new Fucntionman(),
                            startcolor: Color(0xFF5AE400),
                            endcolor: Color(0xFF0F8F00),
                            functioncode: "signin",),

                      ),
                      Flexible(
                        flex: 1,
                        child: signup
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget text(text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}


