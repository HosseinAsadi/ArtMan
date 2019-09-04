import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/SportPlan/PlanSport.dart';
import 'package:art_man/page/SportPlan/SelectSportExtract.dart';
import 'package:art_man/page/lists/ListviewOfClass.dart';
import 'package:flutter/material.dart';


class MovesInClassroom extends StatefulWidget {
  String numberclass;

  MovesInClassroom({Key key, @required this.numberclass}) : super(key: key);

  @override
  _MovesInClassroomState createState() => _MovesInClassroomState(numberclass);
}

class _MovesInClassroomState extends State<MovesInClassroom> {
  String text;
  String navigationbarState="add";

  _MovesInClassroomState(this.text);

  List<Moveslist> movess=new List();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < getClassrommslength(); i++) {

      if (classes[i].numberclass == text) {

        setState(() {
          movess = classes[i].moves==null?movess:classes[i].moves;
        });
      }
    }
  }

  void callback(String state) {
    setState(() {
      this.navigationbarState = state;
    });
  }
  Future<Null> onWillPop() {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => PlanSport(typeplan: 'ورزشی',),
    ));

    print("back pressed runned");
    /*
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;*/
  }
  @override
  Widget build(BuildContext context) {
    return   new WillPopScope(
        onWillPop: onWillPop,
        child:Scaffold(
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
          child:  new ListViewClass(this.callback, movess,color: Colors.white,radius: 30.0,id: "sports",classnumber:text)

        ),
      ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[700],
          child: Icon(
          navigationbarState=="del"? Icons.delete:  Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            if(navigationbarState=="done") {
              //add to super sets
            }
            if(navigationbarState=="del") {
              print("${int.parse(text)-1},$selectionMovesForRemove");

              deleteMoveFromClassroom(int.parse(text)-1,selectionMovesForRemove);
              setState(() {
                movess=classes[int.parse(text)-1].moves;
              });

            }
    if(navigationbarState=="add") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SelectSportExtract(
                          numberclass: text,
                        ),
                  ));
            }
          }),
    ));
  }
}
