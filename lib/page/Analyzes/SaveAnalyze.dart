
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/InputTexts/SearchInputText.dart';
import 'package:art_man/components/Networking/SendAnalyzeResult.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';
class SaveAnalyze extends StatefulWidget {
  @override
  _SaveAnalyzeState createState() => _SaveAnalyzeState();
}


class _SaveAnalyzeState extends State<SaveAnalyze> {
  int reslult;
  uploadAnalyze()async{
    AnalyzeData upload=new AnalyzeData();
   int rslt= await upload.uploader();
   setState(() {
     reslult=rslt;
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uploadAnalyze();

  }
  var _key=GlobalKey<FormState>();
  SearchInputText getid = new SearchInputText(
    "آیدی مربی خود را وارد نمایید...",
    "teacherid",
    height: 45.0,
    margintop: 10.0,
    radius: 30,


  );
  Button saveanalyze = new Button(
    ["teacherid"],
    "/StdInformationPage",
    "ذخیره آنالیز",
    40.0,
    30.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
    width: 100.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7FC81D),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: Text("آنالیز هنرجو"),
      ),
      drawer: Drawer(
        child: Text("dff"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            Center(
              child: Container(
                margin:
                EdgeInsets.only(left: 25, right: 25, top: 30),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("آیدی مربی خود را وارد نمایید.",style: TextStyle(
                            color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500
                          ),),
                          Text("(اجباری)"
                          ,style: TextStyle(color: Colors.red[900],fontSize: 12,fontWeight: FontWeight.w500),)
                        ],
                      ),


                    ),
                    getid,
                    saveanalyze,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
