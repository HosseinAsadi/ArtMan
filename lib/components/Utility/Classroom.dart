
import 'package:art_man/components/Utility/ListMoves.dart';

import 'TeacherInfoForSearch.dart';
List<Classroom> classes=new List();
Indexs indexs=new Indexs();
String navigationbottomState="add";
List<int> selectionMovesForRemove=new List();
class Classroom{
  String numberclass;
  String nameclass;
  List<Moveslist> moves;
}
class Moveslist{
  String fa;
  String en;
  String id;
  String videourl;
  String description;
  int exercise;
  int muscles;
  int equipment;
  bool isselected=false;
  bool optionfilled=false;
  bool selectfordelete=false;
  Optionss options;
}
class Musclee{
  String fa;
  String en;
  int id;
}
class Exercisee{
  String fa;
  String en;
  int id;
}
class Equipmente{
  String fa;
  String en;
  int id;
}

class Optionss{
   String rest;
   String set;
   String repeat;
   String second;
   String colory;
   String meter;
   String exersiceSystem;
   String tempo;
   String rm_one;
   String des;
}

class Indexs{
  String currentindexofclass;
  String currentindexofmove;
}

setCurrentIndex(classroom,move){

  indexs.currentindexofclass=classroom;
  indexs.currentindexofmove=move;
}
getclassroom(){
  return int.parse(indexs.currentindexofclass);
}
getmoveindex(){
  return int.parse(indexs.currentindexofmove);
}
deleteMoveFromClassroom(classroomindex,List<int> indexs){


  for(int i=0;i<indexs.length;i++){

    classes[classroomindex].moves.removeAt(indexs[i]);
  }
  print("removed");

  //
}
getClassrommslength(){
  return classes.length;
}

addUpdateclasses(String numberclass,nameclass ,moves){
  if(numberclass.length<=int.parse(numberclass)){
    List<Moveslist> mov=new List();
    for(int i=0;i<MovesNumbers();i++){
      if(newMoveslist[i].isselected)
        mov.add(newMoveslist[i]);
    }

    Classroom classroom=new Classroom();
    classroom.numberclass=numberclass;
    classroom.nameclass=nameclass;
    classroom.moves=mov;

    classes[int.parse(numberclass)-1]=classroom;
  }
  else{
    Classroom classroom=new Classroom();
    classroom.numberclass=numberclass;
    classroom.nameclass=nameclass;
    classroom.moves=moves;
    classes.add(classroom);
  }

}