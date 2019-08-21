import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/InputTexts/text-area.dart';
import 'package:art_man/componethosein/row-analyze5.dart';
import 'package:flutter/material.dart';
import 'package:art_man/componethosein/appbar.dart';

class Analyze5 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return A();
  }

}

class A extends State<Analyze5>{
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
    child: Container(
      margin: EdgeInsets.all(10),
        child:ListView(
      children: <Widget>[

        body(),

      ],
        ))
  );

  Widget body() => Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('بیماری ها:', style: TextStyle(color: Colors.white),),
            Text('(اجباری)', style: TextStyle(color: Colors.red,fontSize: 12),)
          ],
        ),
      ),
      RowAnalyze5('بیماری کرونری قلب',"sick"),
      RowAnalyze5('تپش سریع قلب',"sick"),
      RowAnalyze5('درد در ناحیه شانه و آرواره',"sick"),
      RowAnalyze5('بی نظمی صربان قلب',"sick"),
      RowAnalyze5('فشار خون بالا',"sick"),
      RowAnalyze5('کوتاهی تنفس',"sick"),
      RowAnalyze5('تنگی نفس',"sick"),
      RowAnalyze5('سابقه خانوادگی در بیماری قلبی',"sick"),
      RowAnalyze5('تب روماتیسمی',"sick"),
      RowAnalyze5('میزان کلسترول بالا',"sick"),
      RowAnalyze5('سرفه مزمن',"sick"),
      RowAnalyze5('دیابت',"sick"),
      RowAnalyze5('کم خونی داسی شکل',"sick"),
      RowAnalyze5('گیجی یا کاهش هوشیاری',"sick"),
      RowAnalyze5('حمله ناگهانی یا تشنج',"sick"),
      RowAnalyze5('انواع سردردها',"sick"),
      RowAnalyze5('آرتریت',"sick"),
      RowAnalyze5('آسیب جدی استخوان',"sick"),
      RowAnalyze5('کمر درد',"sick"),
      InputText('توضیحات خود را وارد نمایید..',"seak description",height: 140,maxlenght: 1000,maxlines: 7,radius: 10,)
      ,Button([],"/StdAnalyzePage6","ادامه آنالیز",45.0,15.0,width: 120.0,)




    ],
  );
}