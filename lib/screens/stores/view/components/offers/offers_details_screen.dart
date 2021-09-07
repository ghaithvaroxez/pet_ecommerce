import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import 'package:pets/screens/stores/model/custoer_store_offer.dart';
import 'package:get/get.dart';

import '../../store_details_id.dart';
import 'translations/offers_details_screen.i18n.dart';
class OfferDetailsPage extends StatelessWidget {
  Offer offer;
  bool store;
  OfferDetailsPage(this.offer, {this.store=false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top:0,left:0,child: Container(
              height: getProportionateScreenHeight(357),
              width: getProportionateScreenWidth(394),
              child: Image.network(Api.imagePath+offer.image,fit: BoxFit.fill,),
            )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(357),
                child: Container(
                  child: Image.asset(
                    "assets/images/store/black_layer.png",
                    fit: BoxFit.fill,
                  ),
                )),

            Positioned(
              top: getProportionateScreenHeight(34),
              left: getProportionateScreenWidth(24),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: getProportionateScreenWidth(48),
                  height: getProportionateScreenHeight(48),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: getProportionateScreenHeight(295),
            //   left: getProportionateScreenWidth(10),
            //   child: Container(
            //     width: getProportionateScreenWidth(102),
            //     height: getProportionateScreenHeight(40),
            //     padding: EdgeInsets.only(top: getProportionateScreenHeight(10),bottom: getProportionateScreenHeight(10),left: getProportionateScreenWidth(15),right:getProportionateScreenWidth(25) ),
            //     decoration: BoxDecoration(
            //       // gradient: LinearGradient(colors: [
            //       //   Colors.brown,
            //       //   Colors.brown.withOpacity(0.6),
            //       //   // Colors.white,
            //       //
            //       // ]),
            //       color: Colors.white.withOpacity(0.60),
            //       borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(12),
            //           bottomLeft: Radius.circular(12)),
            //     ),
            //     child: Center(
            //       child: AutoSizeText(
            //         "\$"+ offer.price ,
            //         minFontSize: 11,
            //         style: blueButton_14pt,
            //       ),
            //     ),
            //   ),
            // ),

            Positioned(
              top: getProportionateScreenHeight(285),
              right: getProportionateScreenWidth(20),
              child: Container(
                // width: getProportionateScreenWidth(102),
                // height: getProportionateScreenHeight(53),
                // padding: EdgeInsets.only(top: getProportionateScreenHeight(10),bottom: getProportionateScreenHeight(10),left: getProportionateScreenWidth(15),right:getProportionateScreenWidth(25) ),
                decoration: BoxDecoration(
                  // gradient: LinearGradient(colors: [
                  //   Colors.brown,
                  //   Colors.brown.withOpacity(0.6),
                  //   // Colors.white,
                  //
                  // ]),
                  // color: Colors.white.withOpacity(0.70),
                  // borderRadius: BorderRadius.only(
                  //     topRight: Radius.circular(12),
                  //     bottomLeft: Radius.circular(12)),
                ),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: getProportionateScreenWidth(250),
                        child: AutoSizeText(
                          offer.name ,
                          minFontSize: 11,
                          style: blueButton_21pt,
                          maxLines: 1,
                          // textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Container(
                        width: getProportionateScreenWidth(250),
                        // color: Colors.redAccent,
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          offer.category ,
                          maxLines: 1,
                          textAlign: TextAlign.right,
                          minFontSize: 11,
                          style: blueButton_14pt,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(top:getProportionateScreenHeight(355),bottom:0,left:0,right:0,child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(8),horizontal: getProportionateScreenWidth(20)),
// color: Colors.green,
                  child: Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(10),),



                      // SizedBox(height: getProportionateScreenHeight(15),),

                      SizedBox(height: getProportionateScreenHeight(10),),

                      Container(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                           !store? Container(
                              alignment: Alignment.centerRight,
                              // color: Colors.yellow,
                              height: getProportionateScreenHeight(30),
                              width: getProportionateScreenWidth(390),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(onTap:(){
                        Get.to(StoreDetailsById(offer.storeId));

                        },child: AutoSizeText(offer.storeName,style: darkGrayText_18pt_underlined,)),

                                  SizedBox(width: getProportionateScreenWidth(25),),

                                  Container(child: AutoSizeText("اسم المتجر".i18n,style: body3_18pt,)),
                                ],
                              ),
                            ):Container(width: 0,height: 0,),
                            SizedBox(height: getProportionateScreenHeight(15),),
                            Row(
                              children: [
Spacer(),
                                Container(alignment:Alignment.centerRight,child: AutoSizeText("الوصف".i18n,style: body3_18pt,)),
                                SizedBox(width: getProportionateScreenWidth(5),),

                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(25),),
                      Container(
                        width: getProportionateScreenWidth(340),
                        // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(4)),
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(offer.desc,style: darkGrayText_16pt,),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
