import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/controller/requests/auth_requests.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/login.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/auth/view/components/auth_button.dart';
import 'package:pets_ecommerce/screens/doctor_app/view/doctor_details_screen.dart';
import 'package:pets_ecommerce/screens/home/view/home_view.dart';
import 'package:pets_ecommerce/screens/main_screen/view/main_view.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/vendor_details_screen.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';
import 'package:get/get.dart';

import '../../../un_aprovverd_screen.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController loginPhoneNumberController=new TextEditingController();
  TextEditingController loginPasswordController=new TextEditingController();
  AuthRequest _authRequest=new AuthRequest();
  @override
  void initState() {
    // TODO: implement initState
    loginPhoneNumberController.text="";
    loginPasswordController.text="";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: SizeConfig.screenWidth,
            height: getProportionateScreenHeight(800),
            child: Stack(
              children: [
                Positioned(
                  top: getProportionateScreenHeight(55),

                  child: Container(
                    width: getProportionateScreenWidth(390),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "تسجيل الدخول",
                      style: h4_21pt,
                      maxLines: 1,
                    ),
                  ),
                ),

                ///text

                Positioned(
                  top: getProportionateScreenHeight(100),
                  height: getProportionateScreenHeight(300),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          "assets/images/splash_screen/white_logo.png"),
                    )),
                  ),

                  ///logo)
                ),

                ///logo
                // SizedBox(
                //   height: getProportionateScreenHeight(25),
                // ),
                Positioned(
                    top: getProportionateScreenHeight(410),
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(25),
                    child: Column(
                      children: [
                          Container(
                            width: getProportionateScreenWidth(320),
                            child: AutoSizeText(
                            "أضف رقم هاتفك الجوال وكلمة المرور لتسجيل الدخول",
                            style: subtitle1_16pt,
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                        ),
                          ),
                        SizedBox(height: getProportionateScreenHeight(15),)
                      ],
                    )),
                Positioned(
                  top: getProportionateScreenHeight(485),
                  height: getProportionateScreenHeight(65),
                  left: getProportionateScreenWidth(16),
                  right: getProportionateScreenWidth(25),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 0.2)),
                      child:
                          CustomTextField(
                            textEditingController: loginPhoneNumberController,
                            hint: "رقم الهاتف الجوال",
                            prefixImage: "assets/images/auth/mobile_icon.png",
                            textInputType: TextInputType.phone,
                            color: true,
                          ),
                          // TextField(
                          //   decoration: InputDecoration(
                          //     border: InputBorder.none,
                          //     hintText:"رقم الهاتف الجوال",
                          //     hintStyle: grayText_14pt,
                          //     prefixIcon: Image.asset("assets/images/auth/mobile_icon.png",color: Color(0xFF348BA7).withOpacity(0.38),),
                          //   ),
                          //   keyboardType: TextInputType.phone,
                          // ),

                    ),
                  ),
                ),

                Positioned(
                  top: getProportionateScreenHeight(560),
                  height: getProportionateScreenHeight(65),
                  left: getProportionateScreenWidth(16),
                  right: getProportionateScreenWidth(25),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 0.2)),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 17,
                              right: 15,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Container(alignment: Alignment.bottomLeft,child: Text("كلمة السر",style: grayText_14pt,)),
                                  // SizedBox(width: getProportionateScreenWidth(30),),
                                  // Image.asset("assets/images/auth/lock_icon.png",),
                                ],
                              )),
                          // Positioned(right:60,top:20,child: ),
                          CustomTextField(
                            textEditingController: loginPasswordController,
                            hint: "كلمة السر",
                            prefixImage: "assets/images/auth/lock_icon.png",
                            password: true,
                            textInputType: TextInputType.name,
                          ),
                          // TextField(
                          //   decoration: InputDecoration(
                          //       border: InputBorder.none,
                          //       hintText:"كلمة السر",
                          //       hintStyle: grayText_14pt,
                          //       prefixIcon: Image.asset("assets/images/auth/lock_icon.png",),
                          //   ),
                          //   obscureText: true,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: getProportionateScreenHeight(650),
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                    child: AuthButton(
                      color: true,
                      title: "تسجيل دخول",
                      ontap: ()  {


login();
                        },
                    ),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login()async {
    if(
    loginPhoneNumberController.text==""
    ){
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "الرجاء ادخال رقم هاتف لتسجيل الدخول ",
      );
      return;
    }
    if(
    loginPasswordController.text==""
    ){
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "الرجاء ادخال كلمة مرور لتسجيل الدخول ",
      );
      return;
    }
    if(!AuthServices.isValidPhoneNumber(loginPhoneNumberController.text))
    {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: " رقم الهاتف الذي ادخلته غير صالح",
      );
      return ;
    }
    if(loginPasswordController.text.length<6)
    {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "كلمة المرور قصيرة جدا",
      );
      return ;
    }
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      // text: " رقم الهاتف  أو كلمة المرور غير صحيحة",
    );
    UserModel user=await _authRequest.loginRequest(mobile:loginPhoneNumberController.text , password: loginPasswordController.text);
    Navigator.pop(context);
    if(user.error==false) {
      if(user.user.approve == "pending") {

          Get.offAll(UnApprovedScreen());

      }
      else {
        if(user.user.role=="user")
          Get.offAll(MainScreen());
        else if(user.user.role=="provider")
          Get.offAll(VendorDetailsPage());
        else if(user.user.role=="doctor")
          Get.offAll(DoctorAppDetailsPage());
      }
    }
    else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: " رقم الهاتف  أو كلمة المرور غير صحيحة",
      );
    }
  }
}
