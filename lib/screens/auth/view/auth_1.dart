import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/auth/view/components/auth_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
         Positioned(
              top: getProportionateScreenHeight(120),
              height: getProportionateScreenHeight(412),
              width: SizeConfig.screenWidth,
              child: Container(
                child:
                    Image.asset("assets/images/splash_screen/white_logo.png"),
              )),
          Positioned(
              top: getProportionateScreenHeight(642),
              left: getProportionateScreenWidth(16),
              right: getProportionateScreenWidth(16),

              child:AuthButton(color: true,title: "متابعة كزائر",ontap: (){},),
          ),
          Positioned(
              top: getProportionateScreenHeight(713),
              left: getProportionateScreenWidth(16),
              right: getProportionateScreenWidth(16),
              child:
              AuthButton(color: false,title: "إنشاء حساب",ontap: (){},),


          ),
        ],
      ),
    );
  }
}
