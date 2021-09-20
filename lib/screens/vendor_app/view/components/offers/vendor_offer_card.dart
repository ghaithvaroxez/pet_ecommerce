import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/stores/view/components/offers/offers_details_screen.dart';
import 'package:pets/screens/vendor_app/model/constants.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import '../../../model/offer.dart';
import '../offers/vendor_offers_details_page.dart';
import 'translation/vendor_offer_card.i18n.dart';

class VendorOfferCard extends StatelessWidget {
  Offer offer;
  Function delete;
  Function edit;
  Function changeStatus;

  VendorOfferCard(
      {@required this.offer,
      @required this.delete,
      @required this.edit,
      this.changeStatus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(VendorOfferDetailsPage(offer));
      },
      child: Container(
          // margin: EdgeInsets.only(left: getProportionateScreenWidth(16),right:getProportionateScreenWidth(16),bottom: getProportionateScreenHeight(16)),
          width: getProportionateScreenWidth(353),
          height: getProportionateScreenHeight(140),
          margin:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(8)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.3, color: Colors.grey),
              color: backgroundGrey,
              boxShadow: shadow),
          child: Row(
            children: [
              Container(
                width: getProportionateScreenWidth(140),
                height: getProportionateScreenHeight(140),
                child: ClipRRect(
                  borderRadius: appLocal == "ar"
                      ? BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                  child: Stack(
                    children: [
                      Container(
                          color: Colors.white,
                          child: Image.asset(
                            "assets/images/home/custom_background.png",
                            fit: BoxFit.fill,
                          )),
                      Container(
                        child: CachedNetworkImage(
                          width: getProportionateScreenWidth(140),
                          height: getProportionateScreenHeight(140),
                          imageUrl: Api.imagePath + offer.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(8),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
                        height: getProportionateScreenHeight(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 5,
                                child: Container(
                                  height: getProportionateScreenHeight(20),
                                  child: AutoSizeText(
                                    offer.name,
                                    style: body1_16pt,
                                  ),
                                )),
                            // Expanded(flex:1,child: Container(height: getProportionateScreenHeight(20),child: AutoSizeText(offer.price.toString()+" \$",style: body2_14pt,maxLines: 1,),)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: getProportionateScreenHeight(75),
                              height: getProportionateScreenHeight(22),
                              child: AutoSizeText(
                                offer.category,
                                style: body1_16pt,
                              ),
                            ),
                            Spacer(),
                            Expanded(
                                child: Container(
                                    height: getProportionateScreenHeight(22),
                                    child: Row(
                                      children: [
                                        // Image.asset("assets/images/home/clock_icon.png"),
                                        // SizedBox(width: getProportionateScreenWidth(5),),
                                        AutoSizeText(
                                          offer.type,
                                          style: darkGrayText_11pt,
                                        ),
                                      ],
                                    ))),
                          ]),
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      Container(
                        alignment: appLocal == "ar"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        height: getProportionateScreenHeight(22),
                        width: getProportionateScreenWidth(320),
                        child: AutoSizeText(
                          offer.desc,
                          style: darkGrayText_11pt,
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            width: getProportionateScreenWidth(160),
                            height: getProportionateScreenHeight(39),
                            decoration: BoxDecoration(
                              borderRadius: appLocal == "ar"
                                  ? BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12))
                                  : BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    color: offer.visible != "visible"
                                        ? Colors.black.withOpacity(0.4)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)),
                                  ),
                                  child: GestureDetector(
                                      onTap: () {
                                        if (offer.visible == "visible")
                                          changeStatus();
                                        else {
                                          Get.rawSnackbar(
                                              backgroundColor:
                                                  Colors.green.withOpacity(0.8),
                                              message: "العرض غير منشور اساساً "
                                                  .i18n);
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Image.asset(
                                            "assets/images/vendor_app/unupload_icon.png"),
                                      )),
                                )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    color: offer.visible == "visible"
                                        ? Colors.black.withOpacity(0.4)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)),
                                  ),
                                  child: GestureDetector(
                                      onTap: () {
                                        if (offer.visible == "visible") {
                                          Get.rawSnackbar(
                                              backgroundColor:
                                                  Colors.green.withOpacity(0.8),
                                              message:
                                                  "العرض منشور اساساً".i18n);
                                        } else
                                          changeStatus();
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Image.asset(
                                              "assets/images/vendor_app/upload_icon.png"))),
                                )),
                                Expanded(
                                    child: GestureDetector(
                                        onTap: edit,
                                        child: Image.asset(
                                            "assets/images/vendor_app/pen.png"))),
                                Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: ((context) =>
                                                  AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                    title: Text(
                                                      'هل أنت متأكد ؟'.i18n,
                                                      // textDirection: TextDirection.rtl,
                                                      style: body3_18pt,
                                                    ),
                                                    content: Text(
                                                      'انت على وشك حذف هذا العرض !'
                                                          .i18n,
                                                      // textDirection: TextDirection.rtl,
                                                      style: body1_16pt,
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        child: Text(
                                                          'نعم'.i18n,
                                                        ),
                                                        onPressed: () async {
                                                          // language.changeLanguage();
                                                          Navigator.of(context)
                                                              .pop();
                                                          await delete();
                                                          // Navigator.popUntil(context, ModalRoute.withName('/'));
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text('لا'.i18n),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  )));
                                        },
                                        child: Image.asset(
                                            "assets/images/vendor_app/trash.png"))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
