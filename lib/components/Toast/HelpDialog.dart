import 'package:art_man/components/Texts/Strings.dart';
import 'package:flutter/material.dart';

class HelpDialog extends StatefulWidget {
  String id;

  HelpDialog(this.id);

  @override
  _HelpDialogState createState() => _HelpDialogState(id);
}

class _HelpDialogState extends State<HelpDialog> {
  String id;
  Strings strings = new Strings();

  _HelpDialogState(this.id);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 300,
          child: Column(
            children: <Widget>[
              Container(
                  height:id=="business"
                      ||id=="age"
                      ||id=="weight"
                      ||id=="bloodGroup"
                      ||id=="aroundArmFree"
                      ||id=="aroundSaed"?0:150 ,
                 child: Image.asset("assets/images/$id.png",fit: BoxFit.cover,)),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Text(
                      "${strings.help[id]}",
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            left: 2,
            top: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.red,
              ),
              child: GestureDetector(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ))
      ],
    );
  }
}
