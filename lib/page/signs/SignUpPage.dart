import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Utility/CityOfCountrys.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySingup();
  }
}

class MySingup extends State<SignUp> {
  static  List<String> countries=[];
  static List<String> cities;
  static Country country;

  bool complete = false;

  final _formkey = GlobalKey<FormState>();
  InputText name =
  new InputText("نام و نام خانوادگی خود را وارد نمایید...", "first_name");

  InputText phone = new InputText("شماره همراه خود را وارد نمایید...", "phone",maxlenght: 11.0,keyboardtype: TextInputType.phone,);

  Button button = new Button(
    ["first_name","phone","country","city","sex"],
    "/SMSVerify",
    "تایید ثبت نام",
    40.0,
    20.0,
    marginleft: 5.0,
    width: 140.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
  );
   _getlocation()async{
     Country location = await GetLocation.fetchData();
    setState(() {
      country=location;
      for (int i = 0; i < country.result.length; i++) {
        countries.add(country.result[i].name);
        setCountry(country.result[i].name, country.result[i].citynames);
      }


      complete = true;
    });
   }


  @override
  void initState() {
    super.initState();
   // _getlocation();

  }

  @override
  Widget build(BuildContext context) {
    button.setkey(_formkey);
      return true? Scaffold(
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
                  child: Form(
                      key: _formkey,
                      child: Container(
                        margin: EdgeInsets.only(left: 50, right: 50),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            text("نام و نام خانوادگی:"),
                            name,
                            text("انتخاب کشور :"),
                            new DropDown("country",["iran","usa","پاکستان"],
                                "کشور محل زندگی خود را انتخاب نمایید ..."),
                            text("انتخاب شهر :"),
                            new DropDown("city",["losonjeles"], "شهر محل زندگی خود را انتخاب نمایید ..."),
                            text("انتخاب جنسیت :"),
                            new DropDown("sex",[
                              "مرد",
                              "زن"
                            ], "جنسیت خود را انتخاب نمایید ..."),
                            text("شماره همراه :"),
                            phone,
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[button],
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ):

     Center(child: Container(width: 60,height: 60,child: CircularProgressIndicator(),),);
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
