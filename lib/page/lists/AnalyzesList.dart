import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Lists/AnalyzeAnswerList.dart';
import 'package:art_man/components/Networking/AnayzeResult.dart';
import 'package:art_man/components/Networking/FetchAnalyzeReslulte.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/Analyzes/AnalyzeAnatomicimage.dart';
import 'package:art_man/page/Analyzes/SummaryAnswer.dart';
import 'package:art_man/page/profile/StudentReadOnlyProfile.dart';
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
  String usernameinputed,baseusername;
  bool complete=false;
  List<TeacherInfo> newlistsearch=new List();

  AnalyzeAnswers analyzeAnswer;
  var stdUsername;
  String type;
  List<String> images=new List();
  Strings strings=new Strings();

   gettypee()async{
     String t=await gettype();
     setState(() {
       type=t;
     });

   }

  _answer() async {

    var username=await getusername();

    stdUsername=usernameinputed==null?username:usernameinputed;
    print(stdUsername);
    AnalyzeAnswers analyzeAnswe = (await fetchAnalyzeReslult("${strings.baseurl}/analyze/getFromUser/$stdUsername")) ;
    setState(() {
    print(analyzeAnswe.result.length);

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

  getrealusername()async{
    baseusername=await getusername();
  }
  @override
  void initState() {
    super.initState();
    gettypee();
    _answer();
    getrealusername();

  }
  Future<Null> onWillPop() {
    print(baseusername);
    print(usernameinputed);
     print(usernameinputed);
     print(type);
    type=="teachers"? Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentProfileReadOnly(username: usernameinputed,)))
        : Navigator.pushNamed(context, "/Profile");



  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
      appBar:new  AppBar(
         iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text("آنالیزها",style: TextStyle(color: Colors.white),),

      ),
      body: complete? Container(
        margin: EdgeInsets.only(top: 10,bottom: 0,left: 10,right: 10),
        height: MediaQuery.of(context).size.height,
        child: AnalyzeResultListview(newlistsearch,stdUsername),
      ):CircularProgressIndicator(),
      bottomNavigationBar:
    type=="users"?  Button([],StdAnalyzePage(),"آنالیز جدید",50.0,3.0,marginbottom: 10.0,marginright: 5.0,marginleft: 5.0,):Container(width: 0,height: 0,)
      ,
    ));
  }


}
//image send to list safe

