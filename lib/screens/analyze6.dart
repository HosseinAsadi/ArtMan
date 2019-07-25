import 'package:flutter/material.dart';
import 'package:art_man/components/appbar.dart';
import 'package:art_man/components/text-field-enter.dart';
import 'package:art_man/components/button.dart';
import 'package:art_man/components/drop-down-menu.dart';

class Analyze6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return A();
  }

}

class A extends State<Analyze6> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(child: CustomAppbar('آنالیز هنرجو', Icons.search),
          preferredSize: Size.fromHeight(55)),
      drawer: Drawer(),
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
      Container(
          child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  top(),
                  title('تعداد روزهای کاری:'),
                  textFieldTitle(),
                  title('مجموع ساعت کاری در هر روز:'),
                  textFieldTitle(),
                  title('سبک زندگی:'),
                  DropDownMenu(''),
                  title('تعداد وعده های غذایی:'),
                  promise("", "تا", ""),
                  title('تعداد دفعات دفع مدفوع در روز یا هفته:'),
                  promise("", "در روز", "در هفته"),
                  title('ساعت خواب به طور معمول:'),
                  promise("ساعت خواب", "ساعت بیداری", ""),
                  CustomButton('ادامه آنالیز', _formKey, '')

                ],
              )
          )
      );

  Widget title(String title) => Container(
    margin: EdgeInsets.only(bottom: 5, top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: TextStyle(color: Colors.white, fontSize: 16),),
        Text('(اجباری)', style: TextStyle(color: Colors.red, fontSize: 10),)
      ],
    ),
  );

  Widget textFieldTitle() => Container(
          margin: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width) / 3.5,
            right: (MediaQuery.of(context).size.width) / 3.5,
          ),
          height: 40,
          child: CustomTextField('', Colors.grey, TextInputType.number)
      );

  Widget top() => Container(
    margin: EdgeInsets.all(16),
    child: Row(
      children: <Widget>[
        Text("شغل:", style: TextStyle(color: Colors.white),),
        Container(
          height: 40,
          width: (MediaQuery.of(context).size.width) / 1.2 ,
          child: CustomTextField('شغل خود را وارد نمایید..', Colors.grey, TextInputType.text),
        )
      ],
    ),
  );

  Widget promise(String t1, String t2, String t3) => Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(t1, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        Container(
          height: 35,
          width: 110 ,
          child: CustomTextField('', Colors.grey, TextInputType.text),
        ),
        Text(t2, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        Container(
          height: 35,
          width: 110 ,
          child: CustomTextField('', Colors.grey, TextInputType.text),
        ),
        Text(t3, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ],
    ),
  );

}