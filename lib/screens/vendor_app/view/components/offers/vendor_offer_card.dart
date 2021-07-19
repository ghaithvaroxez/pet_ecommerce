import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';

import 'package:pets_ecommerce/screens/vendor_app/model/constants.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import '../../../model/offer.dart';

class VendorOfferCard extends StatelessWidget {
  Offer offer;
  Function delete;
  Function edit;
  VendorOfferCard({@required this.offer,@required this.delete,@required this.edit});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: getProportionateScreenWidth(16),right:getProportionateScreenWidth(16),bottom: getProportionateScreenHeight(16)),
        width: getProportionateScreenWidth(353),
        height: getProportionateScreenHeight(140),
        margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(8)),
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
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Stack(
                  children: [
                    Container(color:Colors.white,child: Image.asset("assets/images/home/custom_background.png",fit: BoxFit.fill,)),
                    Container(child: CachedNetworkImage(
                      width: getProportionateScreenWidth(140),
                      height: getProportionateScreenHeight(140),
                      imageUrl: Api.imagePath+offer.image,fit: BoxFit.fill,
                    ),
                    ),
                  ],
                ),

              ),
            ),
            SizedBox(width: getProportionateScreenWidth(8),),
            Expanded(
              child: Container(

                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20),),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
                      height: getProportionateScreenHeight(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex:5,child: Container(height: getProportionateScreenHeight(20),child: AutoSizeText(offer.name,style: body1_16pt,),)),
                          // Expanded(flex:1,child: Container(height: getProportionateScreenHeight(20),child: AutoSizeText(offer.price.toString()+" \$",style: body2_14pt,maxLines: 1,),)),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Container(
                            width: getProportionateScreenHeight(75),height:getProportionateScreenHeight(20),child: AutoSizeText(offer.category,style: body1_16pt,),),
                          Spacer(),
                          Expanded(child: Container(height: getProportionateScreenHeight(20),child:Row(
                            children: [
                              // Image.asset("assets/images/home/clock_icon.png"),
                              // SizedBox(width: getProportionateScreenWidth(5),),
                              AutoSizeText(offer.type,style: darkGrayText_11pt,),
                            ],
                          ))),
                        ]
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Container(alignment: Alignment.centerRight,height: getProportionateScreenHeight(20),width:getProportionateScreenWidth(320),child: AutoSizeText(offer.desc,style: darkGrayText_11pt,),),
                    Row(
                      children: [
                        Spacer(
                        ),
                        Container(

                          width: getProportionateScreenWidth(160),
                          height: getProportionateScreenHeight(39),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomLeft: Radius.circular(12)  ),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child:   Image.asset("assets/images/vendor_app/unupload_icon.png"),
                              )),
                              Expanded(child: Padding(   padding: const EdgeInsets.all(7.0),child: Image.asset("assets/images/vendor_app/upload_icon.png"))),
                              Expanded(child: GestureDetector(  onTap:edit,child: Image.asset("assets/images/vendor_app/pen.png"))),
                              Expanded(child: GestureDetector(onTap:(){
                                showDialog(
                                    context: context,
                                    builder: ((context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      title:  Text(
                                        'هل أنت متأكد ؟',
                                        textDirection: TextDirection.rtl,
                                        style: body3_18pt,
                                      ),
                                      content: Text(
                                        'انت على وشك حذف هذا العرض !',
                                        textDirection: TextDirection.rtl,
                                        style: body1_16pt,
                                      ),
                                      actions: [
                                        TextButton(
                                          child:  Text(
                                            'نعم',
                                          ),
                                          onPressed: () async{
                                            // language.changeLanguage();
                                            Navigator.of(context).pop();
                                            await delete();
                                            // Navigator.popUntil(context, ModalRoute.withName('/'));
                                          },
                                        ),
                                        TextButton(
                                          child: Text('لا'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    )));
                              },child: Image.asset("assets/images/vendor_app/trash.png"))),
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
        )

    );
  }
}
