import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';

class TypeDropDownButton extends StatefulWidget {
  @override
  _TypeDropDownButtonState createState() => _TypeDropDownButtonState();
}

class _TypeDropDownButtonState extends State<TypeDropDownButton> {
  String _value="منتجات";
  List<String> list_items=[
    "متاجر",
    "اسطبلات",
    "عروض",
    "منتجات",
    "طلبات",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(156),
        height: getProportionateScreenHeight(45),
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
    );;
  }
}
