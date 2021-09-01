import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/corner/view/my_corner_details.dart';
import 'package:pets/screens/widgets/drawer/components/drawer_item.dart';
import 'package:pets/screens/profile/view/components/profile_item.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          height: getProportionateScreenHeight(851),
          width: getProportionateScreenWidth(395),
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(325),
                width: getProportionateScreenWidth(395),
                child: Stack(
                  children: [
                    Positioned(child: Container(
                      height: getProportionateScreenHeight(48),
                      width: getProportionateScreenWidth(48),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/profile/back_circle.png"),
                    )),
                    Positioned(
                        child: Container(
                          height: getProportionateScreenHeight(325),
                          width: getProportionateScreenWidth(395),
                          child: Image.asset(
                            "assets/images/drawer/image_background.png",
                            fit: BoxFit.fill,
                          ),
                        )),
                    Positioned(
                      bottom: getProportionateScreenHeight(140),
                      // left: getProportionateScreenWidth(130),
                      child: Container(
                        height: getProportionateScreenHeight(143),
                        width: getProportionateScreenWidth(395),
                        alignment: Alignment.center,
                        child: Container(
                          height: getProportionateScreenHeight(143),
                          width: getProportionateScreenWidth(143),

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Container(
                                  height: getProportionateScreenHeight(143),
                                  width: getProportionateScreenWidth(143),child: Image.asset("assets/images/drawer/user_img.png")),
                              // Positioned(bottom:getProportionateScreenHeight(-6) ,right:getProportionateScreenWidth(15),child: Container(height:35,width:35,child: Image.asset("assets/images/vendor_app/camera.png"),))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: getProportionateScreenHeight(60),
// right: getProportionateScreenWidth(130),
                      child: Container(
                        width: getProportionateScreenWidth(395),
                        height: getProportionateScreenHeight(40),
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          "أحمد العمودي",
                          style: teal_25pt,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              Expanded(
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        //user
                        CustomeProfileItem(
                          title: " المعلومات الشخصية ",
                          img: "assets/images/profile/personal_info_icon.png",
                          onTap: () {
                            // Get.back();
                            // Get.to(EditProfileScreen());
                          },
                          isExpanded: true,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        //categories

                        //favorite
                        CustomeProfileItem(
                          title: "المفضلة",
                          img:
                          "assets/images/drawer/drawer_icons/favorite_icon.png",
                          onTap: () {
                            // Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        //map
                        CustomeProfileItem(
                          title: "الإشعارات",
                          img:
                          "assets/images/profile/notification_icon.png",
                          onTap: () {
                            // Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),

                        //money
                        CustomeProfileItem(
                          title: "طلباتي",
                          img: "assets/images/profile/my_orders_icon.png",
                          onTap: () {
                            // Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        CustomeProfileItem(
                          title: "زاويتي",
                          img:
                          "assets/images/drawer/drawer_icons/corner_icon.png",
                          onTap: () {
                            Get.back();
                            Get.to(MyCornerDetails());
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        //my_baqa

                        //my_status
                        CustomeProfileItem(
                          title: "حالتي",
                          img:
                          "assets/images/drawer/drawer_icons/status_icon.png",
                          onTap: () {
                            Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        //my_corner

                        //setting
                        CustomeProfileItem(
                          title: "الإعدادت",
                          img:
                          "assets/images/drawer/drawer_icons/setting_icon.png",
                          onTap: () {
                            Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),

                        CustomeProfileItem(
                          title: "الأسئلة الشائعة",
                          img:
                          "assets/images/profile/questions_icon.png",
                          onTap: () {
                            Get.back();
                          },
                        ),

                        //user
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        CustomeProfileItem(
                          title: "تسجيل الخروج",
                          img:
                          "assets/images/drawer/drawer_icons/logout_icon.png",
                          onTap: () {
                            Get.back();
                          },
                          isRed: true,
                        ),

                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
