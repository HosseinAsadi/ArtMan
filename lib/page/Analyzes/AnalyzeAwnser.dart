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
  AnalyzeResult({Key key,this.index,this.date}) : super(key: key);
  @override
  _AnalyzeResultState createState() => _AnalyzeResultState(index,date);
}


class _AnalyzeResultState extends State<AnalyzeResult> {
  String index;
  int weight,hr,tee;
  double bmi,whr,bai,bf;
  String date,name,username;
  bool complete=false;
  _AnalyzeResultState(this.index,this.date);
  String stdUsername;
  _getInformation() async {
    Strings strings=new Strings();

    username = await getusername();

    StdProfile info = await GetLocation.fetchProfilestudent(
        "${strings.baseurl}/users/getUser/$username");

    setState(() {


      setState(() {

        name = info.result[0].firstname;

      });


    });
  }
  getresult()async{
    String username=await getusername();
    setState(() {
       stdUsername= username;
    });
    AnalyzeAnswers analyzeAnswe = (await fetchAnalyzeReslult("${strings.baseurl}/analyze/getFromUser/$stdUsername")) ;
    setState(() {
    weight = analyzeAnswe.result[int.parse(index)].outcomes.ibw;
    bmi = analyzeAnswe.result[int.parse(index)].outcomes.bmi;
    whr = analyzeAnswe.result[int.parse(index)].outcomes.whr;
     bai= analyzeAnswe.result[int.parse(index)].outcomes.bai;
    bf = analyzeAnswe.result[int.parse(index)].outcomes.bf;
    hr = analyzeAnswe.result[int.parse(index)].outcomes.hr;
    tee = analyzeAnswe.result[int.parse(index)].outcomes.tee;
    });
   complete=true;
  }

  @override
  void initState() {
    // TODO: implement initState
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
                      Value(" = Kg", ''),
                      drivere(),

                      TexT("شاخص توده بدن (BMI)"),
                      Value(" = Amount", '$bmi'),
                      Value(" = Type", ''),
                      drivere(),

                      TexT("نسبت دور کمر به دور باسن (WHR)"),
                      Value(" = Ratio", '$whr'),
                      Value(" = Type", ''),
                      drivere(),


                      TexT("شاخص چاقی بدن (BAI)"),
                      Value(" = Precent", '$bai'),
                      Value(" = Type", ''),
                      drivere(),


                      TexT("چربی بدن (BF)"),
                      Value(" = Precent", '$bf'),
                      Value(" = Type", ''),
                      drivere(),


                      TexT("ضربان قلب (HR)"),
                      Value("= Max", '$hr'),
                      Value(" = Target", ''),
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
