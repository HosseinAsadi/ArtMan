import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  String _hint;

  DropDownMenu(this._hint);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DDM(this._hint);
  }
}

class DDM extends State<DropDownMenu> {
  var _currencies = {"1", "2", "3"};
  var _currentItemSelected = "1";

  String _hint;

  DDM(this._hint);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return dropDownMenu();
  }

  Widget dropDownMenu() => Container(
        alignment: Alignment(0, 0),
        margin: EdgeInsets.only(left: 20, right: 20),
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: DropdownButton<String>(
          isExpanded: true,
          underline: Text(''),
          hint: Text(this._hint),
          icon: Icon(const IconData(0xe900, fontFamily: 'dropDownIcon'),
              color: Colors.green, size: 18),
          items: _currencies.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 18),
              ),
            );
          }).toList(),
          onChanged: (String newValueSelected) {
            _onDropDownItemSelected(newValueSelected);
          },
        ),
      );

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
