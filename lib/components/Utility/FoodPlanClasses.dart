class Plan{
  String name;
  List<String> days;
  String des;
  List<Meale> Meals;
  bool fill=false;
}

class Meale{
  String name;
  List<Food> Foods;
  bool fill=false;
}

class Food{
  String name;
  String unit;
  String namber;
  bool fill=false;
}
List<Plan> plans=new List();
List<Meale> meals=new List();
List<Food> foods=new List();

List<String> days=new List();
setDays(item){
  days=item;
}
getDays(){
  return days;
}