import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';

import '../../../../main.dart';

class CustomeProfileItem extends StatelessWidget {
  String title;
  String img;
  bool isExpanded;
  bool isRed;
  Function onTap;

  CustomeProfileItem(
      {this.title,
      this.img,
      this.isExpanded = false,
      this.onTap,
      this.isRed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getProportionateScreenWidth(361),
      height: getProportionateScreenHeight(48),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Container(
              alignment: Alignment.center,
              width: getProportionateScreenWidth(16),
              height: getProportionateScreenHeight(20),
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Container(
              alignment: appLocal == "ar"
                  ? Alignment.bottomRight
                  : Alignment.bottomLeft,
              width: getProportionateScreenWidth(180),
              height: getProportionateScreenHeight(30),
              child: AutoSizeText(
                title,
                style: darkGrayText_14pt,
                maxLines: 1,
                minFontSize: 9,
              ),
            ),
            Spacer(),
            isExpanded
                ? Directionality(
                    textDirection: appLocal == "ar"
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.grey,
                      size: 16,
                    ),
                  )
                : Container(),
            SizedBox(
              width: getProportionateScreenWidth(22),
            ),
          ],
        ),
      ),
    );
  }
}
