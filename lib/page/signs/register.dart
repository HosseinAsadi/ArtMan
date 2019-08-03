import 'package:art_man/components/Buttons/costumbutton.dart';
import 'package:art_man/components/DropDown.dart';
import 'package:art_man/components/InputTexts/text-field-enter.dart';
import 'package:art_man/components/Texts/text.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return R();
  }
}

class R extends State<Register> {
  DropDown _dropDownMenuCountrySelected =
      new DropDown("کشور محل زندگی خود را انتخاب کنید..");
  DropDown _dropDownMenuCitySelected =
      new DropDown("شهر محل زندگی خود را انتخاب کنید..");

  CustomText _ct1 = new CustomText("نام و نام خانوادگی:");
  CustomText _ct2 = new CustomText("انتخاب کشور:");
  CustomText _ct3 = new CustomText("انتخاب شهر:");
  CustomText _ct4 = new CustomText("شماره همراه:");

  CustomTextField _ctf1 = new CustomTextField(
      "نام و نام خانودگی خود را وارد نمایید..", Colors.grey, TextInputType.text);
  CustomTextField _ctf2 =
      new CustomTextField("شماره همراه خود را وارد کنید..", Colors.grey, TextInputType.text);

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
                _ctf1,
                _ct2,
                _dropDownMenuCountrySelected,
                _ct3,
                _dropDownMenuCitySelected,
                _ct4,
                _ctf2,
                CustomButton('تایید ثبت نام', _formKey, '/sms-verify')
              ],
            ),
          )));


}
