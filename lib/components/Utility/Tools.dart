

class Tool{
  String persianName;
  bool  selection;
  String englishName;
  Map<String, dynamic> toJson() => {
    'persianName': persianName,
    'selection': selection,
    'englishName': englishName
  };
}

  List<Tool> tools=new List();
  setTool(tool){
    tools.add(tool);
  }
getAllTools(){
    return tools;
}