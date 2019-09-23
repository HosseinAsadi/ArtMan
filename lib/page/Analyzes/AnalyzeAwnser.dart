import 'package:art_man/components/Networking/AnayzeResult.dart';
import 'package:art_man/components/Networking/FetchAnalyzeReslulte.dart';
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/fetchTeacherProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/GetTeachersList.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Widgets/BackgroandwithListview.dart';
import 'package:art_man/components/Widgets/Driver.dart';
import 'package:flutter/material.dart';

class AnalyzeResult extends StatefulWidget {
  String index;
  String date;
  String username;
  AnalyzeResult({Key key,this.index,this.date,this.username}) : super(key: key);
  @override
  _AnalyzeResultState createState() => _AnalyzeResultState(index,date,username);
}


class _AnalyzeResultState extends State<AnalyzeResult> {
  String index;
  int sex;
  String username;

  int weight,hr,tee,ideal;
  double bmi,whr,bai,bf;
  String date,name;
  bool complete=false;
  _AnalyzeResultState(this.index,this.date,this.username);

  _getInformation() async {

   print(username);
    StdProfile info = await GetLocation.fetchProfilestudent(
        "${strings.baseurl}/users/getUser/$username");

    setState(() {
      setState(() {
        name = info.result[0].firstname;

      });


    });
  }
  getresult()async{

    AnalyzeAnswers analyzeAnswe = (await fetchAnalyzeReslult("${strings.baseurl}/analyze/getFromUser/$username")) ;
    setState(() {
    weight = analyzeAnswe.result[int.parse(index)].outcomes.ibw;
    bmi = analyzeAnswe.result[int.parse(index)].outcomes.bmi;
    whr = analyzeAnswe.result[int.parse(index)].outcomes.whr;
     bai= analyzeAnswe.result[int.parse(index)].outcomes.bai;
    bf = analyzeAnswe.result[int.parse(index)].outcomes.bf;
    hr = analyzeAnswe.result[int.parse(index)].outcomes.hr;
    tee = analyzeAnswe.result[int.parse(index)].outcomes.tee;
    ideal = analyzeAnswe.result[int.parse(index)].outcomes.ideals.weight;
    });
   complete=true;
  }

  getBFType(){
    if(sex==0){

      if(bf>=0.03 && bf<=0.05){
        return "Essential fat";
      }
      if(bf>=0.06 && bf<=0.13 ){
        return "athletes";
      }
      if(bf>=0.14 && bf<=0.17 ){
        return "fitness";
      }
      if(bf>=0.18 && bf<=0.24){
        return "average";
      }
      if(bf>=0.25 ){
        return "obese";
      }
      else{
        return "اطلاعات داده شده نامعتبر است";
      }
    }
    else{
      if(bf>=0.10 && bf<=0.13){
        return "Essential fat";
      }
      if(bf>=0.14 && bf<=0.20 ){
        return "athletes";
      }
      if(bf>=0.21 && bf<=0.24 ){
        return "fitness";
      }
      if(bf>=0.25 && bf<=0.31){
        return "average";
      }
      if(bf>=0.32 ){
        return "obese";
      }
      else{
        return "اطلاعات داده شده نامعتبر است";
      }
    }

  }
  getBAIType(){
    if(sex==0){
      if(bai<=0.08){
        return "کمبود وزن";
      }
      if(bai>=0.08 && bai<0.19){
        return "سالم";
      }
      if(bai>0.19 && bai<=0.25 ){
        return "اضافه وزن";
      }
      if(bai>0.25  ){
        return "چاق";
      }
      else{
        return "اطلاعات داده شده نامعتبر است";
      }
    }
    else{
      if(bai<=0.21){
        return "کمبود وزن";

      }
      if(bai>=0.21 && bai<0.33){
        return "سالم";

      }
      if(bai>0.33 && bai<=0.39 ){
        return "اضافه وزن";

      }
      if(bai>0.39  ){
        return "چاق";
      }
      else{
        return "اطلاعات داده شده نامعتبر است";
      }
    }

  }
  getwhrType(){
    if(sex==0){
      if(whr<=0.95){
        return "کم";
      }
      if(whr>=0.96 && whr<=1){
        return "درحد متوسط";
      }
      if(whr>1 ){
        return "بالا";
      }
      else{
        return "اطلاعات داده شده نامعتبر است";
      }
    }
    else{
      if(whr<=0.8){
        return "کم";
      }
      if(whr>=0.81 && whr<=0.85){
        return "درحد متوسط";
      }
      if(whr>=0.86 ){
        return "بالا";
      }
      else{
        return "اطلاعات داده شده نامعتبر است";
      }
    }

  }
  getbmitype(){
    print(bmi);
    if(bmi<18){
      return "لاغر";
    }
    if(bmi>=18 && bmi<25){
      return "طبیعی";
    }
    if(bmi>=25 && bmi<30){
      return "چاق";
    }
    else{
      return "اطلاعات داده شده نامعتبر است";
    }
  }
  @override
  void initState() {
    super.initState();
    _getInformation();
    getresult();
  }
  @override
  Widget build(BuildContext context) {
    return Background(
     complete? Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Text("جواب آنالیز هنرجو :",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 17),),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              margin: EdgeInsets.only(top:10,right: 10,left: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                height: 60,
                      child: ListView(
                        reverse: false,
                          scrollDirection: Axis.horizontal,
                        children: <Widget>[

                      Row(children: <Widget>[

                          MaterialContainer('$date'),
                TexT("نام و نام خانوادگی :"),
                MaterialContainer('$name')

                ],),]),
                      ) ,



                      drivere(),

                      TexT("وزن شما (IBW)"),
                      Value(" = Kg", '$weight'),
                      drivere(),
                      TexT("وزن ایده آل (IBW)"),
                      Value(" = Kg", ideal.toString()),
                      drivere(),

                     TexT("شاخص توده بدن (BMI)"),
                      Value(" = Amount", '$bmi'),
                      Value(" = Type", getbmitype()),
                     drivere(),

                      TexT("نسبت دور کمر به دور باسن (WHR)"),
                      Value(" = Ratio", '$whr'),
                      Value(" = Type",getwhrType()),
                      drivere(),


                      TexT("شاخص چاقی بدن (BAI)"),
                      Value(" = Precent", '$bai'),
                      Value(" = Type", getBAIType()),
                      drivere(),


                      TexT("چربی بدن (BF)"),
                      Value(" = Precent", '$bf'),
                      Value(" = Type",getBFType() ),
                      drivere(),


                      TexT("ضربان قلب (HR)"),
                      Value("= Max", '$hr'),
                      Value(" = Target", (bf*0.7).toString()),
                      drivere(),


                      TexT("مجموع انرژی مورد نیاز روزانه برای شما (TEE)"),
                      Value(" = KC", '$tee'),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ):Center(child: CircularProgressIndicator(),)
    );
  }
  TexT(data,{color}) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 5, bottom: 5, left: 10),
      child: Text(
        data,
        style: TextStyle(
            color: color==null? Colors.black:color, fontWeight: FontWeight.w400, fontSize: 13),
      ),
    );
  }
  
  Value(unit,value){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          TexT(value,color:Colors.green),
          TexT(unit),

        ],
      ),
    );
  }

  MaterialContainer(text){
    return Container(
      padding: EdgeInsets.all(2),
      child: TexT(text),
      decoration: BoxDecoration(color: Colors.grey[300],
      borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
