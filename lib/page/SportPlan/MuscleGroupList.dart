import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Lists/BuildGrid.dart';
import 'package:art_man/components/Utility/Categorylist.dart';
import 'package:flutter/material.dart';

class MuscleGroupList extends StatefulWidget {
  @override
  _StateMuscleGroupList createState() => _StateMuscleGroupList();
}

class _StateMuscleGroupList extends State<MuscleGroupList> {
  double width=30,height=30;
  static final showGrid = true; // Set to false to show ListView
  BuildGrid _buildGrid =new BuildGrid(200.0,2.0,2.0,250.0,13,8,state=="muscle"?muscles:tools,
      Color(0xFFF71C105),Colors.white,);

  void initState() {
    super.initState();
    getCategories();
  }
  Future<Null> onWillPop() {
    switch(state){
      case "tools":{
        setState(() {
          state="muscle";
        });
        Navigator.pushNamed(context, "/MuscleGroupList");
        break;
      }
      case "muscle":{
        setState(() {
          state="fields";
        });
        Navigator.pushNamed(context, "/SportField");
        break;
      }

    }

  }
  @override
  Widget build(BuildContext context) {


    return  new WillPopScope(
        onWillPop: onWillPop,
        child:Scaffold(
      appBar: new AppBar(flexibleSpace:  SizedBox(
      height: 80,
      child: Container(
        padding: EdgeInsets.only(right: 10),

        margin: EdgeInsets.only(left: 8, right: 8,top: 30,bottom: 4),
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
    ), backgroundColor: Color(0xFF088B00),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child:_buildGrid),
      ),

        ) );
  }
}








