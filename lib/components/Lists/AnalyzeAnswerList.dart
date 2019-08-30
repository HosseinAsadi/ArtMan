

Map<String,String> AnalyzeAnswerhome={"key":"value"};

class AnalyzeAnswerhomee{
  var sex="";
  var goal;
  var history;
  var numberClassInWeek;
  var age;
  var blood;
  var bussines;
  var numberDayWork;
  var totalHoursWork;
  var lifeStyle;
  var eshteha;
  var eat;
  var exit;
  var sleep;
  var alergy;
  var digestion;
  var abnormalicy;
  var sicks;
  var medicineTest;
  var tools;
}
setterAnalyzeAnswer(String id,String ctrl){
  AnalyzeAnswerhome[id]=ctrl;
}
getAnalyzeAnswer(String id){
  return AnalyzeAnswerhome[id];
}

