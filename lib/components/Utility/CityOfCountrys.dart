
class CityOfCountrys{
  Map<String,List<String>> citiess={"country":["citeis"]};
 setCountry(String country,List<String> cities){
   citiess[country]=cities ;
 }
 getCities(country){
   return citiess[country];
 }
}




