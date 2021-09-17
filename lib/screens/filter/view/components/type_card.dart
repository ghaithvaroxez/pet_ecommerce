import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';


class TypeCard extends StatelessWidget {
  final Function callback;
  final String title;
  final bool selected;

  const TypeCard({Key key, this.callback, this.title, this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: callback,
      child: Container(
        // width: getProportionateScreenWidth(50),
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(2)),
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5) ,vertical: getProportionateScreenHeight(2),),
        decoration: BoxDecoration(
          color: selected?backgroundBlue:backgroundGrey,
          borderRadius: BorderRadius.circular(5),
          boxShadow: shadow,
        ),
        child: Center(
          child: Text(
            title,
            style: selected?whiteButton_14pt:body2_14pt,
          ),
        ),
      ),
    );
  }
}
