import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Lists/AnalyzeAnswerList.dart';
import 'package:art_man/components/Networking/AnayzeResult.dart';
import 'package:art_man/components/Networking/FetchAnalyzeReslulte.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/Analyzes/SummaryAnswer.dart';
import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';

import 'AnalyzeResultListview.dart';

class AnalyzeList extends StatefulWidget {
  final String username;
  AnalyzeList({Key key, @required this.username}) : super(key: key);
  @override
  _AnalyzeListState createState() => _AnalyzeListState(username);
}

class _AnalyzeListState extends State<AnalyzeList> {
  _AnalyzeListState(this.usernameinputed);
  String usernameinputed;
  bool complete=false;
  List<TeacherInfo> newlistsearch=new List();

  AnalyzeAnswers analyzeAnswer;
  var stdUsername;
  List<String> images=new List();
  Strings strings=new Strings();

  _answer() async {

    var username=await getusername();
    print(username);
    AnalyzeAnswers analyzeAnswe = (await fetchAnalyzeReslult("${strings.baseurl}/analyze/getFromUser/$username")) ;
    setState(() {

      stdUsername=usernameinputed==null?username:usernameinputed;
      analyzeAnswer = analyzeAnswe;
      print("anlalyze lenght ="+analyzeAnswer.result.length.toString());
      for(int i=0;i<analyzeAnswer.result.length;i++){
        if(analyzeAnswer.result[i].user==stdUsername){
          TeacherInfo teacherInfo=new TeacherInfo();
          setState(() {
            teacherInfo.username="تاریخ آنالیز:  "+PersianDate.fromDateTime(DateTime.parse(analyzeAnswer.result[i].create_date))
                .toString(showTime: false) ;
          });

          teacherInfo.imageprofile="${strings.baseurl}/images/analyze/${analyzeAnswer.result[i].anatomyPicture[1]}";

          teacherInfo.name="نام مربی:  "+ analyzeAnswer.result[i].teacher;
          newlistsearch.add(teacherInfo);

          }
        }
    });
    complete=true;
  }
  @override
  void initState() {
    super.initState();
    _answer();

  }
  Future<Null> onWillPop() {
    Navigator.pushNamed(context, "/Profile");

    print("back pressed runned");

  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
      appBar:new  AppBar(

        backgroundColor: Colors.green,
        title: Text("آنالیزها",style: TextStyle(color: Colors.white),),
    leading: new IconButton(
    icon: new Icon(Icons.arrow_back),
    onPressed: (){/*Navigator.pushNamed(context, "/");*/}
    )
      ),
      body: complete? Container(
        margin: EdgeInsets.only(top: 10,bottom: 0),
        height: MediaQuery.of(context).size.height,
        child: AnalyzeResultListview(newlistsearch),
      ):CircularProgressIndicator(),
      bottomNavigationBar:
      Button([],"/StdAnalyzePage","آنالیز جدید",50.0,3.0,marginbottom: 10.0,marginright: 5.0,marginleft: 5.0,)
      ,
    ));
  }


}
//image send to list safe

