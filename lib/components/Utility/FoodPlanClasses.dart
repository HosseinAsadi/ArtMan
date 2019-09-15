

class Plan{
  String name;
  List<String> days;
  String des;
  List<Meale> Meals=new List();
}

class Meale{
  String name;
  List<Foode> Foods=new List();
}

class Foode{
  String name;
  String unit;
  String namber;
}

List<Plan> plans=new List();
int counter=1;

List<String> days=new List();
setDays(item){
  days=item;
}
getDays(){
  return days;
}

