import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/FetchTeachersList.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/GetTeachersList.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/components/Widgets/BackgroandwithListview.dart';
import 'package:art_man/page/lists/LisviewGenerator.dart';
import 'package:art_man/page/profile/TeacherProfileReadOnly.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TeachersList _teachersList;
  List<TeacherInfo> information = new List();
  List<TeacherInfo> newlistsearch = new List();
  bool infoloaded = false,issearched=false;
  double width=30,height=30;
  Strings strings=new Strings();

  _getListOfTeachers() async {
    var _teachers = await GetTeachersList();

    setState(() {
      _teachersList = _teachers;
      for (int i = 0; i < _teachersList.result.length; i++) {
        TeacherInfo teacher = new TeacherInfo();
        teacher.username = _teachers.result[i].username;
        teacher.name = _teachers.result[i].firstname;
        teacher.imageprofile = _teachers.result[i].profilephoto;
        information.add(teacher);
      }
      infoloaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getListOfTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: infoloaded
          ? Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),

                      margin: EdgeInsets.only(left: 8, right: 8,top: 30),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTapDown: (details){
                              setState(() {
                                width=20;
                                height=20;
                              });

                            },
                            onTapUp: (details){
                              setState(() {
                                width=30;
                                height=30;
                              });

                            },
                            onTap: (){

                              setState(() {
                                newlistsearch.clear();
                                for(int i=0;i<information.length;i++){
                                  if(information[i].username.contains(Kelid.getter("searchTeacher")))
                                  {
                                    newlistsearch.add(information[i]);
                                  }
                                }
                                if(Kelid.getter("searchTeacher")==""){
                                  newlistsearch.clear();
                                }
                                issearched=true;
                              });

                            },
                            child: AnimatedContainer(
                              width: width,
                              height: height,
                              duration: Duration(microseconds: 1000),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: new Color(0xFFEDC40A), width: 2),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Icon(Icons.search,size: 20, color: new Color(0xFFEDC40A)),
                            ),
                          ),
                          Expanded(
                            child:Container(
                              margin: EdgeInsets.all(4),
                                child: InputText("جستوجوی مربی","searchTeacher",height: 40.0,hintconlor: Colors.black45,)

                            )

                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:newlistsearch.length==0 && issearched?Container(
                      padding: EdgeInsets.all(10),
                      height: 120,
                      child: Text("هیچ مربی با مشخصات داده شده یافت نشد",style: TextStyle(fontSize: 16),),
                    ): ListViewGenerator(newlistsearch) ,
                  ),


                ],
              ),
            )
          :Background(Center(
          child: Container(
            margin: EdgeInsets.only(top: 200),
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          )),)
    );
  }


}
