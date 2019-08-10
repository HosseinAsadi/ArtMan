
class HoursFormat{
  static hoursFormat(savevlue){
    int second,minut,hours;
    String rslt="";
    second = (savevlue.toInt() % 60);
    minut = (savevlue / 60).toInt();
    hours=(savevlue / 3600).toInt();

    if(hours<10){
      rslt+="0"+hours.toString();
    }
    else{
      rslt+=hours.toString();

    }
    rslt+=":";
    if(minut<10){
      rslt+="0"+minut.toString();
    }
    else{
      rslt+=minut.toString();

    }
    rslt+=":";
    if(second<10){
      rslt+="0"+second.toString();
    }
    else{
      rslt+=second.toString();

    }
    return rslt;
  }
}