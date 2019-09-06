import 'package:art_man/components/Buttons/VerifyButton.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Networking/FetchCategories.dart';
import 'package:art_man/components/Networking/FetchMoves.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/ListMoves.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/page/lists/ListviewOFMoves.dart';
import 'package:flutter/material.dart';

class SelectSportExtract extends StatefulWidget {
  final String numberclass;
  SelectSportExtract({Key key, @required this.numberclass}) : super(key: key);
  @override
  _SelectSportExtractState createState() => _SelectSportExtractState(numberclass);
}

class _SelectSportExtractState extends State<SelectSportExtract> {
  String numberclass;
  _SelectSportExtractState(this.numberclass);
  Color iconColor=  Color(0xFFEDC40A),dropdwonColor= Color(0xFFF1C60D);

  List<Moveslist> myMoves=new List();
  List<Moveslist> filtertools=new List();
  List<Moveslist> filtermuscls=new List();
  List<Moveslist> filterexercise=new List();
  List<Moveslist> oldmovess=new List();
  List<Musclee> muscleses=new List();
  List<Exercisee> exercisees=new List();
  List<Equipmente> equipmentes=new List();
  List<String> equipments=new List();
  List<String> muscles=new List();
  List<String> exercises=new List();

  Strings strings =new Strings();
  void callback(String value,String filter) {
    setState(() {
        myMoves=oldmovess;//return total list
        if(filter=="sport tools")//filter base on tools
        {
          print("callback runned");
          for(int j=0;j<equipmentes.length;j++){

            if(equipmentes[j].fa==value){
              for(int i=0;i<myMoves.length;i++){
              if(myMoves[i].equipment==equipmentes[j].id) {
                filtertools.add(myMoves[i]);
              }

            }
          }
        }
      }
        if(filter=="field_sport")//filter base on tools
            {
          for(int j=0;j<exercisees.length;j++){

            if(exercisees[j].fa==value){
              for(int i=0;i<myMoves.length;i++){
                if(myMoves[i].exercise==exercisees[j].id) {
                  filterexercise.add(myMoves[i]);
                }

              }
            }
          }
        }
        if(filter=="muscle group")//filter base on tools
            {
          for(int j=0;j<muscleses.length;j++){

            if(muscleses[j].fa==value){
              for(int i=0;i<myMoves.length;i++){
                print(myMoves[i].muscles);
                print(muscleses[j].id);
                print("**********************");
                if(myMoves[i].muscles==muscleses[j].id) {
                  filtermuscls.add(myMoves[i]);
                }

              }
            }
          }
          print(filtermuscls.length);
        }//every filters operate
      // operate on base list
        myMoves.clear();
      for(int i=0;i<oldmovess.length;i++){
        for(int j=0;j<filtermuscls.length;j++){
          if(oldmovess[i].muscles==filtermuscls[j].muscles){
            myMoves.add(oldmovess[i]);
          }
        }

      }
        for(int i=0;i<oldmovess.length;i++) {
          for (int j = 0; j < filterexercise.length; j++) {
            if (oldmovess[i].exercise == filterexercise[j].exercise) {
              myMoves.add(oldmovess[i]);
            }
          }
        }
        for(int i=0;i<oldmovess.length;i++) {
          for (int j = 0; j < filtertools.length; j++) {
            if (oldmovess[i].muscles == filtertools[j].equipment) {
              myMoves.add(oldmovess[i]);
            }
          }
        }
    });
  }

  getMoves()async{
   Moves movess=await fetchMoves("${strings.baseurl}/admin/getsportingMoves");
   setState(() {
     for(int i=0;i<movess.result.length;i++){
       Moveslist teacherInfo=new Moveslist();
       teacherInfo.fa=movess.result[i].fa;
       teacherInfo.en=movess.result[i].en;
       teacherInfo.id=movess.result[i].id;
       teacherInfo.exercise=movess.result[i].exercise;
       teacherInfo.equipment=movess.result[i].equipment;
       teacherInfo.muscles=movess.result[i].muscles;
       teacherInfo.description=movess.result[i].description;
       teacherInfo.videourl="${strings.baseurl}/videos/${movess.result[i].videoURL}";
       myMoves.add(teacherInfo);
       oldmovess.add(teacherInfo);

     }

    /* if(classes[(int.parse(numberclass)-1)].moves.length!=0){
       myTeachers.clear();
       myTeachers=
     }*/
   });
  }
  getCategories()async{

   Categories categys= await fetchCategories("${strings.baseurl}/admin/getCategories");
   setState(() {

    for(int i=0;i<categys.equipment.length;i++){
      Equipmente equipmente=new Equipmente();
      equipmente.fa=categys.equipment[i].fa;
      equipmente.en=categys.equipment[i].en;
      equipmente.id=categys.equipment[i].id;
      equipmentes.add(equipmente);
      equipments.add(categys.equipment[i].fa);
    }
    for(int i=0;i<categys.exercise.length;i++){
      Exercisee musclee=new Exercisee();
      musclee.fa=categys.exercise[i].fa;
      musclee.en=categys.exercise[i].en;
      musclee.id=categys.exercise[i].id;
      exercisees.add(musclee);
      exercises.add(categys.exercise[i].fa);
    }
    for(int i=0;i<categys.muscles.length;i++){
      Musclee musclee=new Musclee();
      musclee.fa=categys.muscles[i].fa;
      musclee.en=categys.muscles[i].en;
      musclee.id=categys.muscles[i].id;
      muscleses.add(musclee);
      muscles.add(categys.muscles[i].fa);
    }

   });

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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectSportExtract(numberclass: numberclass,)));
                });
              },
              child: Text(
                "تنظیم مجدد         ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
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
                        filterMoves(oldmovess);

                      });

                    },
                       child: SizedBox(
                          height: 160,
                          child: Container(
                            padding: EdgeInsets.only(right: 10),

                            margin: EdgeInsets.only(left: 8, right: 8,top: 30),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: <Widget>[


                                   AnimatedContainer(
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

                                Expanded(
                                    child:Container(
                                        margin: EdgeInsets.all(4),
                                        child: InputText("جستوجو بر اساس نام تمرینات...",
                                          "searchExercise",height: 40.0,hintconlor: Colors.green,brdercolor: Colors.grey[300],fontWeight: FontWeight.w600,hintsize: 16,)

                                    )

                                )
                              ] ), ),),),


                        SizedBox(height: 15,),

                        DropDown("field_sport",exercises,
                          "رشته ورزشی",
                          backgroundColor: dropdwonColor,
                          fontcolor: Colors.black,
                          arrowcolor: Colors.black,
                          callback: this.callback,
                        ),

                        SizedBox(height: 10,),

                        DropDown("muscle group",muscles,
                          "گروه عضلانی",
                          backgroundColor: dropdwonColor,
                          fontcolor: Colors.black,
                          arrowcolor: Colors.black,
                          callback: this.callback,
                        ),

                        SizedBox(height: 10,),

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
                          child: new ListViewMoves(myMoves,color: Colors.green,radius: 30.0,id: "sports",)

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
  filterMoves(List<Moveslist> oldmoves){
    myMoves.clear();
    for(int i=0;i<oldmoves.length;i++){
      if(oldmoves[i].fa.contains(Kelid.getter("searchExercise")) ||
          oldmoves[i].en.contains(Kelid.getter("searchExercise")))
        myMoves.add(oldmoves[i]);
    }
    setState(() {
      FocusScope.of(context).requestFocus(new FocusNode());
    });

  }
}
