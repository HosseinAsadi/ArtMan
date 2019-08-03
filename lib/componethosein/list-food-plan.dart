import 'package:flutter/material.dart';
import 'dart:async';

//import 'package:http/http.dart' as http;
import 'dart:convert';

class ListFoodPlan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LFP();
  }
}

class LFP extends State<ListFoodPlan> {
  final items = List<Container>.generate(
      100,
      (i) => Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 16),
          padding: EdgeInsets.only(left: 5, right: 5),
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Text('09', style: TextStyle(color: Colors.grey),),
                        Text('  هفته', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Text('این یک متن آزمایشی است و هیچ ارزش دیگری ندارد..', style: TextStyle(fontSize: 10),),
                ],
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          ),
      )
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: ListView.builder(
            itemCount: items.length, itemBuilder: _buildProductItem)
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return items[index];
  }
}
