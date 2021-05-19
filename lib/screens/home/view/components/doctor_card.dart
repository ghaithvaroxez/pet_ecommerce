import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';

class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: getProportionateScreenWidth(161),
      // height: getProportionateScreenHeight(150),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          color: Colors.white),
      child: Stack(
        children: [

          Positioned(
              height: 180,
              width: 160,
              bottom: 40,
              child: Image.asset(
                "assets/images/home/female_doctor.png",
                fit: BoxFit.fitHeight,
              )),///doctor_image
          Positioned(
              top: 150,
              child: Container(
                height: 59,
                width: 169,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color: Colors.grey.shade200,
                  // color: Colors.red,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      "منى الأحمد",
                      style: h6_20pt,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        SocialMedia(),
                      ],
                    ),
                  ],
                ),
              )),///grey footer
          Positioned(
            right: 10,
            top: 8,
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
            ),
          ),///favorite icon

        ],
      ),
    );
  }
}
