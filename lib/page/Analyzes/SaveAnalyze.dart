
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/InputTexts/ListInputText.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/FetchTeachersList.dart';
import 'package:art_man/components/Networking/SendAnalyzeResult.dart';
import 'package:art_man/components/Utility/Function.dart';
import 'package:art_man/components/Utility/GetTeachersList.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/StdInfo.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/lists/AnalyzesList.dart';
import 'package:flutter/material.dart';
class SaveAnalyze extends StatefulWidget {

  @override
  _SaveAnalyzeState createState() => _SaveAnalyzeState();
}


class _SaveAnalyzeState extends State<SaveAnalyze> {
  int reslult;



  List<TeacherInfo> myTeachers=new List();

  getStdInfo()async{

    String usernamee=await getusername();
    print("in complete");

    StdProfile info=await StdInfo(usernamee);
    TeachersList teachers=await GetTeachersList();
    setState(()  {

      for(int i=0;i<info.result.length;i++){
        if(info.result[i].username==usernamee)
          for(int j=0;j<info.result[i].MyTeachers.length;j++)
            if(info.result[i].MyTeachers[j].access){
              for(int k=0;k<teachers.result.length;k++){
                if(teachers.result[k].username==info.result[i].MyTeachers[j].username){
                  TeacherInfo teacher=new TeacherInfo();
                  teacher.username=info.result[i].MyTeachers[j].username;
                  teacher.name=teachers.result[k].firstname;
                  teacher.imageprofile=teachers.result[k].profilephoto ;
                  myTeachers.add(teacher);
                }
              }
            }
      }

      print("complete & "+myTeachers.length.toString());

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStdInfo();
  }
  var _key=GlobalKey<FormState>();

  Button saveanalyze = new Button(
    ["teacherid"],
    AnalyzeList(),
    "ذخیره آنالیز",
    40.0,
    30.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
    width: 100.0,
    function: new Fucntionman(),
    functioncode: "ذخیره آنالیز",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7FC81D),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: Text("آنالیز هنرجو"),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            Center(
              child: Container(
                margin:
                EdgeInsets.only(left: 25, right: 25, top: 30),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("آیدی مربی خود را وارد نمایید.",style: TextStyle(
                            color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500
                          ),),
                          Text("(اجباری)"
                          ,style: TextStyle(color: Colors.red[900],fontSize: 12,fontWeight: FontWeight.w500),)
                        ],
                      ),


                    ),
                    new ListInputText(
          myTeachers,
          "آیدی مربی خود را وارد نمایید...",
          "teacherid",
          height: 45.0,
          margintop: 10.0,
          radius: 30,


        ),
                    saveanalyze,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
