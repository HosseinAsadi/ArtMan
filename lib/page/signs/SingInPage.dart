import 'package:art_man/components/Buttons/virtualButton.dart';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Toast/ShowSnackbar.dart';
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputPass.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/MD5Generator.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCustomForm extends StatefulWidget {
  @override
  SingInPage createState() {
    return SingInPage();
  }
}

class SingInPage extends State<MyCustomForm> {
  static String type;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  double width,height=40.0;
  UserData rslt;
  Button signinbtn;
  Button signupbtn;
  Strings strings=new Strings();

  InputText username =
      new InputText("نام کاربری خود را وارد نمایید ...", "username");
  InputPass password = new InputPass("password", "password");

  Future<Null> gettype() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String t = prefs.getString("type");
    print(t);
    setState(() {
      type = t;
      signinbtn = new Button(["username", "password"],
          type == "teachers" ? '/TeacherProfilePage' : "/Profile",
          "ورود",
          40.0,
          20.0,
          marginleft: 5.0,
          startcolor: Color(0xFF5AE400),
          endcolor: Color(0xFF0F8F00));
      signupbtn = new Button(
          [],
          type == "teachers" ? '/Register' : "/signuppage",
          "ثبت نام",
          40.0,
          20.0,
          marginright: 5.0,
          startcolor: Color(0xFF5AE400),
          endcolor: Color(0xFF0F8F00));
    });
  }

  apiRequest(url) async {
    rslt = await GetLocation.fetchuser(url);
    print ("connecteon is ok data recieved and reslutl is"+ rslt.result.toString());

  }

  @override
  void initState() {
    super.initState();
    gettype();
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment(0, 0),
                            width: width,
                            height: height,
                            margin: EdgeInsets.only(top: 20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Color(0xFF5AE100), Color(0xFF0F8F00)])),
                            child: Text(
                              "ورود",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize:16),
                            ),
                          ),
                          onTap: () async {
                           await apiRequest(
                                "${strings.baseurl}/$type/login/${Kelid.getter("username")}/${Hasher.GenerateMd5(Kelid.getter("password"))}");


                            if (rslt.result.toString() == "0" ) {
                              Snakbar.ShowSnackbar(_scaffoldKey,
                                  "نام کاربری یا رمز عبور اشتباه است");
                            }
                            if (rslt.result.toString() == "1") {
                              Navigator.pushNamed(
                                context,
                                type == "teachers"
                                    ? '/TeacherProfilePage'
                                    : "/Profile",
                              );
                            }
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: signupbtn,
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
