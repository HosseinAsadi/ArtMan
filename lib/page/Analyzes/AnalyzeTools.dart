import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/text-area.dart';
import 'package:art_man/componethosein/row-save-analyze.dart';
import 'package:flutter/material.dart';


class SaveAnalyzee extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SA();
  }

}

class SA extends State<SaveAnalyzee>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  setBackground();

  }

  Widget setBackground() =>Scaffold(
      body :Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
    alignment: Alignment(0, 0),

    child: body(),
  ));

  Widget body() => Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('چه تجهیزاتی برای تمرین در اختیار دارید؟', style: TextStyle(color: Colors.white,fontSize: 13),),
            Text('(اجباری)', style: TextStyle(color: Colors.red,fontSize: 11),)
          ],
        ),
      ),


      RowSaveAnalyze("فقط وزن بدن", "BodyOnly"),
      RowSaveAnalyze("هالتر", "Barbell"),
      RowSaveAnalyze("دمبل", "Dumbbell"),
      RowSaveAnalyze("کتل بل", "Kattlebells"),
      RowSaveAnalyze("کش", "Bands"),
      RowSaveAnalyze("بدنسازی وزنه آزاد", "Machine free weight"),
      RowSaveAnalyze("بدنسازی سیمکش", "Cable Machine"),
      RowSaveAnalyze("تی آر ایکس", "TRX"),
      RowSaveAnalyze("توپ مدیسن", "Medicine Ball"),
      RowSaveAnalyze("توپ بوسو", "Bosu Ball"),
      RowSaveAnalyze("توپ سوئیسی", "Swiss Ball"),
      RowSaveAnalyze("رول فوم", "Foam Roll"),
      RowSaveAnalyze("دستگاه اضافه", "Other"),



      Button([],"/StdInformationPage","ادامه آنالیز", 45.0, 10.0,width: 130.0,)

    ],
  );
}