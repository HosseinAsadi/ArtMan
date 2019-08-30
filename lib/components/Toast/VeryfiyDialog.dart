import 'package:art_man/components/Networking/AddTeacher.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Utility/Function.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/material.dart';

import 'ShowSnackbar.dart';

class VerifyDialog extends StatefulWidget {
  String text;
  double height;
  String id;
  VerifyDialog(this.text,{this.height,this.id});

  @override
  _VerifyDialogState createState() => _VerifyDialogState(text,id: id,height: height);
}

class _VerifyDialogState extends State<VerifyDialog> {
  String text;
  bool result;
  double height;
  String id;
  String username;
  getuser()async{
    String user= await getusername();
    setState(() {
      username=user;
    });
  }
  _VerifyDialogState(this.text,{this.height,this.id});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height==null? 114:height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 7),
            padding: EdgeInsets.all(4),
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              button(Icons.done, Colors.green, true),
              button(Icons.clear, Colors.red, false)
            ],
          )
        ],
      ),
    );
  }

  button(icon, color, bool select) {
  return Flexible(flex: 1,child:Container(

    padding: EdgeInsets.only(right: 7,left: 7),
    decoration: BoxDecoration(
        color: color),

    child: GestureDetector(
      child: Icon(
        icon,size: 30,
        color: Colors.white,
      ),
      onTap: ()async {
        setState(() {
          result = select;
        });
        if (result) {
          if(id=="addTeacher"){
            Fucntionman function=new Fucntionman();
            String result=await AddTeacher(Kelid.getter("teacherid"),username);
            if(result=="404"){
              Navigator.pop(context);
              ShowToast("آیدی وارد شده وجود ندارد",Colors.red,Colors.white);
            }
            else{
              function.uploadAnalyze(Kelid.getter("teacherid"));
              ShowToast("آنالیز با موفقیت ارسال شد",Colors.green,Colors.white);
              Navigator.pushNamed(context, "/AnalyzeList");
            }

          }
          if(id=="remove"){
            removeAccount();
            Navigator.pushNamed(context, "/");
          }
          if(id=="remove classroom"){

          }

        } else
          Navigator.pop(context);
      },
    ),
  ) ,);
  }
}
