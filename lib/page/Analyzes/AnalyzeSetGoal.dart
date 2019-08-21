import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
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
            Text('تعیین هدف:', style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
          ],
        ),
      ),
      RowAnalyze5('افزایش قدرت',"goal"),
      RowAnalyze5('استقامت بدن',"goal"),
      RowAnalyze5('سرعت',"goal"),
      RowAnalyze5('سرعت عکس العمل',"goal"),
      RowAnalyze5('فشار خون بالا',"goal"),
      RowAnalyze5('توان هوازی',"goal"),
      RowAnalyze5('توان بی هوازی',"goal"),
      RowAnalyze5('انعطاف پذیری',"goal"),
      RowAnalyze5('چابکی بدن',"goal"),
      RowAnalyze5('تعادل و هماهنگی',"goal"),
      RowAnalyze5('هایپر تروفی',"goal"),
      RowAnalyze5('ایجاد تکنیک حرکات خاص',"goal"),
      RowAnalyze5('وارد نمایید..',"goal"),

      InputText('اطلاعات تکمیلی را وارد کنید..',"goal description",height: 100.0,maxlines: 4,maxlenght: 400,radius: 10,),

      Button([],"/SaveAnalyze","ادامه آنالیز", 40.0, 10.0,width: 120.0,),

    ],
  );
}