import 'package:flutter/material.dart';
import 'package:art_man/components/text.dart';
import 'package:art_man/components/text-field-enter.dart';
import 'package:art_man/components/button.dart';

class MonthlyPayment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MP();
  }
}

class MP extends State<MonthlyPayment> {
  CustomText _ct = new CustomText("پرداخت‌اشتراک‌ماهانه:");
  CustomButton _cb = new CustomButton("پرداخت‌آنلاین", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: setBackground(),
    );
  }

  Widget setBackground() =>
      Container(
        alignment: Alignment(1, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      );

  Widget body() =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _ct,
          getTextFields("پرداخت اشتراک ماهانه خود را وارد کنید.."),
          _cb
        ],
      );

  Widget getTextFields(String hint) =>
      Container(
          height: 50,
          alignment: Alignment(0, 0),
          margin: EdgeInsets.only(left: 30, right: 30),
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Padding(padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      flex: 7,
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        validator: (String value) {
                          if (value.isEmpty) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('لطفا همه فیلد ها را پر کنید!')));
                            return null;
                          }
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: hint, fillColor: Colors.grey),
                      )
                  ),
                  Flexible(
                      flex: 3,
                      child: Text(
                          "ریال"
                      )
                  ),
                ],
              )
          )
      );

}
