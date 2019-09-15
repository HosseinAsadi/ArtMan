import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Networking/SendFoodPlan.dart';
import 'package:art_man/components/Networking/SendPlanSport.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/material.dart';



class WhatUser extends StatefulWidget {
String typeplan;
String typesend;
WhatUser(this.typeplan,this.typesend);

  @override
  _WhatUserState createState() => _WhatUserState(typeplan,typesend);
}

class _WhatUserState extends State<WhatUser> {
  String typeplan;
  String typesend;

  _WhatUserState(this.typeplan,this.typesend);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 155,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 7),
            padding: EdgeInsets.all(4),
            child: Text(typesend=="pattern"?"یک نام برای الگوی خود انتخاب کنید":
              "نام کاربری هنرجویی را که می خواهید به آن برنامه ارسال کنید را وارد نمایید",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          InputText(typesend=="pattern"?"نام الگو ...":"نام هنرجو ...","useridd",),
          button(Colors.green)
        ],
      ),
    );
  }

  button( color) {
    return GestureDetector(
      onTap: ()async {
        if(typeplan=="ورزشی"){
          if(typesend=="send") {
            Strings strings = new Strings();
            String username = await getusername();
            print("${strings.baseurl}/sportPlan/addSportPlan/${Kelid.getter(
                "useridd")}/$username");
            String resultt = await SendPlanSport(
                "${strings.baseurl}/sportPlan/addSportPlan/${Kelid.getter("useridd")}/$username");
            if (resultt == "200" || resultt == "201")
              ShowToast(
                  "برنامه با موفقیت ارسال شد", Colors.green, Colors.white);
            else if (resultt == "401")
              ShowToast("کاربری با آیدی وارد شده وجود ندارد", Colors.red,
                  Colors.white);
            else if (resultt == "404")
              ShowToast(
                  "کاربر وارد شده یا وجود ندارد یا در لیست هنرجویان شما نیست",
                  Colors.red, Colors.white);

            setState(() {
              Navigator.pop(context);
            });
          }
          if(typesend=="save") {
            Strings strings = new Strings();
            String username = await getusername();
            print("${strings.baseurl}/sportPlan/addSportPlan/temp/$username/${Kelid.getter("useridd")}");
            String resultt = await SendPlanSport(
                "${strings.baseurl}/sportPlan/addSportPlan/tmp/$username/${Kelid.getter("useridd")}");
            if (resultt == "200" || resultt == "201")
              ShowToast(
                  "برنامه به صورت موقت ذخیره شد", Colors.green, Colors.white);
            else if (resultt == "401")
              ShowToast("کاربری با آیدی وارد شده وجود ندارد", Colors.red,
                  Colors.white);
            else if (resultt == "404")
              ShowToast(
                  "کاربر وارد شده یا وجود ندارد یا در لیست هنرجویان شما نیست",
                  Colors.red, Colors.white);

            setState(() {
              Navigator.pop(context);
            });
          }

          if(typesend=="pattern") {
            Strings strings = new Strings();
             print( "${strings.baseurl}/sportPlan/addSportPlanT/${Kelid.getter("useridd")}");
            String resultt = await SendPlanSport(
                "${strings.baseurl}/sportPlan/addSportPlanT/${Kelid.getter("useridd")}");
            if (resultt == "200" || resultt == "201")
              ShowToast(
                  "برنامه به موفقیت به عنوان الگو ذخیره شد", Colors.green, Colors.white);

            else if (resultt == "404")
              ShowToast(
                  "یک چیز  در برنامه ورزشی غلط است",
                  Colors.red, Colors.white);

            setState(() {
              Navigator.pop(context);
            });
          }
        }
        else{
          if(typesend=="send"){
            Strings strings=new Strings();
            String username=await getusername();

            String result=  await SendPlanFood(
                "${strings.baseurl}/foodPlan/addFoodPlan/${Kelid.getter("useridd")}/$username");
            if(result=="200" || result=="201")
              ShowToast("برنامه به صورت موقت ذخیره شد",Colors.green,Colors.white);
            else if(result=="401" )
              ShowToast("کاربری با آیدی وارد شده وجود ندارد",Colors.red,Colors.white);
            else if(result=="404")
              ShowToast("کاربر وارد شده یا وجود ندارد یا در لیست هنرجویان شما نیست",Colors.red,Colors.white);

            else{
              ShowToast("لطفا همه برنامه ها را به طور کامل پر کنید",Colors.red,Colors.white);
            }
          }
          if(typesend=="pattern") {
            Strings strings = new Strings();
            print("${strings.baseurl}/foodPlan/addFoodPlanT/${Kelid.getter("useridd")}");
            String resultt = await SendPlanFood(
                "${strings.baseurl}/foodPlan/addFoodPlanT/${Kelid.getter("useridd")}");
            if (resultt == "200" || resultt == "201")
              ShowToast(
                  "برنامه  غذایی با موفقیت به عنوان الگو ذخیره شد", Colors.green, Colors.white);

            else if (resultt == "404")
              ShowToast(
                  "یک چیز  در برنامه غذایی غلط است",
                  Colors.red, Colors.white);

            setState(() {
              Navigator.pop(context);
            });
          }
        }
      },
      child:Container(
        alignment: Alignment.center,
        width: 100,
        height: 30,
        padding: EdgeInsets.only(right: 7,left: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: color),


        child: Text("ثبت"),

      ),
    );
  }
}
