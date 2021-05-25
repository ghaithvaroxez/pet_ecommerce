import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/main_screen/controller/title_controller.dart';
import 'package:pets_ecommerce/screens/main_screen/model/main_screen_model.dart';


class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: 5,
        color: Colors.white,
        child: Container(
            width: SizeConfig.screenWidth,
            height: getProportionateScreenHeight(95),
            child: Row(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(24),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade50,
                  child: Image.asset(
                    "assets/images/home/notification_icon.png",
                    height: 24,
                    width: 20,
                  ),
                ),
                Spacer(),
                Obx(()=>Container(height:getProportionateScreenHeight(28),width:getProportionateScreenWidth(75),child: AutoSizeText(customTitle.title.value,style: h5_21pt,minFontSize: 8,))),
                Spacer(),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade50,
                  child: Image.asset(
                    "assets/images/home/menu_icon.png",
                    height: 24,
                    width: 20,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(24),
                ),
              ],
            )),
      ),
    );
  }
}
