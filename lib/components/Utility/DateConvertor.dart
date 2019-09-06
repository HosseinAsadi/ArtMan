
getPersianDate(String date){
  print(date);
  List<String> persiandate=new List();
  persiandate=date.split("/");
  print(persiandate);
  switch(persiandate[1]){
    case "1":
      {
        persiandate[1]="فروردین";
        break;
      }
    case "2":
      {
        persiandate[1]="اردیبهشت";
        break;
      }case "3":
    {
      persiandate[1]="خرداد";
      break;
    }case "4":
    {
      persiandate[1]="تیر";
      break;
    }case "5":
    {
      persiandate[1]="مرداد";
      break;
    }case "6":
    {
      persiandate[1]="شهریور";
      break;
    }case "7":
    {
      persiandate[1]="مهر";
      break;
    }case "8":
    {
      persiandate[1]="آبان";
      break;
    }case "9":
    {
      persiandate[1]="آذر";
      break;
    }case "10":
    {
      persiandate[1]="دی";
      break;
    }case "11":
    {
      persiandate[1]="بهمن";
      break;
    }case "12":
    {
      persiandate[1]="اسفند";
      break;
    }
  }
  return persiandate;
}