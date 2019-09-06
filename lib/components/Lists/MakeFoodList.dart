import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/Validator.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:flutter/material.dart';

class MakeFoodList extends StatefulWidget {


  @override
  _MakeFoodListState createState() {

    return _MakeFoodListState();
  }
}

class _MakeFoodListState extends State<MakeFoodList> {
  double height = 112.0;
  Color listItemcolor=Colors.white;



  Widget _buildProductItem(BuildContext context, int number) {

    return Stack(
      children: <Widget>[
        Container(
          height: 110,
          margin: EdgeInsets.only(right: 15, left: 15, bottom: 3),
          decoration: BoxDecoration(
              color: listItemcolor,
              borderRadius: BorderRadius.all(Radius.circular(15))),

          child: GestureDetector(

            onLongPress: () {
              showDialog(
                context: context,
                builder: (_) =>
                new AlertDialog(
                    contentPadding: EdgeInsets.all(0.0),
                    content: VerifyDialog(
                      "آیا از حذف کردن این وعده مطمئن هستید؟",id: "remove_meal",)
                ),

              );
              setState(() {
                listItemcolor = Colors.white;
              });
            },
            onTapDown: (Detaial) {
              setState(() {
                if(number==0)
                  listItemcolor = Colors.white.withOpacity(0.3);
              });
            },
            onTapUp: (Detaial) {
              setState(() {
                listItemcolor = Colors.white;
              });
            },

            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[


                  Container(
                    alignment: Alignment.bottomCenter,
                    child:InputText(
                      "نام وعده غذایی",
                      "khorak_name",
                      height: 50,
                      maxlenght: 200,
                      maxlines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: DropDown(
                          "number_Of_khorak",
                          ["1","2","3","4","5","6","7","8","9","10"],
                          "تعداد",
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: DropDown("unit_Of_khorak",
                            ["قاشق غذاخوری", "لیوان", "برش", "پرس"], "لیوان"),
                      ),
                    ],
                  )


                ]),
          ),
        ),

      ],
    ) ;

  } //element of make list





  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20,left: 12,right: 12),
          height:foods.length==0?height: height*foods.length,

          child: new  ListView.builder(
            reverse: false,
            itemBuilder: _buildProductItem,
            itemCount: foods.length+1,
          ),
        ),
        Adder("+")

      ],
    );
  }
  Adder(text){
    return  Container(
      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(5),


      width: 60,
      height: 60,
      margin: EdgeInsets.only(
          top: 10,
          bottom: 10
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.yellow[700], Colors.yellow[700]])),
      child: GestureDetector(

        onTap: () {
          setState(() {
            Validator validator=new Validator();
            if (validator.isvalid(["number_Of_khorak"
            ,"unit_Of_khorak"
            ,"khorak_name"])  ) {
              Food food=new Food();
              food.name=Kelid.getter("khorak_name");
              food.namber=Kelid.getter("number_Of_khorak");
              food.unit=Kelid.getter("unit_Of_khorak");
              foods.add(food);
              Kelid.setter("khorak_name", "");
              Kelid.setter("number_Of_khorak", "");
              Kelid.setter("unit_Of_khorak", "");
              height += 120.0;
            }

            else
              ShowToast("لطفا همه ی فیلد ها را پر کنید",Colors.red,Colors.white);

          });
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 29),
        ),
      ),
    );
  }


}





