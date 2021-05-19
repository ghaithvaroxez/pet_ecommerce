import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top:getProportionateScreenHeight(210),height:getProportionateScreenHeight(412),width:SizeConfig.screenWidth,child: Container(child: Image.asset("assets/images/splash_screen/white_logo.png"),))
          ],
        ),
      ),
    );
  }
}
