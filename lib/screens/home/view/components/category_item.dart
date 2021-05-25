import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/model/constants.dart';



class CategoryItem extends StatelessWidget {
  final int index;
  CategoryItem(this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(

        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
                right: -5,
                child: CircleAvatar(
                  radius: getProportionateScreenHeight(22),
                  backgroundColor:
                  Colors.white,
                  child: Image.asset(
                      images[index]),
                )),
            Positioned(
                right: getProportionateScreenWidth(50),
                bottom: getProportionateScreenHeight(10),
                child: Text(
                  names[index],
                  style: body2_14pt,
                )),
          ],
        ),
      ),
    );
  }
}
