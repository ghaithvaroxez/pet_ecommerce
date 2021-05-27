import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';

class ReviewCad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(345),
      height: getProportionateScreenHeight(85),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: offWhite,
        boxShadow: shadow,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: getProportionateScreenHeight(85),
              width: getProportionateScreenWidth(70),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.asset("assets/images/store/woman.png"),
              ),
            ),
          ),
          Positioned(
              right: getProportionateScreenWidth(83),
              child: Container(
                height: getProportionateScreenHeight(85),
                width: getProportionateScreenWidth(235),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(200),
                      child: AutoSizeText(
                        "سميرة علي",
                        style: body2_14pt,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(50),
                      width: getProportionateScreenWidth(200),
                      child: AutoSizeText(
                        "نص التقييم هنا",
                        style: darkGrayText_11pt,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              left: getProportionateScreenWidth(5),
              top: getProportionateScreenHeight(10),
              child: Container(
                child: Row(
                  children: [
                    AutoSizeText("5",style: darkGrayText_11pt,minFontSize: 8,),


                    SizedBox(width: getProportionateScreenWidth(2),),
                    Image.asset("assets/images/store/star_icon.png"),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
