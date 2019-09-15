import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/Validator.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/Widgets/OneDropdown.dart';
import 'package:flutter/material.dart';

class MakeFoodList extends StatefulWidget {
  String numberplan,numbermeal;
  MakeFoodList(this.numberplan,this.numbermeal);

  @override
  _MakeFoodListState createState() {

    return _MakeFoodListState(numberplan,numbermeal);
  }
}

class _MakeFoodListState extends State<MakeFoodList> {
  double height = 116.0;

  String numberplan,numbermeal;
  int selectedIndex;
  setIndex(index){
    setState(() {
      selectedIndex=index;
    });
  }
_MakeFoodListState(this.numberplan,this.numbermeal);

  Widget _buildProductItem(BuildContext context, int number) {

    return Stack(
      children: <Widget>[
        Container(
          height: 116,
          margin: EdgeInsets.only(right: 15, left: 15, bottom: 3),
          decoration: BoxDecoration(
              color:selectedIndex!=null && selectedIndex==number?
              Colors.white.withOpacity(0.3):
              Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),

          child: GestureDetector(

            onLongPress: () {
              showDialog(
                context: context,
                builder: (_) =>
                new AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    contentPadding: EdgeInsets.all(0.0),
                    content: VerifyDialog(
                      "آیا از حذف کردن این وعده مطمئن هستید؟",id: "remove_meal",)
                ),

              );

            },
           onTap: (){
              setIndex(number);
           },

            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[


                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(7),
                    child:InputText(
                      "نام وعده غذایی",
                      "khorak_name",
                      height: 50,
                      maxlenght: 200,
                      maxlines: 3,
                      textAlign: TextAlign.center,
                      value: plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods[number].name,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: OneDropDown(
                          "number_Of_khorak",
                          ["1","2","3","4","5","6","7","8","9","10"],
                          "تعداد",fontcolor: Colors.black,value:
                        plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods[number].namber,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: OneDropDown("unit_Of_khorak",
                            ["قاشق غذاخوری", "لیوان", "برش", "پرس"], "لیوان",fontcolor: Colors.black,value:
                          plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods[number].unit,),
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
    // TODO: implement initState
    super.initState();
    if(plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods.length==0){
      Foode foode=new Foode();
      plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods.add(foode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(numberplan+numbermeal);
    print(plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods.length);
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20,left: 12,right: 12),
          height: height*(plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods.length),
          child: new  ListView.builder(
            reverse: false,
            itemBuilder: _buildProductItem,
            itemCount: plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods.length,
          ),
        ),
        Adder("+")

      ],
    );
  }
  Adder(text){
    Color backcolor=Colors.yellow[700];
    return  GestureDetector(
      onTap: () {
        setState(() {


          Foode food=new Foode();
          food.name=Kelid.getter("khorak_name");
          food.namber=Kelid.getter("number_Of_khorak");
          food.unit=Kelid.getter("unit_Of_khorak");
          plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods[
          plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods.length-1
          ]=food;
          Foode newfood=new Foode();
          plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods.add(newfood);
          Kelid.setter("khorak_name", "");
          Kelid.setter("number_Of_khorak", "");
          Kelid.setter("unit_Of_khorak", "");


        });
      },
      onTapUp: (Details){
        setState(() {
          backcolor=Colors.yellow.withOpacity(0.3);
        });
      },
      onTapDown: (Details){
        setState(() {
          backcolor=Colors.yellow[700];
        });
      },

      child: Container(

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
                colors: [backcolor, backcolor])),
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





