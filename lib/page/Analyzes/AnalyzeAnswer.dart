import 'package:art_man/components/Widgets/BackgroandwithListview.dart';
import 'package:flutter/material.dart';
class AnalyzeAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child:ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TexT("عکس های وضعیت آناتومیکی یا فیگور :"),
              Container(
                height: 100,
                child: Row(
                  children: <Widget>[
                    Flexible(flex: 1,child: Image.network(""),),
                    Flexible(flex: 1,child: Image.network(""),),
                    Flexible(flex: 1,child: Image.network(""),),
                  ],
                ),

              ),
              Container(
                child:Row(children: <Widget>[
                  TexT("جنسیت :"),
                  TexT("url"),
                ],) ,
              )
              ,

              TexT("هدف و اندام ایده آل :"),
              TexT("url"),

              TexT("سابقه ورزشی :"),
              TexT("url"),

              TexT("تعداد جلساتی که می توانم در هفته تمرین کنم :"),
              TexT("url"),
              Container(
                child:Row(children: <Widget>[
                  TexT("سن :"),
                  TexT("url"),
                ],) ,
              )
              ,
              Container(
                child:Row(children: <Widget>[
                  TexT("گروه خونی :"),
                  TexT("url"),
                ],) ,
              ),

              Container(
                child:Row(
                  children: <Widget>[
                  TexT("شغل :"),
                  TexT("url"),
                ],) ,
              ),

              Container(
                child:Row(children: <Widget>[
                  TexT("تعداد روز های کاری :"),
                  TexT("url"),
                ],) ,
              ),

              Container(
                child:Row(children: <Widget>[
                  TexT("مجموع ساعت کاری :"),
                  TexT("url"),
                ],) ,
              ),

              TexT("سبک زندگی :"),
              TexT("url"),
              TexT("میزان اشتها :"),
              TexT("url"),

              TexT("تعداد وعده های غذایی :"),
              TexT("url"),

              TexT("تعداد دفعات دفع مدفوع در روز یا در هفته :"),
              TexT("url"),

              TexT("ساعات خواب به طور معمول و میزان خواب :"),
              TexT("url"),

              TexT("حساسیت ها :"),
              TexT("url"),

              TexT("مشکلات گوارشی :"),
              TexT("url"),

              TexT("ناهنجاری های فیزیکی :"),
              TexT("url"),

              TexT("بیماری ها :"),
              TexT("url"),

              TexT("تست های پزشکی :"),
              TexT("url"),

              TexT("تجهیزاتی که می توانم با آن تمرین کنم‌:"),
              TexT("url"),

            ],
          ),
        ],
      ),
    ),);
  }
  TexT(data){
    return Container(
      margin: EdgeInsets.only(right: 10,top: 5,bottom: 5,left: 10),
      child: Text(data,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 13),),
    );
  }
  driver(){
    return Container(
      height: 2,
      margin: EdgeInsets.only(top: 3,bottom: 3),
      child: driver(),
    );
  }
}
