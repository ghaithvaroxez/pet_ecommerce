import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';

class StoreAndStableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: getProportionateScreenWidth(193),
      // height: getProportionateScreenHeight(150),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          color: Colors.white),
      child: Stack(
        children: [
          Positioned(
              top: 120,
              child: Container(
                height: 95,
                width: 205.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: Colors.grey.shade200,
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
                              "pets carnival",
                              style: body1_16pt,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Icon(Icons.location_on_rounded,color: Colors.grey,size: 16,),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Icon(Icons.location_on_rounded,color: Colors.grey,size: 16,),
                                Image.asset(
                                  "assets/images/home/location_icon.png",
                                  height: 12,
                                  width: 12,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "53 كم",
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
            bottom: 2,
            left: 2,
            child: SocialMedia(),
          ),///social media
          Positioned(
              // left: 15,
              bottom: 90,
              child: Container(
                height: getProportionateScreenHeight(133),
                width: getProportionateScreenWidth(194),
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  child: Image.asset(
                    "assets/images/home/shop_image.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )),///photo
          Positioned(
              bottom: 70,
              left: 20,
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
            bottom: 90,
            width: 73,
            height: 27,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors:
                   [

                     Colors.brown.withOpacity(0.8),
                     // Colors.white,
                     Colors.brown,
                   ]
               ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
              ),
              child: Center(
                child: AutoSizeText(
                  "مفتوح الان"
                  ,minFontSize: 11
                      ,style: blueButton_14pt,
                ),
              ),
            ),
          ),///opens now
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
