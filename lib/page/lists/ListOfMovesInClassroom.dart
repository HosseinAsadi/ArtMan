import 'package:art_man/components/Buttons/VerifyButton.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/page/SportPlan/SelectSportExtract.dart';
import 'package:art_man/page/lists/ListviewOfClass.dart';
import 'package:flutter/material.dart';

import 'ListviewOFMoves.dart';

class MovesInClassroom extends StatefulWidget {
  String numberclass;

  MovesInClassroom({Key key, @required this.numberclass}) : super(key: key);

  @override
  _MovesInClassroomState createState() => _MovesInClassroomState(numberclass);
}

class _MovesInClassroomState extends State<MovesInClassroom> {
  String text;

  _MovesInClassroomState(this.text);

  List<Moveslist> movess=new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < getClassrommslength(); i++) {
      print(classes[i].numberclass+"     ");
      print(getClassrommslength().toString()+"  number class that inputted is"+ text);
      if (classes[i].numberclass == text) {
        print("condidation accepted");
        setState(() {
          movess = classes[i].moves==null?movess:classes[i].moves;
        });
        print("new moves lenght"+movess.length.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Text(
        " جلسه$text",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:  movess.length == 0
                  ? Center(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 30, left: 30,top: 30),
                        child: Text(
                          "شما هیچ حرکتی به این جلسه اضافه نکرده اید لطفا حرکات مورد نظر را اضافه کنید",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    )
                  :Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:  new ListViewClass( movess,color: Colors.white,radius: 30.0,id: "sports",)

        ),
      ),


     // new ListViewMoves(newlistsearch:movess,color: Colors.green,radius: 30.0,id:"moves in class",),



        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[700],
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectSportExtract(
                        numberclass: text,
                      ),
                ));
          }),
    );
  }
}
