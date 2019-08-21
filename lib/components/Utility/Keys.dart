
class Kelid{
 static Map<String,String> key={"key":"value"};

 static setter(String id,String ctrl){
    key[id]=ctrl;
  }
 static getter(String id){
   if(key.keys.contains(id))
      return key[id];
   return "";
 }
 static getterforValidator(id){
   return key[id];
 }
 static length(){
   return key.length;
 }
}