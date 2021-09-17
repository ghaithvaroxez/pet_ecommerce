import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';


class TypeDropDownButton extends StatefulWidget {
  @override
  _TypeDropDownButtonState createState() => _TypeDropDownButtonState();
}
String _value= "متاجر";
List<String> list_items=[
  "متاجر",
  "اسطبلات",
  "عروض",
  "منتجات",
  "طلبات",
];
class _TypeDropDownButtonState extends State<TypeDropDownButton> {

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: getProportionateScreenWidth(156),
    height: getProportionateScreenHeight(45),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    border: Border.all(width: 1,color: Colors.grey.withOpacity(0.6)),
    ),
    padding: EdgeInsets.symmetric(horizontal: 15),

        child:DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            // value: _value,
            items: list_items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
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
            iconEnabledColor: Colors.blue.withOpacity(0.6),
            // isExpanded: true,
          ),
        )
    );
  }
}
