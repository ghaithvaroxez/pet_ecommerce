import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/view/components/favorite_icon.dart';
import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';

class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: getProportionateScreenWidth(161),
      height: getProportionateScreenHeight(230),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          color: Colors.white),
      child: Stack(
        children: [

          Positioned(
              height: getProportionateScreenHeight(190),
              width: getProportionateScreenWidth(160),
              bottom: getProportionateScreenHeight(40),
              child: Image.asset(
                "assets/images/home/female_doctor.png",
                fit: BoxFit.fitHeight,
              )),///doctor_image
          Positioned(
              top: getProportionateScreenHeight(150),
              child: Container(
                height: getProportionateScreenHeight(80),
                width: getProportionateScreenWidth(169),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: Colors.grey.shade200,
                  // color: Colors.red,
                ),
                child: Container(
                  height: getProportionateScreenHeight(80),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container
                        (height: (getProportionateScreenHeight(40)),
                        child: AutoSizeText(
                          "منى الأحمد",
                          style: h6_20pt,
                        ),
                      ),
                      Container(
                        height: getProportionateScreenHeight(30),
                        child: Row(
                          children: [
                            Spacer(),
                            SocialMedia(),
                            SizedBox(width: getProportionateScreenWidth(5),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),///grey footer
          Positioned(
            right: getProportionateScreenWidth(10),
            top: getProportionateScreenHeight(8),
            child: Container(
              height: getProportionateScreenHeight(14),
              width: getProportionateScreenWidth(15),
              child: IconButton(
                icon: Icon(
                  Icons.share_outlined,
                  size: 22,
                ),
              ),
            ),
          ),///share icon
          Positioned(
            left: getProportionateScreenWidth(25),
            top: getProportionateScreenHeight(8),
            child:FavoriteIcon(),
          ),///favorite icon

        ],
      ),
    );
  }
}
