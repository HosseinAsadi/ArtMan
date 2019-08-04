import 'package:flutter/material.dart';

class ListSession extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LS();
  }

}

class LS extends State<ListSession> with SingleTickerProviderStateMixin {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('تنظیم مجدد', style: TextStyle(fontSize: 13),),
            Text('جلسه شماره1-هفته شماره1',style: TextStyle(fontSize: 15))
          ],
        ),
        actions: <Widget>[
          Icon(Icons.arrow_forward)
        ],
        backgroundColor: Colors.green[800],
      ),

      body: setBackground(),
    );
  }

  Widget setBackground() =>
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      );

  Widget body() =>
      Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: items().length, itemBuilder: _buildProductItem)
          ),
        ],
      );
  List<Container> items() => List<Container>.generate(
      2000,
          (i) =>
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 16),
              padding: EdgeInsets.all(16),
              height: 162,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            'assets/images/p.jpg', width: 75, height: 75),
                      ),
                      Container(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text('پرس پشت بازو',
                                style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            Row(
                              children: <Widget>[
                                Text('گام ها                   ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Text('3 عدد', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12))
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('تعداد تکرارها        ', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                                Text('8-10-12', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12))
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('زمان استراحت      ', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                                Text('25 ثانیه', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(bottom: 2),
                    color: Colors.grey,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                              color: _isSelected ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Icon(
                              Icons.done,
                              size: 20,
                              color: _isSelected ? Colors.white : Colors.grey,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if(!this._isSelected)
                              this._isSelected = true;
                            else
                              this._isSelected = false;
                          });
                        },
                      ),

                      Text('به اتمام رسیده است..', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),)
                    ],
                  )
                ],
              )
          )
  );

  Widget _buildProductItem(BuildContext context, int index) {
    return items()[index];
  }

}