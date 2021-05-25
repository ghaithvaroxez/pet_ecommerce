import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/auth/view/components/auth_button.dart';
import 'package:get/get.dart';

import 'auth_3.dart';
class SignUpTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: getProportionateScreenHeight(55),
              left: getProportionateScreenWidth(130),
              right: getProportionateScreenWidth(130),
              child: Text(
                "إنشاء حساب",
                style: h4_21pt,
              ),
            ),

            ///text
            Positioned(
              top: 120,
              child: Container(
                height: getProportionateScreenHeight(400),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage("assets/images/splash_screen/white_logo.png"),
                )),
              ),

              ///logo)
            ),
            Positioned(
              top: getProportionateScreenHeight(570),
              left: getProportionateScreenWidth(14),
              right: getProportionateScreenWidth(14),
              child: AuthButton(
                color: true,
                title: "كمستخدم",
                image: "assets/images/auth/user_icon.png",
                ontap: (){Get.to(PhonAuthScreen());},
              ),
            ),
            Positioned(
              top: getProportionateScreenHeight(642),
              left: getProportionateScreenWidth(14),
              right: getProportionateScreenWidth(14),
              child: AuthButton(
                color: false,
                title: "كصاحب متجر",
                image: "assets/images/auth/vendor_icon.png",
                ontap: (){Get.to(PhonAuthScreen());},
              ),
            ),
            Positioned(
              top: getProportionateScreenHeight(714),
              left: getProportionateScreenWidth(14),
              right: getProportionateScreenWidth(14),
              child: AuthButton(
                color: false,
                title: "كطبيب بيطري",
                image: "assets/images/auth/doctor_icon.png",
                ontap: (){Get.to(PhonAuthScreen());},
              ),
            ),

          ],
        ),
      ),
    );
  }
}
