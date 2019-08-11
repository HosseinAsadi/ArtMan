import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/DropDown.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySingup();
  }
}

class MySingup extends State<Register> {
  static  List<String> countries=[];
  static List<String> cities;
  static Country country;

  bool complete = false;

  final _formkey = GlobalKey<FormState>();
  InputText name =
  new InputText("نام و نام خانوادگی خود را وارد نمایید...", "first_name");

  InputText phone = new InputText("شماره همراه خود را وارد نمایید...", "phone");

  Button button = new Button(

    "/SMSVerify",
    "تایید ثبت نام",
    40.0,
    20.0,
    marginleft: 5.0,
    width: 140.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
  );


  fetchData() async {
    final response = await http.get("http://192.168.20.227:3000/country/getCountry");
    if (response.statusCode == 200) {
      print("connection is ok");
      var list = (json.decode(response.body));
      country = Country.fromJson(list);

      setState(() {
        for (int i = 0; i < country.result.length; i++) {
          countries.add(country.result[i].name);
        }
      });
      setState(() {
        complete = true;
      });
      return country;
    } else {
      throw Exception('Failed to load countreis');
    }
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    button.setkey(_formkey);
    return complete? Scaffold(
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
                          new DropDown("country",countries,
                              "کشور محل زندگی خود را انتخاب نمایید ..."),
                          text("انتخاب شهر :"),
                          new DropDown("city",[
                            "alai"
                          ], "شهر محل زندگی خود را انتخاب نمایید ..."),

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
