
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Utility/CityOfCountrys.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySingupteacher();
  }
}

class MySingupteacher extends State<Register> {

    List<String> countries=[];

  static Country country;


  bool complete = false;

  final _formkey = GlobalKey<FormState>();
  InputText name =
  new InputText("نام و نام خانوادگی خود را وارد نمایید...", "first_name");

  InputText phone = new InputText("شماره همراه خود را وارد نمایید...", "phone",keyboardtype: TextInputType.phone,maxlenght: 11.0,);

  Button button = new Button(
    ["first_name","phone","country","city",],
    "/SMSVerify",
    "تایید ثبت نام",
    40.0,
    20.0,
    marginleft: 5.0,
    width: 140.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
  );
    callbackCities(country){
      setState(() {
        print(country);
        cities=getCities(country);
        

      });
    }
  _getlocation()async{
    Country location = await GetLocation.fetchData();
    setState(() {
      country=location;
      for (int i = 0; i < country.result.length; i++) {
        countries.add(country.result[i].name);
      }

      _setCityForCountry();
      complete = true;
    });
  }
  _setCityForCountry(){
    setState(() {
      for(int i=0;i<country.result.length;i++)
        setCountry(country.result[i].name, country.result[i].citynames);

    });
  }

  @override
  void initState() {
    super.initState();
    _getlocation();

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
                           DropDown("country",countries,
                            "کشور محل زندگی خود را انتخاب نمایید ...",callback: this.callbackCities,),
                          text("انتخاب شهر :"),
                          new DropDown("city",[], "شهر محل زندگی خود را انتخاب نمایید ..."),
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

