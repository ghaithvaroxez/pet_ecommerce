import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';


class LocationDropDownButton extends StatefulWidget {
  @override
  _LocationDropDownButtonState createState() => _LocationDropDownButtonState();
}

class _LocationDropDownButtonState extends State<LocationDropDownButton> {

 String _value ="القدس";
 List<String> list_items=[
   "القدس",
   "رام الله",
   "القدس",
   "رام الله",
   "القدس",
   "رام الله",
   "القدس",
   "رام الله",
   "القدس",
 ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child:DropdownButtonHideUnderline(
          child:DropdownButton(
            value: _value,
            items: list_items.map((String item) {
              return DropdownMenuItem<int>(
                child: Text('$item'),
              );
            }).toList(),
            onChanged:(value) {
              setState(() {
                _value = value;
              });
            },
            hint:Text(_value),
            elevation: 8,
            style:blackText_14pt,
            icon: Icon(Icons.arrow_drop_down),
            iconDisabledColor: Colors.black,
            iconEnabledColor: Colors.blue,
            isExpanded: true,
          ),
        )
    );
  }
}
