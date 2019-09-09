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


List<String> days=new List();
setDays(item){
  days=item;
}
getDays(){
  return days;
}
/*
runner(){
  for(int i=0;i<10;i++){
    Foode foode=new Foode();
    foode.name="";
    foode.fill=true;
    foode.unit="${i}";
    foode.namber="dfdkjf";
    foods.add(foode);
    Meale meale=Meale();
    meale.fill=true;
    meale.name="name";
    meale.Foods.add(foode);
    mealss.add(meale);//10ta

  }
  print(mealss[mealss.length-1].Foods.length);

  Meale meale=new Meale();
  meale.fill=true;
  meale.name="name";
  meale.Foods=foods;
  mealss.add(meale);
  print(mealss[mealss.length-1].Foods.length);





}*/
