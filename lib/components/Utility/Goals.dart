

class Goal{
  String name;
  bool  selection;
  String description;
  Map<String, dynamic> toJson() => {
    'name': name,
    'selection': selection,
    'description': description
  };
}
  List<Goal> goals=new List<Goal>();
  setGoal(sick){
    goals.add(sick);
    print("set goal called"+goalLength().toString());
  }
  goalLength(){
   return goals.length;
  }
  updategoal(index,goal){
  goals[index]=goal;
 }
getGoal(index){
  return goals[index];
}
getAllGoals(){
  return goals;
}
