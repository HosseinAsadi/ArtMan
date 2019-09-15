import 'package:art_man/components/Utility/Classroom.dart';
import 'package:flutter/material.dart';

class OptionsDialog extends StatefulWidget {
  Function setselection,calback;
  OptionsDialog(this.setselection,this.calback);
  @override
  _OptionsDialogState createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117,
      child: Column(children: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              this.widget.setselection(true);
              this.widget.calback("done");

              Navigator.pop(context);
            });
          },
          child:Card(child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 250,
            child: Text("ایجاد سوپرست"),
          ),) ,
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              this.widget.setselection(true);

              this.widget.calback("del");
              Navigator.pop(context);
            });
          },
          child: Card(child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 250,

            child: Text("حذف از لیست"),
          ),) ,
        ),
      ],),
    );
  }
}
