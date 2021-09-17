import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/controller/requests/auth_requests.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/auth/view/components/auth_button.dart';
import 'package:get/get.dart';
import 'package:pets/screens/auth/view/login/login_screen.dart';
import 'package:pets/screens/auth/view/register/register_types_screen.dart';
import 'package:pets/screens/main_screen/view/main_view.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import './translation/login_or_register.i18n.dart';
import '../../../un_aprovverd_screen.dart';

class LoginOrRegister extends StatefulWidget {
  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  getUser()async{
    UserModel userModel=await AuthServices.getCurrentUser();
    //
    // gusetId=userModel.user.id;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
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
            top: getProportionateScreenHeight(571),
            left: getProportionateScreenWidth(16),
            right: getProportionateScreenWidth(16),
            child: AuthButton(
                color: true,
                title: "الدخول كزائر".i18n,
                ontap: () async {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.loading,
                  );
                  AuthRequest _authRequest = new AuthRequest();
                  UserModel user = await _authRequest.loginRequest(
                      mobile: "00963962749232",
                      password: "123456");
                  if (user.error == false) {
                    if (user.user.approve == "pending") {
                      Navigator.of(context).pop();
                      Get.offAll(UnApprovedScreen());
                    } else {
                      Navigator.of(context).pop();
                      Duration duration = Duration(seconds: 1);
                      Future.delayed(duration)
                          .then((value) => Get.offAll(MainScreen()));
                    }
                  } else {
                    Navigator.of(context).pop();
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: " الرجاء المحاولة مجدداً".i18n,
                    );
                  }
                }),
          ),
          Positioned(
            top: getProportionateScreenHeight(642),
            left: getProportionateScreenWidth(16),
            right: getProportionateScreenWidth(16),
            child: AuthButton(
                color: true,
                title: "تسجيل دخول".i18n,
                ontap: () {
                  Get.to(LoginScreen());
                }),
          ),
          Positioned(
            top: getProportionateScreenHeight(713),
            left: getProportionateScreenWidth(16),
            right: getProportionateScreenWidth(16),
            child: AuthButton(
              color: false,
              title: "إنشاء حساب".i18n,
              ontap: () {
                Get.to(SignUpTypeScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
