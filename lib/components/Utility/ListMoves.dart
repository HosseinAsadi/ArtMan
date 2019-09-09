
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/Keys.dart';

import 'TeacherInfoForSearch.dart';
List<Moveslist> filtertools=new List();
List<Moveslist> filtermuscls=new List();
List<Moveslist> filterexercise=new List();
List<Moveslist> newMoveslist=new List();
List<Moveslist> oldmovess=new List();
List<Musclee> muscleses=new List();
List<Exercisee> exercisees=new List();
List<Equipmente> equipmentes=new List();
List<String> equipments=new List();
List<String> muscles=new List();
List<String> exercises=new List();

setnewList(List<Moveslist> newlist){
  newMoveslist=newlist;
}
getMoveList(){
  return newMoveslist;
}
addMove(move){
  newMoveslist.add(move);
}

clearAllmoves(){
  newMoveslist.clear();
}
getoneMove(i){
  return newMoveslist[i];
}


filterMoves(List<Moveslist> oldmoves){
  clearAllmoves();
  for(int i=0;i<oldmoves.length;i++){
    if(oldmoves[i].fa.contains(Kelid.getter("searchExercise")) ||
        oldmoves[i].en.contains(Kelid.getter("searchExercise")))
      addMove(oldmoves[i]);
  }
}
void callbackfunction(String value,String filter) {

  oldmovess=getMoveList();
    if(filter=="sport tools")//filter base on tools
        {
      print("callback runned");
      for(int j=0;j<equipmentes.length;j++){

        if(equipmentes[j].fa==value){
          for(int i=0;i<oldmovess.length;i++){
            if(oldmovess[i].equipment==equipmentes[j].id) {
              filtertools.add(oldmovess[i]);
            }

          }
        }
      }
    }
    if(filter=="field_sport")//filter base on tools
        {
      for(int j=0;j<exercisees.length;j++){

        if(exercisees[j].fa==value){
          for(int i=0;i<oldmovess.length;i++){
            if(oldmovess[i].exercise==exercisees[j].id) {
              filterexercise.add(oldmovess[i]);
            }

          }
        }
      }
    }
    if(filter=="muscle group")//filter base on tools
        {
      for(int j=0;j<muscleses.length;j++){

        if(muscleses[j].fa==value){
          for(int i=0;i<oldmovess.length;i++){
            print(oldmovess[i].muscles);
            print(muscleses[j].id);
            print("**********************");
            if(oldmovess[i].muscles==muscleses[j].id) {
              filtermuscls.add(oldmovess[i]);
            }

          }
        }
      }
      print(filtermuscls.length);
    }//every filters operate
    // operate on base list
    oldmovess.clear();
    for(int i=0;i<oldmovess.length;i++){
      for(int j=0;j<filtermuscls.length;j++){
        if(oldmovess[i].muscles==filtermuscls[j].muscles){
          addMove(oldmovess[i]);
        }
      }

    }
    for(int i=0;i<oldmovess.length;i++) {
      for (int j = 0; j < filterexercise.length; j++) {
        if (oldmovess[i].exercise == filterexercise[j].exercise) {
          addMove(oldmovess[i]);
        }
      }
    }
    for(int i=0;i<oldmovess.length;i++) {
      for (int j = 0; j < filtertools.length; j++) {
        if (oldmovess[i].muscles == filtertools[j].equipment) {
          addMove(oldmovess[i]);
        }
      }
    }

}
MovesNumbers(){
  return newMoveslist.length;
}