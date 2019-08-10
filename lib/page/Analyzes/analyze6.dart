import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/DropDown.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:flutter/material.dart';


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
    return body();
  }

  Widget body() =>
      Container(
        margin: EdgeInsets.only(left: 10,right: 15,top: 20,bottom: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  top(),
                  title('تعداد روزهای کاری:'),
                  textFieldTitle(),
                  title('مجموع ساعت کاری در هر روز:'),
                  textFieldTitle(),
                  title('سبک زندگی:'),
                  DropDown("",[],""),
                  title('تعداد وعده های غذایی:'),
                  promise("", " تا ", ),
                  title('تعداد دفعات دفع مدفوع در روز یا هفته:'),
                  promise( " در روز ", " در هفته"),
                  title('ساعت خواب به طور معمول:'),
                  promise("ساعت خواب ", " ساعت بیداری ",),

                ],
              )
          )
      );

  Widget title(String title) => Container(
    margin: EdgeInsets.only(bottom: 5, top: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: TextStyle(color: Colors.white, fontSize: 14),),
        Text('(اجباری)', style: TextStyle(color: Colors.red, fontSize: 8),)
      ],
    ),
  );

  Widget textFieldTitle() => Container(
          margin: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width) / 3.5,
            right: (MediaQuery.of(context).size.width) / 3.5,
          ),
          height: 40,
          child: InputText('', "")
      );

  Widget top() => Container(
    
    child: Row(
      children: <Widget>[
        Text("شغل:  ", style: TextStyle(color: Colors.white),),
        Expanded(flex: 1,child:InputText('شغل خود را وارد نمایید..', "business")
            ,)


      ],
    ),
  );

  Widget promise(String t1, String t2) => Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(t1, style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.bold),),
        Container(
          height: 35,
          width: 80 ,
          child:
          InputText('', "",),

        ),
        Text(t2, style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.bold),),
        Container(
          height: 35,
          width: 80 ,
          child: InputText('', "",),

        ),

      ],
    ),
  );

}