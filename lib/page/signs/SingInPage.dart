
import 'package:art_man/components/Networking/FetchData.dart';
import 'package:http/http.dart' as http;
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputPass.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/UserInfo.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/MD5Generator.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';



class MyCustomForm extends StatefulWidget {

  @override
  SingInPage createState() {

    return SingInPage();
  }
}

class SingInPage extends State<MyCustomForm> {
static String type=UserInfo.type;

 apiRequest() async {
   var x=await GetLocation.fetchuser();
   print(x.toString());
}

 /* _gettype()async{
   String typ=await SharedPrefrences.gettype();
   setState(() {
     type=typ;
   });

  }*/

 @override
  void initState() {
    super.initState();
    apiRequest();

  }

  final _formkey = GlobalKey<FormState>();
  InputText username = new InputText("نام کاربری خود را وارد نمایید ...","username");
  InputPass password = new InputPass("password","password");
  Button signinbtn = new
  Button(type=="teachers"?'/TeacherProfilePage':"/Profile", "ورود", 40.0, 20.0,
      marginleft: 5.0,
      startcolor: Color(0xFF5AE400),
      endcolor: Color(0xFF0F8F00));
  Button signupbtn = new Button(type=="teachers"?'/Register':"/signuppage", "ثبت نام", 40.0, 20.0,
      marginright: 5.0,
      startcolor: Color(0xFF5AE400),
      endcolor: Color(0xFF0F8F00));

  @override
  Widget build(BuildContext context) {
    signinbtn.setkey(_formkey);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  text("نام کاربری :"),
                  username,
                  text("رمز عبور :"),
                  password,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
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
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Text("اصلاح شماره همراه",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 10,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(flex: 1, child:GestureDetector(
                        onTap: (){
                          _formkey.currentState.save();
                          setState(() {
                            print("${Strings.baseurl}/teachers/login/:${Kelid.getter("username")}/:${Hasher.GenerateMd5(Kelid.getter("password"))}");
                            apiRequest();
                          });
                        },
                        child: signinbtn
                      )),
                      Flexible(
                        flex: 1,
                        child:signupbtn,
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
