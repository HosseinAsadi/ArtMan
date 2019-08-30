
import 'package:art_man/components/Utility/Keys.dart';

import 'TeacherInfoForSearch.dart';

List<Moveslist> newMoveslist=new List();
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
filterMuscles(String value){
  for(int i=0;i<newMoveslist.length;i++){
    if(newMoveslist[i].muscles.toString()!=value)
        newMoveslist.removeAt(i);
  }
  print("new list view length :"+newMoveslist.length.toString());

}
filterTools(String value){
  for(int i=0;i<newMoveslist.length;i++){
    if(newMoveslist[i].equipment.toString()!=value)
      {
        print("removed "+newMoveslist[i].fa);
        newMoveslist.removeAt(i);
      }
  }
  print("new list view length :"+newMoveslist.length.toString());
}
MovesNumbers(){
  return newMoveslist.length;
}