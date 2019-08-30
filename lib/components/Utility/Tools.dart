

class Tool{
  String persianName;
  bool  selection;
  String englishName;
  Map<String, dynamic> toJson() {
    return {
      'persianName': persianName,
      'selection': selection,
      'englishName': englishName
    };

  }

}

  List<Tool> tools=new List();
  setTool(tool){
    tools.add(tool);
  }
toolsLength(){
  return tools.length;
}
updatetool(index,goal){
  tools[index]=goal;
}
getTool(index){
  return tools[index];
}
getAllTools(){
    return tools;
}

//edit for test must a little edit
