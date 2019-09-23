import 'dart:convert';

import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Networking/SendData.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/RandomGenerator.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Networking/Location.dart';
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Utility/CityOfCountrys.dart';
import 'package:art_man/components/Widgets/OneDropdown.dart';
import 'package:art_man/page/signs/sms-verify.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySingup();
  }
}

class MySingup extends State<SignUp> {
  String  verifycode;
    List<String> countries=new List();
    List<String> sex=[
      "مرد",
      "زن"
    ];
    static Country country;
  bool newdrop=false;
  bool complete = false;

  final _formkey = GlobalKey<FormState>();
  InputText name =
  new InputText("نام و نام خانوادگی خود را وارد نمایید...", "first_name",hintsize: 14,value: Kelid.getter("first_name"));
  InputText phone = new InputText("شماره همراه خود را وارد نمایید...", "phone"
    ,maxlenght: 11.0,keyboardtype: TextInputType.phone,value: Kelid.getter("phone"),);
    sender() async{
      Strings strings=new Strings();

      setState(() {
        verifycode = RandromGenerator.Generate().toString();

      });

      String reply=await Post.SendSmS(
          "${strings.baseurl}/admin/sendSMS",
          json.encode({
            "code": verifycode,
            "number": Kelid.getter("phone"),
          }));
      print(reply);
      if(reply=="200" || reply=="201"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SMSVerify(veifycode:verifycode)));
        ShowToast("شماره تلفن وارد شده  ثبت شد",Colors.green,Colors.white);
        print(verifycode);
      }
      if(reply=="411"){
        ShowToast("شماره تلفن وارد شده قبلا ثبت شده است",Colors.red,Colors.white);
      }
    }


   _getlocation()async{
     Country location = await GetLocation.fetchData();
    setState(() {
      country=location;
      for (int i = 0; i < country.result.length; i++) {
        countries.add(country.result[i].name);
      }
      for(int i=0;i<country.result.length;i++)
        setCountry(country.result[i].name, country.result[i].citynames);
       print(citiess.length);
      complete = true;
    });
   }
     callbackCities(country){
     setState(() {
       print(country);
       cities=getCities(country);
       newdrop=true;
     });
 }

  @override
  void initState() {
    super.initState();
    _getlocation();
  }


  @override
  Widget build(BuildContext context) {

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
                            new DropDown("country",countries,
                                "کشور محل زندگی خود را انتخاب نمایید ...",callback: this.callbackCities,fontsize: 10,
                                value: Kelid.getter("country")
                            ),
                            text("انتخاب شهر :"),
                          new DropDown("city",["شهر"], "شهر محل زندگی خود را انتخاب نمایید ...",fontsize: 12,value: Kelid.getter("city")),

                          text("انتخاب جنسیت :"),

                            new OneDropDown("sex",sex, "جنسیت خود را انتخاب نمایید ...",fontsize: 14,value: Kelid.getter("sex"),),
                            text("شماره همراه :"),
                            phone,
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[ Button(
                            ["first_name","phone","country","city","sex"],
                                SMSVerify(),
                              "تایید ثبت نام",
                              40.0,
                              20.0,
                              marginleft: 5.0,
                              width: 140.0,
                              startcolor: Color(0xFF5AE400),
                              endcolor: Color(0xFF0F8F00),
                              functioncode: "signup",
                              callback: this.sender,
                            )],
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
