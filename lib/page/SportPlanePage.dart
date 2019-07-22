import 'package:art_man/components/Button.dart';
import 'package:flutter/material.dart';

class SportPlanPage extends StatefulWidget {
  @override
  _SportPlanPageState createState() => _SportPlanPageState();
}

class _SportPlanPageState extends State<SportPlanPage> {
  Button myPlan=new Button([""],"/","برنامه های من",35.0,80.0,startcolor: Color(0xFF088B00),endcolor:Color(0xFF088B00) ,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),

          child:Container(
            margin: EdgeInsets.only(right: 30,left: 30),
            child:  Column(
              children: <Widget>[
                myPlan,
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 90,
                  decoration: BoxDecoration(
                      color: Color(0xFFF0F0F3),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 50,
                         height: 50,
                         alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15,right: 15),
                        child: IconButton(icon: Icon(Icons.add_circle_outline,color: Colors.green,size: 40,), onPressed: null),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("درخواست برنامه غذایی",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 18),),
                          Text("قابلیت سفارشی سازی طبق آنالیز بدن",style: TextStyle(color: Colors.black38,fontSize: 14),),
                        ],),
                    ],
                  ),
                )

              ],
            ),
          ),

        ),

      ),
    );
  }
}
