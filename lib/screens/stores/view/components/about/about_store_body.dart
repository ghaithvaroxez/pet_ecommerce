import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';
import 'package:pets_ecommerce/screens/stores/view/components/about/review_card.dart';

class AboutStoreBodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(24),
              vertical: getProportionateScreenHeight(26)),
          child: ListView(
            children: [
              Row(
                children: [
                  AutoSizeText(
                    "Pets Carival",
                    style: h5_25pt,
                    minFontSize: 16,
                  ),
                  Spacer(),
                  SocialMedia(),
                ],
              ),

              ///first row
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              Container(
                height: getProportionateScreenHeight(25),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Icon(Icons.location_on_rounded,color: Colors.grey,size: 16,),
                    Image.asset(
                      "assets/images/home/location_icon.png",
                      height: getProportionateScreenHeight(12),
                      width: getProportionateScreenWidth(12),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    AutoSizeText(
                      "فلسطين رام الله",
                      // minFontSize: 8,
                      style: darkGrayText_13pt,
                    ),
                  ],
                ),
              ),

              ///location
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
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
                    alignment: Alignment.bottomCenter,
                    child: AutoSizeText(
                      "الاثنين من 9 صباحا  لغاية 9 مساء",
                      maxLines: 1,
                      style: body3_18pt,
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
                  Container(height:getProportionateScreenHeight(30), width:getProportionateScreenWidth(120),child: AutoSizeText("احدث التقييمات",style:body3_18pt,minFontSize: 12,)),
                  Container(height:getProportionateScreenHeight(15),width:getProportionateScreenWidth(80),child: AutoSizeText("عرض المزيد ",style: body2_14pt,minFontSize: 8,)),
                ],
              ),
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
      );
  }
}
