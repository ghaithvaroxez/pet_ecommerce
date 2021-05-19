import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: getProportionateScreenWidth(120),
      height: getProportionateScreenHeight(150),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          color: Colors.white),
      child: Stack(
        children: [
          Positioned(
              top: 105,
              child: Container(
                height: 45,
                width: 126,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: Colors.grey.shade200,
                ),
                child: Container(alignment: Alignment.center,child: Text("قطة منزلية ",style: body2_14pt,)),
              )),
          Positioned(
              left: 15,
              child: Container(
                height: getProportionateScreenHeight(130),
                width: getProportionateScreenWidth(100),
                child: Image.asset(
                  "assets/images/home/cat_1.png",
                  fit: BoxFit.fill,
                ),
              )),
          Positioned(
              left: 25,
              top: 8,
              child: Container(
                height: getProportionateScreenHeight(14),
                width: getProportionateScreenWidth(15),
                child: IconButton(
                  icon: Icon(
                    CupertinoIcons.heart,
                    size: 22,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
