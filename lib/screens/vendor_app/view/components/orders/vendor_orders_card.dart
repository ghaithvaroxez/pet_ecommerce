import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';


class VendorOrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(345),
      height: getProportionateScreenHeight(160),
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: offWhite,
      ),
      child: Column(
        children: [
          Container(
            height: getProportionateScreenHeight(120),

            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        // bottomRight: Radius.circular(12),
                      ),
                      color: offBlue,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),

                        ),
                        child: Image.asset(
                          "assets/images/home/cat_2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),


                Expanded(
                  flex: 5,
                  child: Container(

                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(16),),
                        Column(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(30),
                              width: getProportionateScreenWidth(200),
                              child: AutoSizeText("قطة لونها رمادي فروها ناعم",textDirection:TextDirection.rtl,minFontSize: 8,style: body1_16pt,),
                            ),
                            // SizedBox(height: getProportionateScreenHeight(2),),
                            Container(
                              height: getProportionateScreenHeight(15),
                              width: getProportionateScreenWidth(200),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                             Expanded(
                                    child: Row(
                                      children: [
                                        Container(alignment:Alignment.centerRight,height: getProportionateScreenHeight(15),child: Image.asset("assets/images/store/cat_icon.png"),),
                                        SizedBox(width: getProportionateScreenWidth(5),),
                                        Expanded(flex:1,child: Container(alignment:Alignment.centerRight,height: getProportionateScreenHeight(15),child: AutoSizeText("قطط",style: darkGrayText_11pt,minFontSize: 5,textDirection: TextDirection.rtl,),)),

                                      ],
                                    ),
                                  ),

                                  Expanded(
                                    child:  Row(
                                      children: [
                                        Container(alignment:Alignment.centerRight,height: getProportionateScreenHeight(15),child: Image.asset("assets/images/home/clock_icon.png"),),
                                        SizedBox(width: getProportionateScreenWidth(5),),
                                        Expanded(flex:1,child: Container(alignment:Alignment.centerRight,height: getProportionateScreenHeight(15),child: AutoSizeText("منذ 3 ساعات",maxLines:1,style: darkGrayText_11pt,minFontSize: 5,textDirection: TextDirection.rtl),)),

                                      ],
                                    ),
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10),),
                            Container(
                              height: getProportionateScreenHeight(32),
                              width: getProportionateScreenWidth(200),
child: AutoSizeText("السلام عليكم لدي قطة لونها رمادي من سلالة أصيلة للمزيد تواصل معي",minFontSize: 8,style: darkGrayText_13pt,textDirection: TextDirection.rtl),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),


                ///blue container
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(12) ,bottomRight: Radius.circular(12))
            ),
            height: getProportionateScreenHeight(40),
            child: Row(children: [
              SizedBox(width: getProportionateScreenWidth(5),),
              AutoSizeText("اكتب رداً ......",style: darkGrayText_13pt,)
            ,Spacer(),
Container(
  height: getProportionateScreenHeight(30),
  child: Image.asset("assets/images/vendor_app/send_icon.png"),
)
            ],
            ),
          )
        ],
      ),
    );
  }
}
