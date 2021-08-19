import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';

import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';
import 'package:pets_ecommerce/screens/stores/model/custoer_store_offer.dart';
import 'package:pets_ecommerce/screens/stores/view/components/offers/offers_details_screen.dart';

import 'favorite_icon.dart';
import 'package:get/get.dart';
class OfferCard extends StatelessWidget {
  Offer offer;
  Function fav;
  OfferCard(this.offer,this.fav);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(OfferDetailsPage(offer));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        width: getProportionateScreenWidth(190),
        // height: getProportionateScreenHeight(150),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3, color: borderColor),
            color: Colors.white),
child: Stack(
  children: [
      Positioned(
        // left: 15,
          bottom: getProportionateScreenHeight(60),
          child: Container(
            height: getProportionateScreenHeight(165),
            width: getProportionateScreenWidth(189.7
            ),
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12)),
              child: offer.image==""||offer.image==null?Image.asset(
                "assets/images/home/offers_dog.png",
                fit: BoxFit.fill,
              ):Image.network(
                Api.imagePath+offer.image,
                fit: BoxFit.fill,
              ),
            ),
          )),///photo

      Positioned(
        bottom: getProportionateScreenHeight(60),
        width: getProportionateScreenWidth(85),
        height: getProportionateScreenHeight(27),
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenHeight(6)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:
                [

                  Colors.grey.withOpacity(0.2),
                  Colors.grey.withOpacity(0.6),
                  // Colors.white,
                  Colors.grey,
                ]
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
          ),
          child: Container(

            child: Row(
              children: [
                Icon(Icons.watch_later,size: 10,color: Colors.white,),
                SizedBox(width: 5,),
                Container(
                  // width: getProportionateScreenWidth(60),
                  height: getProportionateScreenHeight(25),
                  child: AutoSizeText(

                    offer.date
                    ,minFontSize: 8
                    ,maxLines: 1
                    ,style: blueButton_14pt,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),///opens now
      Positioned(
          top: getProportionateScreenHeight(163),
          child: Container(
            height: getProportionateScreenHeight(51),
            width: getProportionateScreenWidth(200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              color: Colors.white,
              // color: Colors.red,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(11),
                ),
                Text(
                  offer.name,
                  style: h6_20pt,
                ),

              ],
            ),
          )),///grey footer
      Positioned(
          left: 25,
          top: 8,
          child: FavoriteIcon(s:offer.favStatus ,fav: fav,)),
  ],
),

      ),
    );
  }
}
