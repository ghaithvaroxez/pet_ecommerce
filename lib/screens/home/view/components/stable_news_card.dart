import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';


class StableNewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: getProportionateScreenWidth(299),
      // height: getProportionateScreenHeight(150),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          color: Colors.white),
      child: Stack(
      children: [
        Positioned(
          // left: 15,
            bottom: getProportionateScreenHeight(90),
            child: Container(
              height: getProportionateScreenHeight(134.7),
              width: getProportionateScreenWidth(298.7),
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                child: Image.asset(
                  "assets/images/home/hourse_house.png",
                  fit: BoxFit.fill,
                ),
              ),
            )),///
        Positioned(
            top: getProportionateScreenHeight(135),
            child: Container(
              height: getProportionateScreenHeight(87.7),
              width: getProportionateScreenWidth(299.7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
                color: Colors.grey.shade200,
                // color: Colors.red,
              ),
              child: Container(
                  // alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(15),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: getProportionateScreenHeight(15),
                          // ),
                          Container(
                            height: getProportionateScreenHeight(40),
                            width: getProportionateScreenWidth(280),
                            child: AutoSizeText(
                              "سباق الخيل يبدأ الاحد المقبل سباق الخيل",
                              style: body1_16pt,
                            ),
                          ),
                          // SizedBox(
                          //   height: getProportionateScreenHeight(20),
                          // ),
                          Container(
                            height: getProportionateScreenHeight(30),
                            width: getProportionateScreenWidth(280),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/home/stable_icon.png",
                                  height: getProportionateScreenHeight(12),
                                  width: getProportionateScreenWidth(12),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                Container(
                                  width: getProportionateScreenWidth(100),
                                  child: AutoSizeText(
                                    "pets carnival",
                                    style: darkGrayText_14pt,
                                  ),
                                ),
                                // Icon(Icons.location_on_rounded,color: Colors.grey,size: 16,),
                               // SizedBox(width: getProportionateScreenWidth(70),),
                              Spacer(),
                                Image.asset(
                                  "assets/images/home/location_icon.png",
                                  height: getProportionateScreenHeight(12),
                                  width: getProportionateScreenWidth(12),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                Container(
                                  width: getProportionateScreenWidth(100),
                                  child: AutoSizeText(
                                    "فلسطين رام الله",
                                    style: darkGrayText_13pt,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                        ],
                      ),
                    ],
                  )),
            )),///grey footer
        Positioned(
            bottom: 75,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                child: Center(
                  child: Text(
                    "Logo",
                    style: body2_14pt,
                  ),
                ),
              ),
            )),///logo circle
        Positioned(
          right: 10,
          top: 8,
          child: Container(
            height: getProportionateScreenHeight(14),
            width: getProportionateScreenWidth(15),
            child: IconButton(
              icon: Icon(
                Icons.share_outlined,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),///share icon
      ],

      ),
    );
  }
}
