import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/text-area.dart';
import 'package:art_man/componethosein/row-analyze5.dart';
import 'package:flutter/material.dart';
import 'package:art_man/componethosein/appbar.dart';

class Analyze5 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return A();
  }

}

class A extends State<Analyze5>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  setBackground();

  }

  Widget setBackground() => Container(

    child: body(),
  );

  Widget body() => Column(
    children: <Widget>[
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('بیماری ها:', style: TextStyle(color: Colors.white),),
            Text('(اجباری)', style: TextStyle(color: Colors.red),)
          ],
        ),
      ),
      RowAnalyze5('بیماری کرونری قلب'),
      RowAnalyze5('تپش سریع قلب'),
      RowAnalyze5('درد در ناحیه شانه و آرواره'),
      RowAnalyze5('بی نظمی صربان قلب'),
      RowAnalyze5('فشار خون بالا'),
      RowAnalyze5('کوتاهی تنفس'),
      RowAnalyze5('تنگی نفس'),
      RowAnalyze5('سابقه خانوادگی در بیماری قلبی'),
      RowAnalyze5('تب روماتیسمی'),
      RowAnalyze5('میزان کلسترول بالا'),
      RowAnalyze5('سرفه مزمن'),
      RowAnalyze5('دیابت'),
      RowAnalyze5('کم خونی داسی شکل'),
      RowAnalyze5('گیجی یا کاهش هوشیاری'),
      RowAnalyze5('حمله ناگهانی یا تشنج'),
      RowAnalyze5('انواع سردردها'),
      RowAnalyze5('آرتریت'),
      RowAnalyze5('آسیب جدی استخوان'),
      RowAnalyze5('کمر درد'),

      TextArea('توضیحات خود را وارد نمایید..', 140),



    ],
  );
}