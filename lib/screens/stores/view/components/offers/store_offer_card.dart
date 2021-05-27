import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';


class StoreOfferCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 6,vertical: 20),
      width: getProportionateScreenWidth(163),
      height: getProportionateScreenHeight(187),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            // left: 15,
            //   bottom: getProportionateScreenHeight(45),
            top: 0,
              child: Container(
                height: getProportionateScreenHeight(149),
                width: getProportionateScreenWidth(162.7
                ),
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  child: Image.asset(
                    "assets/images/home/offers_dog.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
          ),///photo

          Positioned(
            right: 0,
            bottom: getProportionateScreenHeight(45),
            width: getProportionateScreenWidth(85),
            height: getProportionateScreenHeight(27),
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(6)),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:
                    [

                      Colors.grey.withOpacity(0.2),
                      Colors.grey.withOpacity(0.6),
                      // Colors.white,
                      Colors.grey,
                    ]
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
              ),
              child: Container(

                child: Row(
                  children: [
                    Icon(Icons.watch_later,size: 10,color: Colors.white,),
                    SizedBox(width: 5,),
                    AutoSizeText(
                      "منذ ساعة"
                      ,minFontSize: 8
                      ,style: blueButton_14pt,
                    ),
                  ],
                ),
              ),
            ),
          ),///opens now
          Positioned(
              top: getProportionateScreenHeight(142),
             // bottom: getProportionateScreenHeight(0),
              child: Container(
                alignment: Alignment.center,
                height: getProportionateScreenHeight(45),
                width: getProportionateScreenWidth(162.7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: Colors.white,
                  // color: Colors.red,
                ),
                child:  Container(
                  alignment: Alignment.center,
                  height: getProportionateScreenHeight(45),
                  width: getProportionateScreenWidth(120.7),
                  child: AutoSizeText(
                    "pets carnival",
                    style: h6_20pt,
                    minFontSize: 8,
                  ),
                ),
              )),///grey footer
        ],
      ),

    );
  }
}
