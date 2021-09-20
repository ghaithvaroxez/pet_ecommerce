import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/main.dart';
import 'widgets/drawer/i18n/blocked_screen.i18n.dart';

class BlockedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: getProportionateScreenWidth(350),
            height: getProportionateScreenHeight(350),
            child: Lottie.asset('assets/images/auth/unAproved.json'),
          ),
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          Container(
            width: getProportionateScreenWidth(400),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16)),
            child: AutoSizeText(
              "لقد تم حظرك من استخدام هذا التطبيق  ".i18n,
              style: h5_21pt,
              textDirection:
                  appLocal == "ar" ? TextDirection.rtl : TextDirection.ltr,
            ),
          ),
        ],
      ),
    );
  }
}
