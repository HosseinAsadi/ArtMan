import 'package:art_man/components/Networking/AddTeacher.dart';
import 'package:flutter/material.dart';
import 'package:art_man/components/InputTexts/MaterialText.dart';
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/fetchTeacherProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/EmptyPage.dart';
import 'package:flutter/rendering.dart';

class TeacherProfileReadOnly extends StatefulWidget {
  final String text;
  TeacherProfileReadOnly({Key key, @required this.text}) : super(key: key);

  @override
  _TeacherProfileReadOnlyState createState() => _TeacherProfileReadOnlyState(text);
}

class _TeacherProfileReadOnlyState extends State<TeacherProfileReadOnly> {
  TeacherProfile information;
  String name;
  String country;
  String city;
  String about;
  String bio;
 List<String> studentsList;
  bool myTeacher=false;
  bool complete = false;
  static String username;
  static String imagename;
  String teacherUsername;
  _TeacherProfileReadOnlyState(this.teacherUsername);
  var _key = GlobalKey<ScaffoldState>();

  MaterialText id;
  MaterialText time = new MaterialText(
    30.0,
    "10 روز",
    Colors.white,
    backgroundColor: Color(0xFF71C105),
    right: 10,
  );

  Strings strings = new Strings();

  _getInformation() async {

    username = await getusername();
    print("${strings.baseurl}/teachers/getTeacher/$teacherUsername");
    TeacherProfile info = await GetLocation.fetchProfileTeacher(
        "${strings.baseurl}/teachers/getTeacher/$teacherUsername");
    setState(() {
      information = info;

      setState(() {
        name = information.result[0].firstname;
        country = information.result[0].country;
        city = information.result[0].city;
        about = information.result[0].about;
        imagename = information.result[0].profilephoto;
        bio = information.result[0].biografi;
        studentsList = information.result[0].users_id;
        for(int j=0;j<studentsList.length;j++){
          if(username==studentsList[j])
            myTeacher=true;
        }
      });
      id = new MaterialText(
        20.0,
        teacherUsername,
        Colors.black,
        fontWeight: FontWeight.w500,
        fontsize: 14,
      );
      complete = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getInformation();
  }

  @override
  Widget build(BuildContext context) {
    //  debugPaintSizeEnabled=true;

    return Scaffold(
      key: _key,
      body: Builder(
        builder: (context) => complete
            ? Container(
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
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: ClipRRect(
                                    child: "" == "$imagename"
                                        ? Image.asset(
                                            "assets/images/morabi.jpeg")
                                        : Image.network(
                                            "${strings.baseurl}/images/teachers/$imagename"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  width: 100,
                                  height: 100,
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 20, left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        text(name, FontWeight.w800, 24.0),
                                        MaterialText(
                                            25.0,
                                            bio == "" ? "بیوگرافی ...." : bio,
                                            Colors.white,
                                        backgroundColor: Colors.white.withOpacity(0.0),
                                        fontsize: 14.0,
                                        align: Alignment.topRight,),
                                        text("آیدی مربی :", FontWeight.w800,
                                            14.0),
                                        id,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            ),
                                            Expanded(
                                              child: text("$city,$country",
                                                  FontWeight.w300, 14.0),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            text("درباره ی من :", FontWeight.w500, 17.0),
                            Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: MaterialText(
                                      150.0,
                                      about == ""
                                          ? "توضیحات ندارد ...."
                                          : about,
                                      Colors.black,
                                    fontsize: 14.0,
                                    align: Alignment.topRight,),
                                ),
                                new Positioned(
                                    bottom: 2,
                                    left: 5,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => EmptyPage(
                                                      text: about,
                                                    ),
                                              ));
                                        },
                                        child: Text(
                                          "موارد بیشتر",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                              color: Colors.green),
                                        ))),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              child: Row(
                                children: <Widget>[
                                  text("زمان مورد انتظار برای ارسال برنامه :",
                                      FontWeight.w600, 15.0),
                                  Expanded(
                                    flex: 1,
                                    child: time,
                                  )
                                ],
                              ),
                            ),
                            myTeacher?updater("حذف از لیست مربیان من","delete"):
                            updater("افزودن مربی به لیست مربیان من","add")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Container(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              )),
      ),
    );
  }

  text(text, fontwidth, fontsize) => Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white, fontWeight: fontwidth, fontSize: fontsize),
      );

  updater(text,task)=>Container(
    alignment: Alignment.center,
      child:Column(children: <Widget>[
        GestureDetector(
            onTap: ()async{
              deleteTeacher(teacherUsername,username);

                if(task=="add"){
                 var result= await AddTeacher(teacherUsername,username);
                  setState(() {
                    if(result=="200"||result=="201")
                       myTeacher=true;
                  });
                }
                else{
                 var result=await deleteTeacher(teacherUsername,username);
                  setState(() {
                    if(result=="200"||result=="201")
                        myTeacher=false;
                  });
                }


            },
            child:!myTeacher? Icon(Icons.add_circle,color: Colors.green,size: 50,):Icon(Icons.remove_circle,color: Colors.red,size: 50,)
        ),
        Container(margin: EdgeInsets.only(top: 10),child: Text(text,style: TextStyle(color: Colors.white,fontSize: 15),),)
      ],)
  );
}
