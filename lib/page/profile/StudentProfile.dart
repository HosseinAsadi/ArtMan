
import 'package:art_man/components/Buttons/RequestButton.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Utility/GetPing.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/StdInfo.dart';
import 'package:art_man/components/Buttons/profile-button.dart';
import 'package:art_man/componethosein/profile-button.dart';
import 'package:art_man/componethosein/top-profile-info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ProfilePage extends StatefulWidget{
  // static final GlobalKey<ScaffoldState> scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return P();
  }

}

class P extends State<ProfilePage>{
  String username;
  StdProfile information;
  bool isUser=true;
  bool complete=false;



  _getInformation() async {
    String usernamee=await getusername();
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
  Future<Null> onWillPop() {

    /*Navigator.pushNamed(context, "/PlaneSportTeacher");

    print("back pressed runned");*/
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text('آیا مطمئنید میخواهید از برنامه خارج شوید؟'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text('خیر',style: TextStyle(color: Colors.red),),
          ),
          new FlatButton(
            onPressed: () => SystemNavigator.pop(),
            child: new Text('بله',style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    ) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
        onWillPop: onWillPop,
        child:Scaffold(

      body:complete? setBackground():Center(
          child: Container(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          )),
    ));
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
      RequestButton(Icons.search,"جستجوی مربی","جستحو کردن مربی در صورت نیاز شما", Color(0xFFEDC40A),"/SearchPage"),

      Container(margin: EdgeInsets.only(right:10,left: 10),child: Column(
        children: <Widget>[
          ProfileButtone("قسمت مربیان", Icons.print, Colors.green[800], '/MyTeachers'),
          ProfileButtone("برنامه های تمرینی/غذایی", Icons.print, Colors.lightGreen[700], '/PlanePage'),
          ProfileButtone("آنالیزها", Icons.print, Colors.green[800], '/AnalyzeList'),
          ProfileButton(
              "خروج از حساب کاربری", Icons.ac_unit, Color(0xFF4B4F4B), "/")
        ],
      ),)

    ],
  );



}