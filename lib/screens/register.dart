import 'package:flutter/material.dart';
import 'package:art_man/components/drop-down-menu.dart';
import 'package:art_man/components/text.dart';


class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return R();
  }
}

class R extends State<Register> {
  DropDownMenu _dropDownMenuCountrySelected = new DropDownMenu("کشور محل زندگی خود را انتخاب کنید..");
  DropDownMenu _dropDownMenuCitySelected = new DropDownMenu("شهر محل زندگی خود را انتخاب کنید..");
  CustomText _ct1 = new CustomText("نام و نام خانوادگی:");
  CustomText _ct2 = new CustomText("انتخاب کشور:");
  CustomText _ct3 = new CustomText("انتخاب شهر:");
  CustomText _ct4 = new CustomText("شماره همراه:");

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: setBackground(),
    );
  }

  Widget setBackground() => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      );

  Widget body() => Form(
    key: _formKey,
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _ct1,
                getTextFields("نام و نام خانودگی خود را وارد نمایید.."),
                _ct2,
                _dropDownMenuCountrySelected,
                _ct3,
                _dropDownMenuCitySelected,
                _ct4,
                getTextFields("شماره همراه خود را وارد کنید.."),
                button()

              ],
            ),
          )
      )
  );


  Widget getTextFields(String hint) => Container(
      height: 50,
      alignment: Alignment(0, 0),
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),

          child: TextFormField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            validator: (String value){
              if(value.isEmpty) {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('لطفا همه فیلد ها را پر کنید!')));
                return null;
              }
            },
            decoration: InputDecoration.collapsed(
              hintText: hint,
              fillColor: Colors.grey
            ),
          )

  );

  Widget button() => GestureDetector(
    child: Container(
        margin: EdgeInsets.only(
            left:  MediaQuery.of(context).size.width - 305,
            right:  MediaQuery.of(context).size.width - 305,
            top: 50
        ),
        padding: EdgeInsets.only(top: 8, bottom: 8),
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [new Color(0xFF0F8F00), new Color(0xFF5AB403)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(25),

        ),
        child: Text('تایید ثبت نام',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22))),
    onTap: () {
//      if(_formKey.currentState.validate())
        Navigator.pushNamed(context, '/sms-verify');
    },
  );
}
