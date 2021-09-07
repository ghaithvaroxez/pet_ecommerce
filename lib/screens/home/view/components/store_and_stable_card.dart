import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';

import 'package:pets/screens/home/view/components/open_now_coponent.dart';
import 'package:pets/screens/home/view/components/social_media_components.dart';
import 'package:pets/screens/stores/model/all_stores.dart';
import 'package:pets/screens/stores/view/store_details.dart';

import 'favorite_icon.dart';
import 'package:get/get.dart';

class StoreAndStableCard extends StatefulWidget {
  Store store;
  Function fav;
  StoreAndStableCard(this.store,this.fav);

  @override
  _StoreAndStableCardState createState() => _StoreAndStableCardState();
}

class _StoreAndStableCardState extends State<StoreAndStableCard> {
  String fb,wa,ins;
  bool bfb=true,bwa=true,bins=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i =0; i<widget.store.storeContacts.length;i++)
    {
      if( widget.store.storeContacts[i].type=="facebook"&&bfb==true)
      {
        fb= widget.store.storeContacts[i].link;
        bfb=false;
      }
      else if( widget.store.storeContacts[i].type=="phone"&&bwa==true)
      {
        wa= widget.store.storeContacts[i].link;
        bwa=false;
      }
      else if ( widget.store.storeContacts[i].type=="instagram"&&bins==true)
      {
        ins= widget.store.storeContacts[i].link;
        bins=false;
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
        margin: EdgeInsets.symmetric(horizontal: 6),
        width: getProportionateScreenWidth(192),
        // height: getProportionateScreenHeight(150),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3, color: borderColor),
            color: Colors.white,
        ),
        child: Stack(
          children: [
            Positioned(
                top: getProportionateScreenHeight(120),
                height: getProportionateScreenHeight(100),
                width: getProportionateScreenWidth(191.8),

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    color: Colors.grey.shade200,
                  ),
                  child: Container(
                      // alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenHeight(15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Container(
                                height: getProportionateScreenHeight(25),
                                child: AutoSizeText(
                                  widget.store.name,
                                  // minFontSize: 8,
                                  style: body1_16pt,
                                ),
                              ),
                              // SizedBox(
                              //   height: getProportionateScreenHeight(10),
                              // ),
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
                                      widget.store.district,
                                      // minFontSize: 8,
                                      style: darkGrayText_13pt,
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: getProportionateScreenHeight(5),
                              // ),
                              // Container(
                              //   height: getProportionateScreenHeight(25),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       // Icon(Icons.location_on_rounded,color: Colors.grey,size: 16,),
                              //       Image.asset(
                              //         "assets/images/home/location_icon.png",
                              //         height: getProportionateScreenHeight(12),
                              //         width: getProportionateScreenWidth(12),
                              //       ),
                              //       SizedBox(
                              //         width: getProportionateScreenWidth(10),
                              //       ),
                              //       Container(
                              //         height: 10,
                              //         child: AutoSizeText(
                              //           "53 كم",
                              //           // minFontSize: 8,
                              //           style: darkGrayText_11pt,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
                            ],
                          ),
                        ],
                      )),
                )),///grey footer
            Positioned(
              bottom: getProportionateScreenHeight(4),
              left: getProportionateScreenWidth(4),
              child:SocialMedia(wa: wa,fb: fb,ins: ins,),
            ),///social media
            Positioned(
                // left: 15,
                bottom: getProportionateScreenHeight(90),
                child: Container(
                  height: getProportionateScreenHeight(129),
                  width: getProportionateScreenWidth(192),
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    child: widget.store.image==""||widget.store.image==null?Image.asset(
                      "assets/images/home/shop_image.png",
                      fit: BoxFit.fill,
                    ):Image.network(
                      Api.imagePath+widget.store.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),///photo
            // Positioned(
            //     bottom: getProportionateScreenHeight(70),
            //     left: getProportionateScreenWidth(20),
            //     child: CircleAvatar(
            //       backgroundColor: Colors.white,
            //       child: Container(
            //         child: Center(
            //           child: Text(
            //             "Logo",
            //             style: body2_14pt,
            //           ),
            //         ),
            //       ),
            //     )),///logo circle
            Positioned(
              bottom: getProportionateScreenHeight(90),
              // width: getProportionateScreenWidth(73),
              height: 27,
              child: OpenNow(rightBottom: false,),
            ),///opens now
            // Positioned(
            //   right: getProportionateScreenWidth(10),
            //   top: getProportionateScreenHeight(8),
            //   child: Container(
            //     height: getProportionateScreenHeight(14),
            //     width: getProportionateScreenWidth(15),
            //     child: IconButton(
            //       icon: Icon(
            //         Icons.share_outlined,
            //         size: 15,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),///share icon
            Positioned(
                left: 25,
                top: 8,
                child: FavoriteIcon(s:widget.store.favStatus ,fav: widget.fav,)),
          ],
        ),
      ),
    );
  }
}
