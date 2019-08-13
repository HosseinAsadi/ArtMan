import 'package:art_man/components/Utility/Keys.dart';

class Validator{
 static isvalid(List<String> list){
   if(list.length>0)
   for(int i=0;i<list.length;i++){
     if(Kelid.getter(list[i])==null || Kelid.getter(list[i])==""){
       return false;
     }
   }
   return true;
 }
}