import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/page/SportPlan/PlanSport.dart';
import 'package:art_man/page/SportPlan/SelectSportExtract.dart';
import 'package:art_man/page/lists/MySelectionList.dart';
import 'package:flutter/material.dart';

class MySelection extends StatefulWidget {
  String numberclass; // is real index

  MySelection({Key key, @required this.numberclass}) : super(key: key);

  @override
  _MySelectionState createState() => _MySelectionState(numberclass);
}

class _MySelectionState extends State<MySelection> {
  String numberclass;
  String navigationbarState = "add";

  _MySelectionState(this.numberclass);

  getNavigationIcon() {
    if (navigationbarState == "del") {
      return Icons.delete;
    } else if (navigationbarState == "add") {
      return Icons.add;
    } else {
      return Icons.done;
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
          builder: (context) => PlanSport(
                typeplan: 'ورزشی',
              ),
        ));

    print("back pressed runned");
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            leading: Container(
              width: 80,
              alignment: Alignment.center,
              child:Text(
                " جلسه ${int.parse(numberclass)+1}",
                style: TextStyle(color: Colors.white) ,
            ),
            ),
          ),
          body: classes[int.parse(numberclass)].moves.length == 0
              ? Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 30, left: 30, top: 30),
                    child: Text(
                      "شما هیچ حرکتی به این جلسه اضافه نکرده اید لطفا حرکات مورد نظر را اضافه کنید",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              : Center(
                  child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/background.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: new MySelectionList(numberclass,
                          this.callback,
                          color: Colors.white, radius: 30.0)),
                ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue[700],
              child: Icon(
                getNavigationIcon(),
                color: Colors.white,
              ),
              onPressed: () {
                if (navigationbarState == "done") {
                  setState(() {
                    List<Moveslist> temperory=new List();

                    for(int i=0;i<classes[int.parse(numberclass)].moves.length;i++){
                      if(classes[int.parse(numberclass)].moves[i].isselectedfor){
                        temperory.add(classes[int.parse(numberclass)].moves[i]);
                        classes[int.parse(numberclass)].moves.removeAt(i);
                      }
                    }
                    classes[int.parse(numberclass)].supersets.add(temperory);
                    navigationbarState = "add";
                    selection=false;

                  });
                }
               else if (navigationbarState == "del") {
                  setState(() {
                    for(int j=0;j<2;j++)
                    for(int i=0;i<classes[int.parse(numberclass)].moves.length;i++){
                      if(classes[int.parse(numberclass)].moves[i].isselectedfor)
                        classes[int.parse(numberclass)].moves.removeAt(i);
                    }

                    navigationbarState = "add";
                    selection=false;

                  });
                }
               else if (navigationbarState == "add") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectSportExtract(
                              numberclass: numberclass,
                            ),
                      ));
                }
              }),
        ));
  }
}
