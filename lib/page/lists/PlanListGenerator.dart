import 'package:art_man/components/Networking/FetchFoodPlan.dart';

import 'package:art_man/page/FoodPlan/food-plan.dart';
import 'package:flutter/material.dart';

class PlanListViewGenerator extends StatefulWidget {
  String planType;
  MyPlan models;
  PlanListViewGenerator(this.planType,this.models);
  @override
  _PlanListViewGeneratorState createState() => _PlanListViewGeneratorState(planType,models);
}

class _PlanListViewGeneratorState extends State<PlanListViewGenerator> {
  String planType;
  MyPlan models;

  _PlanListViewGeneratorState(this.planType,this.models);



  @override
  Widget build(BuildContext context) {

    return  ListView.builder(
      reverse: false,
      itemBuilder: _buildProductItem,
      itemCount: models.result.length,

    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return  GestureDetector(
       onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodPlan()));
       },
     child : Card(
       child: Container(
         padding: EdgeInsets.all(4),
         child: Row(
           children: <Widget>[
             Container(
               padding: EdgeInsets.all(5),
               child: Icon(Icons.blur_linear,color: Colors.green,),
             ),
             Column(
               children: <Widget>[
                 Text(models.result[index].user,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                 Text(models.result[index].create_date,style: TextStyle(color: Colors.black45,fontWeight: FontWeight.normal,fontSize: 15),),
               ],
             )
           ],
         ),
       ),
        ))
    ;
  }
}
