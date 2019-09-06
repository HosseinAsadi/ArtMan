
  import 'dart:convert';

List<String> abnormalacy=new List();
  setAbnormalacy(item){
    abnormalacy=item;
  }
  getAbnormalacys(){
    return jsonDecode(jsonEncode(abnormalacy.toString()));
  }
