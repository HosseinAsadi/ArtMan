
import 'package:art_man/components/Utility/ListMoves.dart';

import 'TeacherInfoForSearch.dart';
List<Classroom> classes=new List();

class Classroom{
  String numberclass;
  String nameclass;
  List<Moveslist> moves;
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