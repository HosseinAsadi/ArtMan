

class MyPlan{
  String forday;
  List<Plan> plans;


  MyPlan._({ this.forday,this.plans});
  factory MyPlan.fromJson(Map jsonMap) {
    return new MyPlan._(
      forday : jsonMap['forday'] ,
      plans : (jsonMap['plans']as List).map((i) => Plan.fromJson(i)).toList(),

    );
  }
}

class Plan{
  String name;
  String desc;
  List<String> days;
  List<Meal> meals;


  Plan._({ this.name,this.desc,this.meals,this.days});
  factory Plan.fromJson(Map jsonMap) {
    return new Plan._(
      name : jsonMap['name'] ,
      desc : jsonMap['desc'] ,
      days : (jsonMap['plans'].cast<String>()),
      meals: (jsonMap['meals']as List).map((i) => Meal.fromJson(i)).toList(),

    );
  }
}
class Meal{
  String number_meal;
  String name;
  List<Khorak> khoraks;
  Meal._({ this.name,this.number_meal,this.khoraks});
  factory Meal.fromJson(Map jsonMap) {
    return new Meal._(
      name : jsonMap['name'] ,
      number_meal : jsonMap['number_meal'] ,
      khoraks: (jsonMap['khoraks']as List).map((i) => Khorak.fromJson(i)).toList(),

    );
  }
}

class Khorak{
  String eat;
  String number;
  String unit;
  Khorak._({ this.eat,this.number,this.unit});
  factory Khorak.fromJson(Map jsonMap) {
    return new Khorak._(
      eat : jsonMap['eat'] ,
      number : jsonMap['number'] ,
      unit : jsonMap['unit'] ,

    );
  }
}