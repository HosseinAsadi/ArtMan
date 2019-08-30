
import 'dart:convert';

import 'package:art_man/components/Lists/AnalyzeAnswerList.dart';
import 'package:art_man/components/Networking/AnayzeResult.dart';
import 'package:art_man/components/Networking/FetchAnalyzeReslulte.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/ImageDialog.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Widgets/BackgroandwithListview.dart';
import 'package:art_man/components/Widgets/Driver.dart';
import 'package:flutter/material.dart';

class AnalyzeAnswer extends StatefulWidget {
  String index;
  AnalyzeAnswer({Key key,this.index}) : super(key: key);
  @override
  _StateAnalyzeAnswer createState() => _StateAnalyzeAnswer(index);
}

class _StateAnalyzeAnswer extends State<AnalyzeAnswer> {
  String index;
  _StateAnalyzeAnswer(this.index);
  bool complete=true;

  AnalyzeAnswers analyzeAnswer;
  var stdUsername;
  List<Sick> list=new List();
  List<Goal> goals=new List();
  List<Tool> tools=new List();
  Strings strings=new Strings();
  getSick(){

    String sick="";
    for(int i=0;i<list.length;i++){
      sick+=list[i].name+ " , ";
    }
    return sick;
  }
  getGoal(){

    String sick="";
    for(int i=0;i<goals.length;i++){
      sick+=goals[i].name+ " , ";
    }
    return sick;
  }

  getTool(){

    String sick="";
    for(int i=0;i<tools.length;i++){
      sick+=tools[i].name+ " , ";
    }
    return sick;
  }
  _answer() async {
    String username=await getusername();
    setState(() {
      stdUsername= username;
    });
    AnalyzeAnswers analyzeAnswe = (await fetchAnalyzeReslult("${strings.baseurl}/analyze/getFromUser/$stdUsername")) ;
    setState(() {
      analyzeAnswer = analyzeAnswe;
      for(int i=0;i<analyzeAnswer.result.length;i++){
        if(i==int.parse(index)){

          Awnser awnser=analyzeAnswer.result[i].awnsers;
          setterAnalyzeAnswer("sex",awnser.sex=="0"?"مرد":"زن");
          setterAnalyzeAnswer("front",analyzeAnswer.result[i].anatomyPicture[0]);
          setterAnalyzeAnswer("back",analyzeAnswer.result[i].anatomyPicture[1]);
          setterAnalyzeAnswer("beside",analyzeAnswer.result[i].anatomyPicture[2]);
          setterAnalyzeAnswer("alergy",awnser.alergy);
          StringJsonToObject(awnser.sicks);
          StringgoalToObject(awnser.goals);
          StringtoolToObject(awnser.tools);
          setterAnalyzeAnswer("age",awnser.age);
          setterAnalyzeAnswer("sleep",awnser.hours_sleap+ " ساعات خواب "+ "   " + awnser.hours_aweak+" ساعات بیداری ");
          setterAnalyzeAnswer("blodd_Group",awnser.blodd_Group);
          setterAnalyzeAnswer("business",awnser.business);
          setterAnalyzeAnswer("time_work",awnser.total_time_work);
          setterAnalyzeAnswer("day_work",awnser.number_day_work);
          setterAnalyzeAnswer("eat",awnser.to_times_eat +" تا "+awnser.from_times_eat);
          setterAnalyzeAnswer("exit",awnser.from_times_exit+" بار در روز "+awnser.to_times_exit+" بار در هفته ");
          setterAnalyzeAnswer("history",awnser.fieldstd+"    "+awnser.fieldstddes);


          //setterAnalyzeAnswer("digestion",awnser.digestion);
          //setterAnalyzeAnswer("abnormalcy",awnser.abnormalcy);
          setterAnalyzeAnswer("eshteha","چی بنویسم");
          setterAnalyzeAnswer("pal", awnser.pal);
          setterAnalyzeAnswer("medicineTest", "چی بنویسیم");
          setterAnalyzeAnswer("extractday", awnser.extractday);



        }
      }
      complete=true;
    });

  }

  @override
  void initState() {
    super.initState();
    _answer();

  }

  @override
  Widget build(BuildContext context) {
    return Background( complete?
      Container(
        height: MediaQuery.of(context).size.height-60,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TexT("عکس های وضعیت آناتومیکی یا فیگور :"),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ImageDialog("${strings.baseurl}/images/analyze/${getAnalyzeAnswer("front")}"),
                      ImageDialog("${strings.baseurl}/images/analyze/${getAnalyzeAnswer("back")}"),
                      ImageDialog("${strings.baseurl}/images/analyze/${getAnalyzeAnswer("beside")}"),
                    ],
                  ),
                ),
                drivere(),

