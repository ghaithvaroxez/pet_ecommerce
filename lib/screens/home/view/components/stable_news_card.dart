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
            bottom: 90,
            child: Container(
              height: getProportionateScreenHeight(133),
              width: getProportionateScreenWidth(297),
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
            top: 122,
            child: Container(
              height: 92,
              width: 315,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
                color: Colors.grey.shade200,
                // color: Colors.red,
              ),
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "سباق الخيل يبدأ الاحد المقبل سباق الخيل",
                            style: body1_16pt,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/home/stable_icon.png",
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "pets carnival",
                                style: darkGrayText_14pt,
                              ),
                              // Icon(Icons.location_on_rounded,color: Colors.grey,size: 16,),
                             SizedBox(width: 70,),
                              Image.asset(
                                "assets/images/home/location_icon.png",
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "فلسطين رام الله",
                                style: darkGrayText_14pt,
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 5,
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
