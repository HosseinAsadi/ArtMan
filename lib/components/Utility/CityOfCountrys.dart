Map<String,List<String>> citiess={"country":["citeis"]};
List<String> cities=["اصفهان","تهران","بوشهر"];

 setCountry(String country,List<String> cities){
   citiess[country]=cities ;
 }
 getCities(country){
   return citiess[country];
 }





