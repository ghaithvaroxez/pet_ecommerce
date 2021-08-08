import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/main_screen/view/main_view.dart';
import 'package:pets_ecommerce/services/local_storage_service.dart';
import '../register/register_types_screen.dart';
import 'login_or_register.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    LocalStorageService.getPrefs();
    // AuthServices.getCurrentUser();
    Duration duration = Duration(seconds: 2);
    Future.delayed(duration).then((value) =>
    // AuthServices.authenticated()?Get.to(MainScreen()):
    Get.to(LoginOrRegister()));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: getProportionateScreenHeight(210),
              height: getProportionateScreenHeight(412),
              width: SizeConfig.screenWidth,
              child: Container(
                child:
                    Image.asset("assets/images/splash_screen/white_logo.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
