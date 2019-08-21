import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/fetchTeacherProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/StdInfo.dart';
import 'package:art_man/components/Utility/Username.dart';
import 'package:art_man/componethosein/profile-button.dart';
import 'package:art_man/componethosein/top-profile-info.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget{
  static final GlobalKey<ScaffoldState> scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return P(scaffoldkey);
  }

}

class P extends State<ProfilePage>{
  String username;
  StdProfile information;

 bool complete=false;
   GlobalKey<ScaffoldState> scaffoldkey;

   P(this.scaffoldkey);
   _getInformation() async {
     String usernamee=await Username();
     StdProfile info=await StdInfo(usernamee);
     setState(()  {
       username=usernamee;
       information =info;
       complete = true;
     });


   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getInformation();
  }
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldkey,
      body:complete? setBackground():Center(
      child: Container(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(),
    )),
    );
  }

  Widget setBackground() => Container(

    alignment: Alignment(1, 0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: body(),
  );

  Widget body() => ListView(
   // shrinkWrap: true,
    children: <Widget>[
      TopProfile(),
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "/SearchPage");
        },
        child: coachSearch() ,
      ),
      ProfileButton("قسمت مربیان", Icons.print, Colors.green[800], '/MyTeachers'),
      ProfileButton("برنامه های تمرینی/غذایی", Icons.print, Colors.lightGreen[700], '/analyze5'),
      ProfileButton("آنالیزها", Icons.print, Colors.green[800], ''),

    ],
  );

  Widget coachSearch() =>Container(
    margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: new Color(0xFFEDC40A), width: 2),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Icon(Icons.search, color: new Color(0xFFEDC40A)),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: Text('جستجوی مربی', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text('جستجو کردن مربی در صورت نیاز شما', style: TextStyle(color: Colors.black, fontSize: 13),),
            ),
          ],
        )
      ],
    ),
  );

}