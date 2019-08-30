import 'package:art_man/components/Widgets/BackgroandwithListview.dart';
import 'package:art_man/components/Widgets/Driver.dart';
import 'package:flutter/material.dart';

class AnalyzeResult extends StatefulWidget {
  @override
  _AnalyzeResultState createState() => _AnalyzeResultState();
}

class _AnalyzeResultState extends State<AnalyzeResult> {
  @override
  Widget build(BuildContext context) {
    return Background(
      Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Text("جواب آنالیز هنرجو :",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 17),),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              margin: EdgeInsets.only(top:10,right: 10,left: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        TexT("تاریخ :"),
                        MaterialContainer(''),
                        TexT("نام و نام خانوادگی :"),
                        MaterialContainer('')

                      ],),
                      drivere(),

                      TexT("وزن شما (IBW)"),
                      Value(" = Kg", ''),
                      drivere(),
                      TexT("وزن ایده آل (IBW)"),
                      Value(" = Kg", ''),
                      drivere(),

                      TexT("شاخص توده بدن (BMI)"),
                      Value(" = Amount", ''),
                      Value(" = Type", ''),
                      drivere(),

                      TexT("نسبت دور کمر به دور باسن (WHR)"),
                      Value(" = Ratio", ''),
                      Value(" = Type", ''),
                      drivere(),


                      TexT("شاخص چاقی بدن (BAI)"),
                      Value(" = Precent", ''),
                      Value(" = Type", ''),
                      drivere(),


                      TexT("چربی بدن (BF)"),
                      Value(" = Precent", ''),
                      Value(" = Type", ''),
                      drivere(),


                      TexT("ضربان قلب (HR)"),
                      Value(" = Max", ''),
                      Value(" = Target", ''),
                      drivere(),


                      TexT("مجموع انرژی مورد نیاز روزانه برای شما (TEE)"),
                      Value(" = KC", ''),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
  TexT(data,{color}) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 5, bottom: 5, left: 10),
      child: Text(
        data,
        style: TextStyle(
            color: color==null? Colors.black:color, fontWeight: FontWeight.w400, fontSize: 13),
      ),
    );
  }
  
  Value(unit,value){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TexT(unit),
          TexT(value,color:Colors.green),

        ],
      ),
    );
  }

  MaterialContainer(text){
    return Container(
      padding: EdgeInsets.all(2),
      child: TexT(text),
      decoration: BoxDecoration(color: Colors.grey[300],
      borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
