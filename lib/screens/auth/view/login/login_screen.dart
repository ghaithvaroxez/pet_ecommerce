import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/controller/requests/auth_requests.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/login.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/auth/view/components/auth_button.dart';
import 'package:pets/screens/doctor_app/requests/doctor_info_requests.dart';
import 'package:pets/screens/doctor_app/view/doctor_details_screen.dart';
import 'package:pets/screens/home/view/home_view.dart';
import 'package:pets/screens/main_screen/view/main_view.dart';
import 'package:pets/screens/vendor_app/view/vendor_details_screen.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'package:get/get.dart';

import '../../../un_aprovverd_screen.dart';
import 'translations/login_screen.i18n.dart';import '../../../blocked_screen.dart';
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
                      "تسجيل الدخول".i18n,
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
                            "أضف رقم هاتفك الجوال وكلمة المرور لتسجيل الدخول".i18n,
                            style: subtitle1_16pt,

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
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 0.2)),
                    child:
                        CustomTextField(
                          textEditingController: loginPhoneNumberController,
                          hint: "رقم الهاتف الجوال".i18n,
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

                Positioned(
                  top: getProportionateScreenHeight(560),
                  height: getProportionateScreenHeight(65),
                  left: getProportionateScreenWidth(16),
                  right: getProportionateScreenWidth(25),
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
                          hint: "كلمة السر".i18n,
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
                Positioned(
                    top: getProportionateScreenHeight(650),
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(16),
                    child: AuthButton(
                      color: true,
                      title:  "تسجيل الدخول".i18n,
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
        text: "الرجاء ادخال رقم هاتف لتسجيل الدخول ".i18n,
      );
      return;
    }
    if(
    loginPasswordController.text==""
    ){
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "الرجاء ادخال كلمة مرور لتسجيل الدخول ".i18n,
      );
      return;
    }
    if(!AuthServices.isValidPhoneNumber(loginPhoneNumberController.text))
    {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: " رقم الهاتف الذي ادخلته غير صالح".i18n,
      );
      return ;
    }
    if(loginPasswordController.text.length<6)
    {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "كلمة المرور قصيرة جدا".i18n,
      );
      return ;
    }
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      // text: " رقم الهاتف  أو كلمة المرور غير صحيحة",
    );
    try{
      UserModel user = await _authRequest.loginRequest(
          mobile: loginPhoneNumberController.text,
          password: loginPasswordController.text);

      Navigator.pop(context);
      if (user.error == false) {
        if (user.user.approve == "pending") {
          Get.offAll(UnApprovedScreen());
        }
        else if (user.user.blockStatus == "blocked") {
          Get.offAll(BlockedScreen());
        }
        else {
          Duration duration = Duration(seconds: 1);
          Future.delayed(duration).then((value) async {
            DoctorAppRequests doctorAppRequests = DoctorAppRequests();
            doctorAppRequests.getModel();
            String token = await FirebaseMessaging.instance.getToken();
            doctorAppRequests.updateDeviceId(device_id: token);
            Get.offAll(MainScreen());
          }
          );
        }
      }
      else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: " رقم الهاتف  أو كلمة المرور غير صحيحة".i18n,
        );
      }
    }catch(e){
      Navigator.pop(context);
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "الرجاء المحاولة مجدداً".i18n,
      );
    }
  }
}
