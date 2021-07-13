import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';
import 'package:pets_ecommerce/screens/stores/view/components/about/review_card.dart';


class DoctorPersonalInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24),
            vertical: getProportionateScreenHeight(26)),
        child: ListView(
          children: [
            SizedBox(height: getProportionateScreenHeight(15),),
            Row(
              children: [
                Container(
                  height: getProportionateScreenHeight(30),
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    "مواعيد العمل",
                    minFontSize: 14,
                    style: body3_18pt,
                    maxLines: 1,
                  ),
                ),
                Spacer(),
                SocialMedia(),
              ],
            ),



            ///مواعيد العمل
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/home/clock_icon.png",
                  height: getProportionateScreenHeight(12),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Container(
                  height: getProportionateScreenHeight(20),
                  width: getProportionateScreenWidth(200),
                  alignment: Alignment.bottomRight,
                  child: AutoSizeText(
                    "الاثنين من 9 صباحا  لغاية 9 مساء",
                    maxLines: 1,
                    style: darkGrayText_16pt,
                    minFontSize: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(105)
              ),
              width: getProportionateScreenWidth(150),
              height: getProportionateScreenHeight(60),
              alignment: Alignment.center,
              // color: Colors.green,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: getProportionateScreenWidth(60),height:getProportionateScreenHeight(60),child: Image.asset("assets/images/store/phone_button_icon.png")),
                  SizedBox(width: getProportionateScreenWidth(12),),
                  Container(width: getProportionateScreenWidth(60),height:getProportionateScreenHeight(60),child: Image.asset("assets/images/store/email_buttom_icon.png")),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height:getProportionateScreenHeight(30), child: AutoSizeText("احدث التقييمات",style:body3_18pt,minFontSize: 12,maxLines: 1,)),
                Container(height:getProportionateScreenHeight(15),width:getProportionateScreenWidth(80),child: AutoSizeText("عرض المزيد ",style: body2_14pt,minFontSize: 8,)),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(10),),
            Column(
              children: [
                ReviewCad(),
                SizedBox(height: getProportionateScreenHeight(20),),
                ReviewCad(),
              ],
            ),

            SizedBox(height: getProportionateScreenHeight(25),),
            Container(width: getProportionateScreenWidth(370),height: getProportionateScreenHeight(152),child: Image.asset("assets/images/store/map.png",fit: BoxFit.fill,),)
          ],
        ),
      ),
    );;
  }
}
