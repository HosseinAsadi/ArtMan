
  import 'dart:convert';

List<String> digestions=new List();
  setDigestion(item){
    digestions=item;
  }
  getDigestions(){
    print(digestions.toString());
   // Digestion digestion=new Digestion(digestions);
    return jsonDecode(jsonEncode(digestions.toString()));
  }



