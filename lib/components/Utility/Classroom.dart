
import 'Keys.dart';

List<Classroom> classes = new List();
List<Moveslist> moves = new List();

String navigationbottomState = "add";

List<Musclee> muscleses = new List();
List<Exercisee> exercisees = new List();
List<Equipmente> equipmentes = new List();
List<String> equipments = new List();
List<String> muscles = new List();
List<String> exercises = new List();
bool selection = false;

class Classroom {
  String nameclass;
  List<Moveslist> moves = new List();
  List<List<Moveslist>> supersets = new List();
}

class Moveslist {
  String fa;
  String en;
  String id;
  int done;
  String videourl;
  String description;
  int exercise;
  int muscles;
  int equipment;
  bool isselected = false;
  bool isselectedfor = false;

  bool optionfilled = false;
  Optionss options;
}

class Musclee {
  String fa;
  String en;
  int id;
}

class Exercisee {
  String fa;
  String en;
  int id;
}

class Equipmente {
  String fa;
  String en;
  int id;
}

class Optionss {
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

class Indexs {
  String currentindexofclass;
  String currentindexofmove;
}

addMove(move) {
  moves.add(move);
}




deleteMoveFromClassroom(classroomindex, List<int> indexs) {
  for (int i = 0; i < indexs.length; i++) {
    classes[classroomindex].moves.removeAt(indexs[i]);
  }
  print("removed");

  //
}

getClassrommslength() {
  return classes.length;
}

Updateclasses() {
  for (int i = 0; i < moves.length; i++) {
    if (moves[i].isselected) {
      Moveslist moveslist=new Moveslist();
      moveslist.isselectedfor=moves[i].isselectedfor;
      moveslist.isselected=moves[i].isselected;
      moveslist.optionfilled=moves[i].optionfilled;
      moveslist.exercise=moves[i].exercise;
      moveslist.equipment=moves[i].equipment;
      moveslist.videourl=moves[i].videourl;
      moveslist.en=moves[i].en;
      moveslist.fa=moves[i].fa;
      moveslist.muscles=moves[i].muscles;
      moveslist.description=moves[i].description;
      Optionss optionss=new Optionss();
      moveslist.options=optionss;
      classes[classes.length - 1].moves.add(moveslist);
    }


  }
}

filterMoves() {
  List<Moveslist> temp = new List();

  for (int i = 0; i < moves.length; i++) {
    if (moves[i].fa.contains(Kelid.getter("searchExercise")) ||
        moves[i].en.contains(Kelid.getter("searchExercise")))
      temp.add(moves[i]);
  }
  moves.clear();
  moves = temp;
}

int extract, muscle, tools;

void callbackfunction(String value) {
  List<Moveslist> temp=new List();
  List<Moveslist> oldmovess =moves;

  for (int j = 0; j < equipmentes.length; j++) {
    if (equipmentes[j].fa == value) {
      tools = equipmentes[j].id;
    }
  }

  for (int j = 0; j < exercisees.length; j++) {
    if (exercisees[j].fa == value) {
      extract = exercisees[j].id;
    }
  }

  for (int j = 0; j < muscleses.length; j++) {
    if (muscleses[j].fa == value) {
      muscle = muscleses[j].id;
    }
  }

  for (int i = 0; i < oldmovess.length; i++) {
    if (muscle != null &&
        tools == null &&
        extract == null) if (oldmovess[i].muscles == muscle) {
      temp.add(oldmovess[i]);
    }

    if (extract != null &&
        tools == null &&
        muscle == null) if (oldmovess[i].exercise == extract) {
      temp.add(oldmovess[i]);
    }

    if (extract == null &&
        tools != null &&
        muscle == null) if (oldmovess[i].equipment == tools) {
      temp.add(oldmovess[i]);
    }
//--------------------------------------------------------------------------------------------------------
    if (muscle != null && tools != null && extract == null) if (oldmovess[i]
                .muscles ==
            muscle &&
        oldmovess[i].equipment == tools) {
      temp.add(oldmovess[i]);
    }

    if (muscle != null && tools == null && extract != null) if (oldmovess[i]
                .muscles ==
            muscle &&
        oldmovess[i].exercise == extract) {
      temp.add(oldmovess[i]);
    }

    if (extract != null && tools != null && muscle == null) if (oldmovess[i]
                .equipment ==
            tools &&
        oldmovess[i].exercise == extract) {
      temp.add(oldmovess[i]);
    }
    if (oldmovess[i].equipment == tools &&
        oldmovess[i].exercise == extract &&
        oldmovess[i].muscles == muscle) temp.add(oldmovess[i]);
  }
  moves.clear();
  moves=temp;
}
