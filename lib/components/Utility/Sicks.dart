
class Sick{
  String name;
  bool  selection;
  String description;

  Map<String, dynamic> toJsonAttr() => {
    'name': name,
    'selection': selection,
    'description': description
  };
}
  List<Sick> sickss=new List();
  setSick(sick){
    sickss.add(sick);

  }
  sickLength(){
    return sickss.length;
  }
  updateSick(index,sick){
    sickss[index]= sick;
  }
  getSick(index){
    return sickss[index];
  }
  getAllSicks(){
    return sickss;
  }

