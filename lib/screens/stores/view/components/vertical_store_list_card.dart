import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/doctors/view/doctor_details.dart';
import 'package:pets_ecommerce/screens/home/view/components/favorite_icon.dart';
import 'package:pets_ecommerce/screens/home/view/components/open_now_coponent.dart';
import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/stores/view/store_details.dart';
import '../../model/all_stores.dart';

class VerticalStoreListCard extends StatelessWidget {
Store store;
VerticalStoreListCard({this.store});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(StoreDetailsPage(store));
      },
      child: Container(
        height: getProportionateScreenHeight(135),
        width: getProportionateScreenWidth(345),
        margin: EdgeInsets.only(
            left: getProportionateScreenWidth(24),
            right: getProportionateScreenWidth(24),
            bottom: getProportionateScreenHeight(25)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          boxShadow: shadow,
          color: backgroundGrey,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: getProportionateScreenHeight(134),
                width: getProportionateScreenWidth(154),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  // color: Colors.red
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  child: Image.network(
                   Api.imagePath+store.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            ///image
            // Positioned(
            //     bottom: 0,
            //     right: 0,
            //     child: OpenNow(
            //       rightBottom: true,
            //     )),

            ///open now
            Positioned(
              right: getProportionateScreenWidth(171),
              top: getProportionateScreenHeight(20),
              bottom: getProportionateScreenHeight(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(130),
                    child: AutoSizeText(
                     store.name,
                     style: body3_18pt,
                      maxLines: 1,
                      minFontSize: 9,
                    ),
                  ),

                  // store.openFrom!=null&&store.closedAt!=null ?
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
                        width: getProportionateScreenWidth(120),
                        child: Row(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(20),
                              // width: getProportionateScreenWidth(120),
                              child: AutoSizeText(
                                "${store.openFrom} ",textDirection: TextDirection.ltr,
                                style: body3_18pt,
                                minFontSize: 10,
                              ),
                            ),
                            Container(
                              height: getProportionateScreenHeight(20),
                              // width: getProportionateScreenWidth(120),
                              child: AutoSizeText(
                                "-",
                                style: body3_18pt,
                                minFontSize: 10,
                              ),
                            ),
                            Container(
                              height: getProportionateScreenHeight(20),
                              // width: getProportionateScreenWidth(120),
                              child: AutoSizeText(
                                "${store.closedAt} ",textDirection: TextDirection.ltr ,
                                style: body3_18pt,
                                minFontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                      // :Container(),
                  // store.district!=null?
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/home/location_icon.png",
                        height: getProportionateScreenHeight(12),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Container(
                        height: getProportionateScreenHeight(18),
                        width: getProportionateScreenWidth(120),
                        child: AutoSizeText(
                          store.district,
                          style: body3_18pt,
                          minFontSize: 10,
                        ),
                      ),
                    ],
                  ),
                      // :Container(),

                ],
              ),
            ),

            Positioned(left: 0, bottom: 0, child: SocialMedia(freez: true,)),

            ///social media
            Positioned(
              left: 25,
              top: 8,
              child: FavoriteIcon(),
            ),
          ],
        ),
      ),
    );
  }
}
