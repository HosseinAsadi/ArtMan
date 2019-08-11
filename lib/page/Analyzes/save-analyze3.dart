import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/text-area.dart';
import 'package:art_man/componethosein/appbar.dart';
import 'package:art_man/componethosein/row-analyze5.dart';
import 'package:flutter/material.dart';


class SaveAnalyze3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SA5();
  }

}

class SA5 extends State<SaveAnalyze3>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(child: CustomAppbar('آنالیز هنرجو', Icons.search), preferredSize: Size.fromHeight(55)),
      drawer: Drawer(),
      body: setBackground(),
    );
  }

  Widget setBackground() => Container(
    alignment: Alignment(0, 0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: body(),
  );

  Widget body() => ListView(
    shrinkWrap: true,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('تعیین هدف:', style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      RowAnalyze5('افزایش قدرت'),
      RowAnalyze5('استقامت بدن'),
      RowAnalyze5('سرعت'),
      RowAnalyze5('سرعت عکس العمل'),
      RowAnalyze5('فشار خون بالا'),
      RowAnalyze5('توان هوازی'),
      RowAnalyze5('توان بی هوازی'),
      RowAnalyze5('انعطاف پذیری'),
      RowAnalyze5('چابکی بدن'),
      RowAnalyze5('تعادل و هماهنگی'),
      RowAnalyze5('هایپر تروفی'),
      RowAnalyze5('ایجاد تکنیک حرکات خاص'),
      RowAnalyze5('وارد نمایید..'),

      TextArea('اطلاعات تکمیلی را وارد کنید..', 90),

      Button("/analyze2","ادامه آنالیز", 40.0, 10.0,),

    ],
  );
}