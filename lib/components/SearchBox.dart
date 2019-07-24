import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            margin: EdgeInsets.only(left: 15, right: 15),
            child: IconButton(icon: Icon(
              Icons.search, color: Colors.yellow, size: 40,),
                onPressed: null),
          ),
          Container(
            width: 230,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "جستوجو بر اساس نام تمرینات ...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color:Colors.green,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,

                  )
              ),
            ),)

        ],
      ),
    );
  }
}
