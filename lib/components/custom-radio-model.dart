import 'package:flutter/material.dart';

class RadioModel{
  bool isSelected;
  final String text;

  RadioModel(this.isSelected, this.text);
}

class RadioItem extends StatelessWidget{
  final RadioModel _item;
  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 2.8,
          right: MediaQuery.of(context).size.width / 2.8,
          top: 15, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: _item.isSelected
                  ? Colors.green[800]
                  : Colors.grey,
              border: Border.all(
                color: _item.isSelected
                    ? Colors.green[800]
                    : Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                const Radius.circular(15)
              )
            ),
          ),

          Container(
            margin: EdgeInsets.all(8),
            child: Text(
                _item.text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20
                )
            ),
          ),
        ],
      ),
    );
  }
}