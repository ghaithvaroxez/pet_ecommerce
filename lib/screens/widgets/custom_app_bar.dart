import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';

import 'package:pets/screens/main_screen/controller/title_controller.dart';
import 'package:pets/screens/main_screen/model/main_screen_model.dart';

import 'package:pets/screens/notifications/view/notification_button.dart';
class CustomAppBar extends StatelessWidget {
  final Function open_drawer;

  const CustomAppBar({Key key, this.open_drawer}) : super(key: key);
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
                GestureDetector(
                  onTap: open_drawer,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade50,
                    child: Image.asset(
                      "assets/images/home/menu_icon.png",


                      height: 24,
                      width: 20,
                    ),
                  ),
                ),
                Spacer(),
                Obx(()=>Container(height:getProportionateScreenHeight(28),width:getProportionateScreenWidth(75),child: AutoSizeText(customTitle.title.value,style: h5_21pt,minFontSize: 8,))),
                Spacer(),
                NotificationButton(),
                SizedBox(
                  width: getProportionateScreenWidth(24),
                ),
              ],
            )),
      ),
    );
  }
}
