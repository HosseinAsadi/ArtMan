
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Buttons/RequestButton.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/SportPlan/MyPlansList.dart';
import 'package:art_man/page/lists/ListOfPlansOfTeacher.dart';
import 'package:flutter/material.dart';

class Tabb extends StatefulWidget {
  String myprogrampageroute;
  String button1Text;
  String button2Text,SportRoute,myplansrout;

  Tabb(this.button1Text, this.button2Text,this.SportRoute,this.myplansrout);

  @override
  _TabbState createState() => _TabbState(button1Text,button2Text,SportRoute,myplansrout);
}

class _TabbState extends State<Tabb> {
  String button1Text,myplansrout;
  String button2Text,route;
  String type;
  _TabbState(this.button1Text, this.button2Text,this.route,this.myplansrout);


  Future<Null> onWillPop()async {
    String type=await gettype();
    Navigator.pushNamed(context,type=="teachers"? "/TeacherProfilePage":"/Profile");

    print("back pressed runned");

  }
  gettypee()async{
    String t=await gettype();
    setState(() {
      type=t;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettypee();
    print(route+  "  45454545454");
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child:Scaffold(
      body: Center(
        child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),

          child:Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child:  Column(
              children: <Widget>[
                Button(["myplan"],MySportPlansList(),button1Text
                  ,35.0,80.0,startcolor: Color(0xFF088B00),endcolor:Color(0xFF088B00)
                  ,marginbottom: 10.0,functioncode:route=="غذایی" ?"myfoodPlanOfTeacher":"mysportPlanOfTeacher",),
               type=="teachers"? RequestButton(Icons.add,button2Text,"قابلیت سفارشی سازی طبق آنالیز",Colors.green,route):Container(width:0 ,height: 0,),
              ],
            ),
          ),

        ),

      ),
        ) );
  }
}
