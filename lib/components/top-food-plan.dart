import 'package:flutter/material.dart';

class TopFoodPlan extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/p.jpg', width: 350, height: 200, fit: BoxFit.fill,),
        Positioned(
            bottom: 0,
            right: 25,
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  )
              ),
              child: Padding(padding: EdgeInsets.only(left: 16, right: 16, top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('وزن ایده آل\n 85 کیلوگرم', textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                  Text('مدت زمان برنامه\n 24 ساعت', textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                  Text('سطح کاربری \n متوسط', textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                ],
              ),
              )
            )
        ),
      ],
    );
  }

}