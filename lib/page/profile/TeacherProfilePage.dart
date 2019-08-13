import 'package:art_man/components/Buttons/profile-button.dart';
import 'package:art_man/components/InputTexts/MaterialText.dart';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Networking/FetchData.dart';
import 'package:art_man/components/Networking/fetchProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TeacherProfilePage extends StatefulWidget {
  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  profilInfo information;
  String name;
  String country;
  String city;
  String about;
  bool complete = false;
 static String username;
 static String imagename;

  List<Widget> item = [Text('گرفتن عکس'), Text("انتخاب از گالری")];
  MaterialText id;
  MaterialText time = new MaterialText(
    30.0,
    "10 روز",
    Colors.white,
    backgroundColor: Color(0xFF71C105),
    right: 10,
  );
  ProfileButton btnplan = new ProfileButton("برنامه تمرینی / غذایی",
      Icons.ac_unit, Color(0xFF088B00), "/SaveAnalyze");
  ProfileButton btnlist = new ProfileButton(
      "لیست هنرجویان", Icons.ac_unit, Color(0xFF71C105), "/StdAnalyzePage6");
  ProfileButton btnsprt = new ProfileButton(
      "پشتیبانی", Icons.ac_unit, Color(0xFF088B00), "/SportField");
  ProfileButton btnexit = new ProfileButton(
      "خروج از حساب کاربری", Icons.ac_unit, Color(0xFF4B4F4B), "/");

  _getUserName() async {
    username = await SharedPrefrences.getusername();
  }

  _getInformation() async {
    username = await SharedPrefrences.getusername();
    profilInfo info = await GetLocation.fetchProfileInfo(
        "${Strings.baseurl}/teachers/getTeacher/$username");
    setState(() {
      information = info;

      setState(() {
        name=information.result[0].firstname;

        country=information.result[0].country;
        city=information.result[0].city;
        about=information.result[0].about;
        imagename=information.result[0].profilephoto;
      });
      id = new MaterialText(
        20.0,
        username,
        Colors.black,
        fontWeight: FontWeight.w500,
        fontsize: 14,
      );
      complete = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserName();
    _getInformation();
  }

  @override
  Widget build(BuildContext context) {
    //  debugPaintSizeEnabled=true;

    return Scaffold(
      body: Builder(
        builder: (context) => complete?Container(
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
                                child: GestureDetector(
                                  onTap: () {
                                    /* UserInfo userinfo=new UserInfo();
                              userinfo.print();*/
                                    Navigator.pushNamed(context, "/Uploader");
                                    /*Navigator.pushNamed(
                                context,
                                Uploader.routeName,
                                arguments: ScreenArguments(
                                    ImageSource.gallery
                                ),
                              );*/
                                    /* Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                  backgroundColor: Colors.white,
                                    content: ListView(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(20.0),
                                      children: <Widget>[
                                        InkWell(child: Row(
                                          mainAxisAlignment:MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: <Widget>[
                                          Icon(Icons.camera_alt,color: Colors.grey),
                                          SizedBox(width: 30,),
                                          Text('گرفتن عکس',style: TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.w700,fontSize: 16),),
                                        ],),

                                        onTap: (){
                                          Navigator.pushNamed(
                                            context,
                                            ImageSetting.routeName,
                                            arguments: ScreenArguments(
                                              ImageSource.camera
                                              ),
                                          );
                                        },),
                                        Container(height:1,color:  Colors.grey,),
                                        InkWell(

                                          onTap: (){
                                            Navigator.pushNamed(
                                              context,
                                              ImageSetting.routeName,
                                              arguments: ScreenArguments(
                                                  ImageSource.gallery
                                              ),
                                            );
                                          },

                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            children: <Widget>[
                                            Icon(Icons.photo_library,color: Colors.grey),
                                            SizedBox(width: 30,),
                                            Text('انتخاب از گالری',style: TextStyle(color: Colors.black,
                                                fontWeight: FontWeight.w700,fontSize: 16)),
                                          ],)
                                        )



                                      ],
                                    )));*/
                                  },
                                  child: ClipRRect(
                                    child:""=="$imagename"?
                                    Image.asset( "assets/images/morabi.jpeg"):
                                    Image.network("${Strings.baseurl}/images/teachers/$imagename"),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                                width: 100,
                                height: 100,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 20, left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      text(name, FontWeight.w800,
                                          24.0),
                                      text(
                                          "مربی ورزش بدنسازی ,پرورش اندام و کشتی",
                                          FontWeight.w300,
                                          12.0),
                                      text(
                                          "آیدی مربی :", FontWeight.w800, 14.0),
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
                                            child: text(
                                                "$city,$country",
                                                FontWeight.w300,
                                                14.0),
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
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    children: <Widget>[
                                      Text(""),
                                    ],
                                  )),
                              new Positioned(
                                  bottom: 2,
                                  left: 5,
                                  child: InkWell(
                                      onTap: null,
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
                          btnplan,
                          btnlist,
                          btnsprt,
                          btnexit
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ):CircularProgressIndicator(),
      ),
    );
  }

  text(text, fontwidth, fontsize) => Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.white, fontWeight: fontwidth, fontSize: fontsize),
      );
}
