import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Buttons/HelpButton.dart';
import 'package:art_man/components/Widgets/BackgroandwithListview.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:flutter/material.dart';

import 'AnalyzeProblems.dart';

class Analyze6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return A();
  }
}

class A extends State<Analyze6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() => Background(Container(
      margin: EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 20),
      child: Column(
        children: <Widget>[
          top(),
          title('تعداد روزهای کاری:'),
          textFieldTitle("number day work", "۴ ",TextInputType.number),
          title('مجموع ساعت کاری در هر روز:'),
          textFieldTitle("total time work", "۵۰ ",TextInputType.number),
          title('سبک زندگی:'),
          DropDown(
            "lifeStyle",
            [
              "معمولا غیر فعال و باکم تحرک (عمدتا در حالت نشسته)",
              "نسبتا فعال (پیاده روی و با ورزش 20 بار در هفته)",
              "فعالیت متوسط (ورزش 2-3 بار در هفته)",
              "فعال (ورزش سخت بالای 3 بار در هفته)",
              "بسیار فعال (ورزش سنگین به صورت روزانه)",
            ],
            "سبک زندگی",
            fontsize: 11.0,
          ),
          title('تعداد وعده های غذایی:'),
          promise(
              "۲ وعده", "from times eat", "۴ وعده", "to times eat", '', 'تا'),
          title('تعداد دفعات دفع مدفوع در روز یا هفته:'),
          promise("۲ وعده", "from times exit", "۱۰ وعده", "to times exit",
              " در روز ", " در هفته"),
          title('ساعت خواب به طور معمول:'),
          promise(
            "۲۲ ",
            "hours sleap",
            "۱۰",
            "hours aweak",
            "ساعت خواب ",
            " ساعت بیداری ",
          ),
          Button(
            [
              "lifeStyle",
              "number day work",
              "total time work",
              "from times eat",
              "to times exit",
              "from times exit",
              "to times exit",
              "hours sleap",
              "hours aweak",
            ],
            StdAnalyzePage4(),
            "ادامه آنالیز",
            45.0,
            15.0,
            width: 120.0,
          )
        ],
      )));

  Widget title(String title) => Container(
        margin: EdgeInsets.only(bottom: 5, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              '(اجباری)',
              style: TextStyle(color: Colors.red, fontSize: 8),
            )
          ],
        ),
      );

  Widget textFieldTitle(id, hint,type) => Container(
      margin: EdgeInsets.only(
        left: (MediaQuery.of(context).size.width) / 3.5,
        right: (MediaQuery.of(context).size.width) / 3.5,
      ),
      height: 40,
      child: InputText(
        hint,
        id,
        hintconlor: Colors.green,
        textAlign: TextAlign.center,
        maxlenght: 10.0,
        keyboardtype: type,
      ));

  Widget top() => Container(
        child: Row(
          children: <Widget>[
            Text(
              "شغل:  ",
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              flex: 1,
              child: InputText('شغل خود را وارد نمایید..', "business"),
            ),
            HelpButton("business"),
          ],
        ),
      );

  Widget promise(hint1, id1, hint2, id2, text1, text2) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 35,
              width: 80,
              child: InputText(
                hint1,
                id1,
                hintconlor: Colors.green,
                textAlign: TextAlign.center,
                maxlenght: 10.0,
                keyboardtype: TextInputType.number,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 35,
              width: 80,
              child: InputText(
                hint2,
                id2,
                hintconlor: Colors.green,
                textAlign: TextAlign.center,
                maxlenght: 10.0,
                keyboardtype: TextInputType.number,
              ),
            ),
          ],
        ),
      );

  gestyle(text) {
    return Container(
      height: 30,
      child: Text(text),
    );
  }
}
