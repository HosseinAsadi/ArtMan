import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/Validator.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:flutter/material.dart';

class MakeKhorak extends StatefulWidget {


  @override
  _MakeKhoraksState createState() {

    return _MakeKhoraksState();
  }
}

class _MakeKhoraksState extends State<MakeKhorak> {
  double height = 120.0;
  Color listItemcolor = Colors.white;
  int cunter=1;
  List<String> numberofkhorak = new List();



  Widget _buildProductItem(BuildContext context, int number) {
    return Container(
      height: 90,
      margin: EdgeInsets.only(right: 15, left: 15, bottom: 3),
      decoration: BoxDecoration(
          color: listItemcolor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (_) => new AlertDialog(
                contentPadding: EdgeInsets.all(0.0),
                content: VerifyDialog(
                  "آیا از حذف کردن این وعده مطمئن هستید؟",
                  id: "remove_meal",
                )),
          );
          setState(() {
            listItemcolor = Colors.white;
          });
        },
        onTapDown: (Detaial) {
          setState(() {
            if (number == 0) listItemcolor = Colors.white.withOpacity(0.3);
          });
        },
        onTapUp: (Detaial) {
          setState(() {
            listItemcolor = Colors.white;
          });
        },
        child: Container(
            width: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: InputText(
                      "نام وعده غذایی",
                      "khorak_name",
                      height: 50,
                      maxlenght: 200,
                      maxlines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: DropDown(
                      "number_Of_khorak",
                      numberofkhorak,
                      "تعداد",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: DropDown("unit_Of_khorak",
                        ["قاشق غذاخوری", "لیوان", "برش", "پرس"], "لیوان"),
                  ),
                ])),
      ),
    );
  } //element of make list

  @override
  Widget build(BuildContext context) {
    return Container(

            child: ListView(
              shrinkWrap: false,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 12, right: 12),
                          height: height,
                          child: new ListView.builder(
                            reverse: false,
                            itemBuilder: _buildProductItem,
                            itemCount: cunter,
                          ),
                        ),
                        Container(
                          alignment: Alignment(0, 0),
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.yellow[700],
                                    Colors.yellow[700]
                                  ])),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Validator validator = new Validator();

                              /*  if (validator.isvalid([
                                  "khorak_name",
                                  "number_Of_khorak",
                                  "unit_Of_khorak"
                                ])) {
                                  Khorak khorak = new Khorak();
                                  khorak.number =
                                      Kelid.getter("number_Of_khorak");
                                  khorak.unit = Kelid.getter("unit_Of_khorak");
                                  khorak.eat = Kelid.getter("khorak_name");
                                  currentKhorak.add(khorak);
                                  Kelid.setter("number_Of_khorak", "");
                                  Kelid.setter("unit_Of_khorak", "");
                                  Kelid.setter("khorak_name", "");
                                  height += 120.0;
                                  currentKhorak.add(khorak);
                                } else {
                                  ShowToast("لطفا فیلد های مورد نظر را پر کنید",
                                      Colors.red, Colors.white);
                                }*/
                              });
                            },
                            child: Text(
                              "+",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 23),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
