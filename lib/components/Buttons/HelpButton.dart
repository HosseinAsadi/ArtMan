import 'package:art_man/components/Toast/HelpDialog.dart';
import 'package:flutter/material.dart';

class HelpButton extends StatefulWidget {
  String id;

  HelpButton(this.id);

  @override
  _HelpButtonState createState() => _HelpButtonState(id);
}

class _HelpButtonState extends State<HelpButton> {
  String id;

  _HelpButtonState(this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: GestureDetector(
        child:  Icon(Icons.help_outline,color: Colors.blue,),
        onTap: (){
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(

                content: HelpDialog(id),
              )
          );
        },
      ),
    );
  }
}
