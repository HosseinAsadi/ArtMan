import 'package:art_man/components/Utility/Keys.dart';

class Validator{
  isvalid(List<String> list){
   if(list.length>0)
   for(int i=0;i<list.length;i++){
     if(Kelid.getterforValidator(list[i])==null || Kelid.getterforValidator(list[i])==""){
       return false;
     }
   }
   return true;
 }
}