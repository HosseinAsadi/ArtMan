import 'package:flutter/material.dart';

class TopProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        children: <Widget>[
          ClipRRect(
              child:  Image.asset('assets/images/p.jpg', width: 110, height: 110),
              borderRadius: BorderRadius.circular(25),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 30, bottom: 8),
                child: Text('علی امیر رضایی',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30, bottom: 8),
                child: Text('کدکاربر:555656',
                    style: TextStyle(color: Colors.white, fontSize: 10)
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30, bottom: 8),
                child: Text('Ali_Amirrezaei@gmail.com',
                    style: TextStyle(color: Colors.white, fontSize: 10)
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.white,size: 10),
                    Text(' ایران، سیستان و بلوچستان، زاهدان',
                        style: TextStyle(color: Colors.white, fontSize: 10)
                    ),
                  ],
                )
              ),
            ],
          )
        ],
      ),
    );
  }
  
}