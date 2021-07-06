import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/corner/view/my_corner_details.dart';
import 'components/drawer_item.dart';
import 'package:pets_ecommerce/screens/profile/view/profile_screen.dart';
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: SizeConfig.screenHeight,
        width: getProportionateScreenWidth(288),
        child: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(271),
              width: getProportionateScreenWidth(288),
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: getProportionateScreenHeight(271),
                        width: getProportionateScreenWidth(288),
                        child: Image.asset(
                    "assets/images/drawer/image_background.png",
                    fit: BoxFit.fill,
                  ),
                      )),
                  Positioned(
                    bottom: getProportionateScreenHeight(90),
                    left: getProportionateScreenWidth(90),
                    child: Container(
                      height: getProportionateScreenHeight(111),
                      width: getProportionateScreenWidth(111),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/drawer/user_img.png"),
                    ),
                  ),
                  Positioned(
                    bottom: getProportionateScreenHeight(55),

                    child: Container(
                      width: getProportionateScreenWidth(288),
                      height: getProportionateScreenHeight(30),
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "أحمد العمودي",
                        style: body1_16pt,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Expanded(
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      //user
                      CustomeDraweritem(
                        title: "حسابي",
                        img: "assets/images/drawer/drawer_icons/user_icon.png",
                        onTap: () {
                          Get.back();
                          Get.to(ProfileScreen());
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //categories
                      CustomeDraweritem(
                        title: "أصناف",
                        img:
                            "assets/images/drawer/drawer_icons/category_icon.png",
                      onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //favorite
                      CustomeDraweritem(
                        title: "المفضلة",
                        img:
                            "assets/images/drawer/drawer_icons/favorite_icon.png",
                      onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //map
                      CustomeDraweritem(
                        title: "الخريطة",
                        img:
                            "assets/images/drawer/drawer_icons/location_icon.png",
                      onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //money
                      CustomeDraweritem(
                        title: "تسديد الاشتراك",
                        img: "assets/images/drawer/drawer_icons/money_icon.png",
                      onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //my_baqa
                      CustomeDraweritem(
                        title: "باقتي",
                        img:
                            "assets/images/drawer/drawer_icons/my_baqa_icon.png",
                      onTap: () {
                          Get.back();
                        },
                        isExpanded: true,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //my_status
                      CustomeDraweritem(
                        title: "حالتي",
                        img:
                            "assets/images/drawer/drawer_icons/status_icon.png",
                      onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //my_corner
                      CustomeDraweritem(
                        title: "زاويتي",
                        img:
                            "assets/images/drawer/drawer_icons/corner_icon.png",
                      onTap: () {
                          Get.back();
                          Get.to(MyCornerDetails());
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //setting
                      CustomeDraweritem(
                        title: "الإعدادت",
                        img:
                            "assets/images/drawer/drawer_icons/setting_icon.png",
                      onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      //user
                      Spacer(),
                      CustomeDraweritem(
                        title: "تسجيل الخروج",
                        img:
                            "assets/images/drawer/drawer_icons/logout_icon.png",
                      onTap: () {
                          Get.back();
                        },
                        isRed: true,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