                Container(
                  child: Row(
                    children: <Widget>[
                      TexT("جنسیت :"),
                      TexT("${getAnalyzeAnswer("sex")}",color: Colors.green),
                    ],
                  ),
                ),
                drivere(),

                TexT("هدف و اندام ایده آل :"),
                TexT("${getGoal()}",color: Colors.green),

                drivere(),

                TexT("سابقه ورزشی :"),
                TexT("${getAnalyzeAnswer("history")}",color: Colors.green),

                drivere(),

                TexT("تعداد جلساتی که می توانم در هفته تمرین کنم :"),
                TexT("${getAnalyzeAnswer("extractday")}",color: Colors.green),

                drivere(),

                Container(
                  child: Row(
                    children: <Widget>[
                      TexT("سن :"),
                      TexT("${getAnalyzeAnswer("age")}",color: Colors.green),

                    ],
                  ),
                ),
                drivere(),

                Container(
                  child: Row(
                    children: <Widget>[
                      TexT("گروه خونی :"),
                      TexT("${getAnalyzeAnswer("blodd_Group")}",color: Colors.green),

                    ],
                  ),
                ),
                drivere(),

                Container(
                  child: Row(
                    children: <Widget>[
                      TexT("شغل :"),
                      TexT("${getAnalyzeAnswer("business")}",color: Colors.green),

                    ],
                  ),
                ),
                drivere(),
                Container(
                  child: Row(
                    children: <Widget>[
                      TexT("تعداد روز های کاری :"),
                      TexT("${getAnalyzeAnswer("day_work")}",color: Colors.green),

                    ],
                  ),
                ),
                drivere(),

                Container(
                  child: Row(
                    children: <Widget>[
                      TexT("مجموع ساعت کاری :"),
                      TexT("${getAnalyzeAnswer("time_work")}",color: Colors.green),

                    ],
                  ),
                ),
                drivere(),

                TexT("سبک زندگی :"),
                TexT("${getAnalyzeAnswer("pal")}",color: Colors.green),

                drivere(),

                TexT("میزان اشتها :"),
                TexT("${getAnalyzeAnswer("eshteha")}",color: Colors.green),

                drivere(),

                TexT("تعداد وعده های غذایی :"),
                TexT("${getAnalyzeAnswer("eat")}",color: Colors.green),

                drivere(),

                TexT("تعداد دفعات دفع مدفوع در روز یا در هفته :"),
                TexT("${getAnalyzeAnswer("exit")}",color: Colors.green),

                drivere(),

                TexT("ساعات خواب به طور معمول و میزان خواب :"),
                TexT("${getAnalyzeAnswer("sleep")}",color: Colors.green),

                drivere(),

                TexT("حساسیت ها :"),
                TexT("${getAnalyzeAnswer("alergy")}",color: Colors.green),

                drivere(),

                TexT("مشکلات گوارشی :"),
                TexT("${getAnalyzeAnswer("")}",color: Colors.green),

                drivere(),

                TexT("ناهنجاری های فیزیکی :"),
                TexT("${getAnalyzeAnswer("")}",color: Colors.green),

                drivere(),

                TexT("بیماری ها :"),
                TexT("${getSick()}",color: Colors.green),

                drivere(),

                TexT("تست های پزشکی :"),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ImageDialog("${strings.baseurl}/images/analyze/${getAnalyzeAnswer("checkup")}"),
                       ],
                  ),
                ),

                drivere(),
                TexT("تجهیزاتی که می توانم با آن تمرین کنم‌:"),
                TexT("${getTool()}",color: Colors.green),

              ],
            ),
          ],
        ),
      ):CircularProgressIndicator(),
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

  StringJsonToObject(data){
    String myJSON = data;

    final List parsedList = json.decode(myJSON);

    list = parsedList.map((val) =>  Sick.fromJson(val)).toList();

  }

  StringgoalToObject(data){
    String myJSON = data;

    final List parsedList = json.decode(myJSON);

    goals = parsedList.map((val) =>  Goal.fromJson(val)).toList();

  }
  StringtoolToObject(data){
    String myJSON = data;

    final List parsedList = json.decode(myJSON);

    tools = parsedList.map((val) =>  Tool.fromJson(val)).toList();

  }
}






