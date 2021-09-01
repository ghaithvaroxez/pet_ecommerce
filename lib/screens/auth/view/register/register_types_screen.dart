import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/model/contstants.dart';
import 'package:pets/screens/auth/view/components/auth_button.dart';
import 'package:get/get.dart';
import 'package:pets/screens/auth/view/login/login_screen.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';



class SignUpTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15,),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(55),),
              Container(
                child: Text(
                  "إنشاء حساب",
                  style: h4_21pt,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),

              ///text
              Container(
                height: getProportionateScreenHeight(350),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage("assets/images/splash_screen/white_logo.png"),
                )),
              ),
              AuthButton(
                color: true,
                title: "كمستخدم",
                image: "assets/images/auth/user_icon.png",
                ontap: () {
                  Get.to(() => RegisterScreen(UserType.user));
                },
              ),
              // SizedBox(height: getProportionateScreenHeight(10),),
              AuthButton(
                color: false,
                title: "كصاحب متجر",
                image: "assets/images/auth/vendor_icon.png",
                ontap: () {
                  Get.to(() => RegisterScreen(UserType.store));
                },
              ),
              // SizedBox(height: getProportionateScreenHeight(10),),
              AuthButton(
                color: false,
                title: "كصاحب اسطبل",
                image: "assets/images/auth/vendor_icon.png",
                ontap: () {
                  Get.to(() => RegisterScreen(UserType.stable));
                },
              ),
              AuthButton(
                color: false,
                title: "كصاحب منحلة",
                image: "assets/images/auth/vendor_icon.png",
                ontap: () {
                  Get.to(() => RegisterScreen(UserType.sieve));
                },
              ),
              // SizedBox(height: getProportionateScreenHeight(10),),
              AuthButton(
                color: false,
                title: "كطبيب بيطري",
                image: "assets/images/auth/doctor_icon.png",
                ontap: () {
                  Get.to(() => RegisterScreen(UserType.doctor));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
