import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/doctors/view/doctor_details.dart';
import 'package:pets/screens/home/view/components/favorite_icon.dart';
import 'package:pets/screens/home/view/components/open_now_coponent.dart';
import 'package:pets/screens/home/view/components/social_media_components.dart';
import 'package:get/get.dart';
import 'package:pets/screens/stores/view/store_details.dart';
import '../../../../main.dart';
import '../../model/all_stores.dart';

class VerticalStoreListCard extends StatefulWidget {
  Store store;
  Function addToFav;

  VerticalStoreListCard({this.store, this.addToFav});

  @override
  _VerticalStoreListCardState createState() => _VerticalStoreListCardState();
}

class _VerticalStoreListCardState extends State<VerticalStoreListCard> {
  String fb, wa, ins;
  bool bfb = true, bwa = true, bins = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < widget.store.storeContacts.length; i++) {
      if (widget.store.storeContacts[i].type == "facebook" && bfb == true) {
        fb = widget.store.storeContacts[i].link;
        bfb = false;
      } else if (widget.store.storeContacts[i].type == "phone" && bwa == true) {
        wa = widget.store.storeContacts[i].link;
        bwa = false;
      } else if (widget.store.storeContacts[i].type == "instagram" &&
          bins == true) {
        ins = widget.store.storeContacts[i].link;
        bins = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(StoreDetailsPage(widget.store));
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
            if (appLocal == "ar")
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
                    child:
                        widget.store.image == "" || widget.store.image == null
                            ? Container(
                                height: getProportionateScreenHeight(134),
                                width: getProportionateScreenWidth(154),
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  "Pets",
                                  style: BlueText_16pt_bold,
                                ))
                            : CachedNetworkImage(
                                imageUrl: Api.imagePath + widget.store.image,
                                placeholder: (context, s) => Container(
                                    width: getProportionateScreenWidth(75),
                                    height: getProportionateScreenHeight(75),
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, s, x) => Container(
                                    height: getProportionateScreenHeight(134),
                                    width: getProportionateScreenWidth(154),
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "Pets",
                                      style: BlueText_16pt_bold,
                                    )),
                                fit: BoxFit.fill,
                              ),
                  ),
                ),
              )
            else
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  height: getProportionateScreenHeight(134),
                  width: getProportionateScreenWidth(154),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    // color: Colors.red
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    child:
                        widget.store.image == "" || widget.store.image == null
                            ? Container(
                                height: getProportionateScreenHeight(134),
                                width: getProportionateScreenWidth(154),
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  "Pets",
                                  style: BlueText_16pt_bold,
                                ))
                            : CachedNetworkImage(
                                imageUrl: Api.imagePath + widget.store.image,
                                placeholder: (context, s) => Container(
                                    width: getProportionateScreenWidth(75),
                                    height: getProportionateScreenHeight(75),
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, s, x) => Container(
                                    height: getProportionateScreenHeight(134),
                                    width: getProportionateScreenWidth(154),
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "Pets",
                                      style: BlueText_16pt_bold,
                                    )),
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
            appLocal == "ar"
                ? Positioned(
                    right: getProportionateScreenWidth(171),
                    top: getProportionateScreenHeight(20),
                    bottom: getProportionateScreenHeight(35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: getProportionateScreenHeight(30),
                              width: getProportionateScreenWidth(115),
                              child: AutoSizeText(
                                widget.store.name,
                                style: body3_18pt,
                                maxLines: 1,
                                minFontSize: 9,
                              ),
                            ),
                          ],
                        ),

                        // store.openFrom!=null&&store.closedAt!=null ?
                        // Row(
                        //   children: [
                        //     Image.asset(
                        //       "assets/images/home/clock_icon.png",
                        //       height: getProportionateScreenHeight(12),
                        //     ),
                        //     SizedBox(
                        //       width: getProportionateScreenWidth(10),
                        //     ),
                        //     Container(
                        //       width: getProportionateScreenWidth(120),
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //             height: getProportionateScreenHeight(20),
                        //             // width: getProportionateScreenWidth(120),
                        //             child: AutoSizeText(
                        //               "${widget.store.openFrom} ",textDirection: TextDirection.ltr,
                        //               style: body3_18pt,
                        //               minFontSize: 10,
                        //             ),
                        //           ),
                        //           Container(
                        //             height: getProportionateScreenHeight(20),
                        //             // width: getProportionateScreenWidth(120),
                        //             child: AutoSizeText(
                        //               "-",
                        //               style: body3_18pt,
                        //               minFontSize: 10,
                        //             ),
                        //           ),
                        //           Container(
                        //             height: getProportionateScreenHeight(20),
                        //             // width: getProportionateScreenWidth(120),
                        //             child: AutoSizeText(
                        //               "${widget.store.closedAt} ",textDirection: TextDirection.ltr ,
                        //               style: body3_18pt,
                        //               minFontSize: 10,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                                widget.store.district,
                                style: body3_18pt,
                                minFontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        // :Container(),
                      ],
                    ),
                  )
                : Positioned(
                    left: getProportionateScreenWidth(171),
                    top: getProportionateScreenHeight(20),
                    bottom: getProportionateScreenHeight(35),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: getProportionateScreenHeight(30),
                              width: getProportionateScreenWidth(115),
                              child: AutoSizeText(
                                widget.store.name,
                                style: body3_18pt,
                                maxLines: 1,
                                minFontSize: 9,
                              ),
                            ),
                          ],
                        ),

                        // store.openFrom!=null&&store.closedAt!=null ?
                        // Row(
                        //   children: [
                        //     Image.asset(
                        //       "assets/images/home/clock_icon.png",
                        //       height: getProportionateScreenHeight(12),
                        //     ),
                        //     SizedBox(
                        //       width: getProportionateScreenWidth(10),
                        //     ),
                        //     Container(
                        //       width: getProportionateScreenWidth(120),
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //             height: getProportionateScreenHeight(20),
                        //             // width: getProportionateScreenWidth(120),
                        //             child: AutoSizeText(
                        //               "${widget.store.openFrom} ",textDirection: TextDirection.ltr,
                        //               style: body3_18pt,
                        //               minFontSize: 10,
                        //             ),
                        //           ),
                        //           Container(
                        //             height: getProportionateScreenHeight(20),
                        //             // width: getProportionateScreenWidth(120),
                        //             child: AutoSizeText(
                        //               "-",
                        //               style: body3_18pt,
                        //               minFontSize: 10,
                        //             ),
                        //           ),
                        //           Container(
                        //             height: getProportionateScreenHeight(20),
                        //             // width: getProportionateScreenWidth(120),
                        //             child: AutoSizeText(
                        //               "${widget.store.closedAt} ",textDirection: TextDirection.ltr ,
                        //               style: body3_18pt,
                        //               minFontSize: 10,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // :Container(),
                        SizedBox(
                          height: getProportionateScreenHeight(15),
                        ),
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
                                widget.store.district,
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

            appLocal == "ar"
                ? Positioned(
                    left: getProportionateScreenWidth(4),
                    bottom: getProportionateScreenHeight(4),
                    child: SocialMedia(
                      wa: wa,
                      fb: fb,
                      ins: ins,
                    ),
                  )
                : Positioned(
                    right: getProportionateScreenWidth(4),
                    bottom: getProportionateScreenHeight(4),
                    child: SocialMedia(
                      wa: wa,
                      fb: fb,
                      ins: ins,
                    ),
                  ),

            ///social media
            appLocal == "ar"
                ? Positioned(
                    // width: getProportionateScreenWidth(15),
                    // height: getProportionateScreenHeight(15),
                    left: getProportionateScreenWidth(15),
                    top: getProportionateScreenHeight(15),
                    child: FavoriteIcon(
                      fav: widget.addToFav,
                      s: widget.store.favStatus,
                    ),
                  )
                : Positioned(
                    // width: getProportionateScreenWidth(15),
                    // height: getProportionateScreenHeight(15),
                    right: getProportionateScreenWidth(15),
                    top: getProportionateScreenHeight(15),
                    child: FavoriteIcon(
                      fav: widget.addToFav,
                      s: widget.store.favStatus,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
