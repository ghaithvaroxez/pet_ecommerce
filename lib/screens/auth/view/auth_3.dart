import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/auth/view/components/auth_button.dart';
import 'package:pets_ecommerce/screens/home/view/home_view.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';
import 'package:get/get.dart';
class PhonAuthScreen extends StatefulWidget {
  @override
  _PhonAuthScreenState createState() => _PhonAuthScreenState();
}

class _PhonAuthScreenState extends State<PhonAuthScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
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
                  top: getProportionateScreenHeight(180),
                  bottom: getProportionateScreenHeight(343),
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
                    top: getProportionateScreenHeight(510),
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(25),
                    child: Text(
                      "أضف رقم هاتفك الجوال وكلمة المرور لانشاء حساب ",
                      style: subtitle1_16pt,
                    )),
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
                                  // Container(alignment: Alignment.bottomLeft,child: Text("رقم الهاتف الجوال",style: grayText_14pt,)),
                                  // SizedBox(width: getProportionateScreenWidth(30),),
                                  // Image.asset("assets/images/auth/mobile_icon.png",color: Color(0xFF348BA7).withOpacity(0.38),),
                                ],
                              )),
                          // Positioned(right:60,top:20,child: ),
                          CustomTextField(
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
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: getProportionateScreenHeight(635),
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
                    top: getProportionateScreenHeight(713),
                    left: getProportionateScreenWidth(16),
                    right: getProportionateScreenWidth(25),
                    child: AuthButton(
                      color: true,
                      title: "إنشاء حساب",
                      ontap: () {Get.to(HomeScreen());},
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
