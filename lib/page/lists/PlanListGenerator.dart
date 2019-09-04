import 'package:flutter/material.dart';

class PlanListViewGenerator extends StatefulWidget {
  List<String> plans;
  PlanListViewGenerator(this.plans);
  @override
  _PlanListViewGeneratorState createState() => _PlanListViewGeneratorState(plans);
}

class _PlanListViewGeneratorState extends State<PlanListViewGenerator> {
  List<String> plans;
  _PlanListViewGeneratorState(this.plans);
  @override
  Widget build(BuildContext context) {

    return  ListView.builder(
      reverse: false,
      itemBuilder: _buildProductItem,
      itemCount: plans.length,

    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: ListTile(
          onTap: () {
           /* Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context) => TeacherProfileReadOnly(
                    text: "",
                  ),
                )
                    );*/
          },

          title: Text(
            "${plans[index]}",
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),

        ))
    ;
  }
}
