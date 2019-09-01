import 'dart:convert';
import 'package:art_man/components/Networking/SendData.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/GetMyTeachersList.dart';
import 'package:art_man/components/Utility/GetTeachersList.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/MD5Generator.dart';
import 'package:art_man/components/Utility/SetSex.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/components/Utility/Validator.dart';
import 'package:art_man/components/Utility/Function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {

  String text, goal,snackbarText,functioncode;
  final Fucntionman function;
  bool task=false;
  List<String> list;
  double height;
  double margintop;
  double marginbottom;
  double marginleft;
  double marginright;
  Color startcolor;
  Color endcolor,textcolor;
  double width;

  FontWeight fontWeight;
  double textsize;
  GlobalKey<FormState> _key;

  setkey(GlobalKey<FormState> _key) {
    this._key = _key;
  }

  Button(this.list,this.goal, this.text, this.height, this.margintop,
      {this.marginleft,
      this.marginright,
        this.marginbottom,
      this.startcolor,
      this.endcolor,
        this.textcolor,
      this.width,
      this.fontWeight,
      this.textsize,
      this.task,
      this.function,
      this.snackbarText,
      this.functioncode});

  @override
  myBottom createState() {
    // TODO: implement createState
    return myBottom(list, _key, goal, text, height, margintop,
        marginright: marginright,
        marginleft: marginleft,
        marginbottom: marginbottom,
        startcolor: startcolor,
        endcolor: endcolor,
        width: width,
    textcolor: textcolor,
    fontWeight: fontWeight,
    textsize: textsize,
    task: task,
    function: function,
    snackbarText: snackbarText,
    functioncode: functioncode);
  }
}

class myBottom extends State<Button> {
  String cityvalue = null, goal,snackbarText,functioncode;
  String text;
  List<String> list;
  bool task=false;
  Fucntionman function;
  double height;
  double margintop;
  double marginleft,marginbottom;
  double marginright;
  Color startcolor;
  Color endcolor,textcolor;
  double width;
  FontWeight fontWeight;
  double textsize;



  GlobalKey<FormState> _key;

  myBottom(
       this.list,this._key, this.goal, this.text, this.height, this.margintop,
      {this.marginleft,
      this.marginright,
      this.marginbottom,
      this.startcolor,
      this.endcolor,
        this.textcolor,
      this.width,
      this.textsize,
      this.fontWeight,
      this.task,
      this.function,
      this.snackbarText,
      this.functioncode});
//MakeList makeList=new MakeList();
  @override
  @override
  Widget build(BuildContext context) {
    var right = 0.0;
    var left = 0.0;
    var bottom = 0.0;
    if (marginright != null) {
      right = marginright;
    }
    if (marginleft != null) {
      left = marginleft;
    }
    if (marginbottom != null) {
      bottom = marginbottom;
    }


    return AnimatedContainer(
      alignment: Alignment(0, 0),
      width: width,
      height: height,
      duration: Duration(microseconds: 50),
      margin: EdgeInsets.only(top: margintop, left: left, right: right,bottom: bottom),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //border: Border.all(color: bordercolor,width: borderwidth),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [startcolor==null?Color(0xFF5AE100):startcolor, endcolor==null?Color(0xFF0F8F00):endcolor])),
      child: GestureDetector(
        onTapDown: (TapDetails) {
          setState(() {
            --width ;
            --height;
            startcolor = Colors.green[900].withOpacity(0.1);
            endcolor = Colors.green[800].withOpacity(0.3);
          });
        },
        onTapUp: (TapUpDetails) {

          setState(() {
            startcolor = Color(0xFF5AE100);
            endcolor = Color(0xFF0F8F00);
            ++width ;
            ++height;
          });
        },
        onTap: () async {
         bool ismyteacher=false;

          if(functioncode=="ذخیره آنالیز") {

            List<TeacherInfo> myTeachers = await getStdInfo();
            for(int i=0;i<myTeachers.length;i++){
              if(Kelid.getter("teacherid")==myTeachers[i].username){
                setState(() {
                  ismyteacher=true;
                });
                CircularProgressIndicator();
                function.uploadAnalyze(Kelid.getter("teacherid"));
                ShowToast("آنالیز با موفقیت ارسال شد",Colors.green,Colors.white);
                Navigator.pushNamed(context, goal);
              }
            }
            if(!ismyteacher){

              print("مربی وجود ندارد");
              showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    contentPadding: EdgeInsets.all(0.0),
                    content: VerifyDialog("برای فرستادن آنالیز به این مربی باید آن را به لیست مربیان خود اضافه کنید آیا مایلید؟",id: "addTeacher",height: 170.0,)

                  )
              );
            }

          }

               if(functioncode=="signin")
               function.signInWork(Scaffold.of(context),context);
               if(functioncode=="ورود به پنل کاربری مربی"){
                 print("sender runned");
                 //function.senderTeacherData();
                 String result=await Post.apiRequest("${strings.baseurl}/teachers/addTeacher",json.encode(
                     { "username" : Kelid.getter("username"),
                       "password" :Hasher.GenerateMd5(Kelid.getter("password").toString()),
                       "first_name" : Kelid.getter("first_name"),
                       "last_name" : " ",
                       "country" : Kelid.getter("country"),
                       "city" : Kelid.getter("city"),
                       "phone" : Kelid.getter("phone"),
                     }));
                if(result=="200" || result=="201"){
                  await setusername();
                  await setsign();
                  print("setted username and signed");
                }
                if(result=="500")
                  print("server error");
               }
               if(functioncode=="ورود به پنل کاربری هنرجو"){
                 print("sender student runned");
                // String result= await function.senderTeacherData();
                 var result=await Post.apiRequest("${strings.baseurl}/users/addUser",json.encode(
                     { "username" : Kelid.getter("username"),
                       "password" : Hasher.GenerateMd5(Kelid.getter("password").toString()),
                       "first_name" :  Kelid.getter("first_name"),
                       "last_name" : " ",
                       "country" : Kelid.getter("country"),
                       "city" : Kelid.getter("city"),
                       "phone" :  Kelid.getter("phone"),
                       "sex" : SetSex.sex(Kelid.getter("sex").toString())
                     }));

                 if(result=="200" || result=="201"){
                   await setusername();
                   await setsign();
                   print("setted username and signed");
                 }
                 if(result=="500")
                   Scaffold.of(context).showSnackBar(SnackBar(
                       content: Text(
                         snackbarText==null? "خطا در ارتباط با سرور":snackbarText,
                         style: TextStyle(color: Colors.white),
                       ),
                       backgroundColor: Colors.red[900]));

               //}

          }
          Validator validator=new Validator();

          if(list.length==0)
          Navigator.pushNamed(context, goal);

            if (validator.isvalid(list)  ) {
              if(functioncode==null)
                  Navigator.pushNamed(context, goal);
          }

          else
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                 snackbarText==null? "لطفا همه ی فیلد ها را پر کنید":snackbarText,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red[900]));

        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: textcolor==null?Colors.white:textcolor,
          fontWeight: fontWeight==null?FontWeight.normal:fontWeight ,
          fontSize: textsize==null?16:textsize),
        ),
      ),
    );
  }
}
