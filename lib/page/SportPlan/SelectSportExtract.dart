
import 'package:art_man/components/Buttons/VerifyButton.dart';
import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Networking/FetchCategories.dart';
import 'package:art_man/components/Networking/FetchMoves.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/page/lists/FetchedMovesFromServer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class SelectSportExtract extends StatefulWidget {
  final String numberclass;
  SelectSportExtract({Key key, @required this.numberclass}) : super(key: key);
  @override
  _SelectSportExtractState createState() => _SelectSportExtractState(numberclass);
}

class _SelectSportExtractState extends State<SelectSportExtract> {
  bool complete=false;
  String numberclass;
  _SelectSportExtractState(this.numberclass);
  Color iconColor=  Color(0xFFEDC40A),dropdwonColor= Color(0xFFF1C60D);



  Strings strings =new Strings();
  void callback(String value,String filter) {
    setState(() {
      callbackfunction(value);
    });
  }
  getMoves()async{
    if(moves.length==0) {
      Moves movess = await fetchMoves(
          "${strings.baseurl}/admin/getsportingMoves");
      setState(() {
        Strings strings = new Strings();
        for (int i = 0; i < movess.result.length; i++) {
          Moveslist newMove = new Moveslist();
          newMove.fa = movess.result[i].fa;
          newMove.en = movess.result[i].en;
          newMove.id = movess.result[i].id;
          newMove.exercise = movess.result[i].exercise;
          newMove.equipment = movess.result[i].equipment;
          newMove.muscles = movess.result[i].muscles;
          newMove.description = movess.result[i].description;
          newMove.videourl = movess.result[i].videoURL.replaceAll(" ", "%20");
          addMove(newMove);
        }

      });
    }
    setState(() {
      complete = true;
    });
  }
  getCategories()async{
    if(equipments.length==0) {
      Categories categys = await fetchCategories(
          "${strings.baseurl}/admin/getCategories");
      setState(() {
        for (int i = 0; i < categys.equipment.length; i++) {
          Equipmente equipmente = new Equipmente();
          equipmente.fa = categys.equipment[i].fa;
          equipmente.en = categys.equipment[i].en;
          equipmente.id = categys.equipment[i].id;
          equipmentes.add(equipmente);
          equipments.add(categys.equipment[i].fa);
        }
        for (int i = 0; i < categys.exercise.length; i++) {
          Exercisee musclee = new Exercisee();
          musclee.fa = categys.exercise[i].fa;
          musclee.en = categys.exercise[i].en;
          musclee.id = categys.exercise[i].id;
          exercisees.add(musclee);
          exercises.add(categys.exercise[i].fa);
        }
        for (int i = 0; i < categys.muscles.length; i++) {
          Musclee musclee = new Musclee();
          musclee.fa = categys.muscles[i].fa;
          musclee.en = categys.muscles[i].en;
          musclee.id = categys.muscles[i].id;
          muscleses.add(musclee);
          muscles.add(categys.muscles[i].fa);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCategories();
    getMoves();

  }



  @override
  Widget build(BuildContext context) {
    double width =50.0,height=50.0;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF7FC81D),
        actions: <Widget>[
          Center(
            child: InkWell(
              onTap: (){
                setState(() {
                  moves.clear();
                  getMoves();
                  Kelid.setter("searchExercise", "");
                });
              },
              child:Container(
                height: 45,
               alignment: Alignment.centerRight,
               margin: EdgeInsets.only(right: 20),
                child: Text(
                  "تنظیم مجدد         ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w500),
                ),
              )
            ),
          ),
        ],
        title: Text(
          "انتخاب برنامه ورزشی",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),

      body: Center(
        child: Container(
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
                  margin:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  child: Form(
                    // key: _key,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 120,
                          child: Container(
                            padding: EdgeInsets.only(right: 10),

                            margin: EdgeInsets.only(left: 8, right: 8,top: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTapDown: (details){
                                    setState(() {
                                      iconColor=Color(0xFFEDC40A).withOpacity(0.2);
                                    });

                                  },
                                  onTapUp: (details){
                                    setState(() {
                                      iconColor=Color(0xFFEDC40A);
                                    });

                                  },
                                  onTap: (){

                                    setState(() {
                                      filterMoves();
                                      FocusScope.of(context).requestFocus(new FocusNode());
                                    });

                                  },
                                  child: AnimatedContainer(
                                    width: width,
                                    height: height,
                                    duration: Duration(microseconds: 2000),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: iconColor, width: 2),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Icon(Icons.search,size: 40, color: iconColor),
                                  ),
                                ),
                                Expanded(
                                    child:Container(

                                        margin: EdgeInsets.all(4),
                                        child: InputText("جستوجو بر اساس نام تمرینات...",
                                          "searchExercise",height: 140.0,hintconlor: Colors.green,brdercolor: Colors.grey[300],fontWeight: FontWeight.w600,hintsize: 16,)

                                    )

                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        DropDown("field_sport",exercises,
                          "رشته ورزشی",
                          backgroundColor: dropdwonColor,
                          fontcolor: Colors.black,
                          arrowcolor: Colors.black,
                          callback: this.callback,
                        ),

                        SizedBox(height: 5,),
                        DropDown("muscle group",muscles,
                          "گروه عضلانی",
                          backgroundColor: dropdwonColor,
                          fontcolor: Colors.black,
                          arrowcolor: Colors.black,
                          callback: this.callback,
                        ),
                        SizedBox(height: 5,),

                        DropDown("sport tools",equipments,
                          "تجهیزات ورزشی",
                          backgroundColor: dropdwonColor,
                          fontcolor: Colors.black,
                          arrowcolor: Colors.black,
                          callback: this.callback,
                        ),
                        Container(
                            height: 300,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: complete?new FetchedMovesFromServer(numberclass,color: Colors.green,radius: 30.0):
                                Text("    در حال دریافت لیست حرکات...   ",style: TextStyle(color: Colors.blue),)

                        ),
                        VerifyButton(numberclass,"/MovesInClassroom","تایید موقت",30.0,10.0,width: 100.0,functioncode: "justverify",)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}