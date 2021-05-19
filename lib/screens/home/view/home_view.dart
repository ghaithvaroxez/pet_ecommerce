import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/model/constants.dart';
import 'package:pets_ecommerce/screens/home/view/components/category_item.dart';
import 'package:pets_ecommerce/screens/home/view/components/category_selected_item.dart';
import 'package:pets_ecommerce/screens/home/view/components/doctor_card.dart';
import 'package:pets_ecommerce/screens/home/view/components/offer_card.dart';
import 'package:pets_ecommerce/screens/home/view/components/product_card.dart';
import 'package:pets_ecommerce/screens/home/view/components/selected_product_card.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';
import 'package:shape_of_view/shape_of_view.dart';

import 'components/stable_news_card.dart';
import 'components/store_and_stable_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Stack(
            children: [
            Opacity(
            opacity: 0.8,
            child: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        "assets/images/home/custom_background.png"),
                  )),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Material(
              elevation: 5,
              color: Colors.white,
              child: Container(
                  width: SizeConfig.screenWidth,
                  height: getProportionateScreenHeight(95),
                  child: Row(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(24),
                      ),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey.shade50,
                        child: Image.asset(
                          "assets/images/home/notification_icon.png",
                          height: 24,
                          width: 20,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey.shade50,
                        child: Image.asset(
                          "assets/images/home/menu_icon.png",
                          height: 24,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(24),
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(
            top: 95,
            height: getProportionateScreenHeight(754),
            width: SizeConfig.screenWidth,
            child: ListView(
                children: [
            Container(
            margin: EdgeInsets.symmetric(
            vertical: 16, horizontal: 24),
            width: getProportionateScreenWidth(345),
            height: getProportionateScreenHeight(48),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: backgroundGrey),
            child: CustomTextField(
              hint: "ابحث هنا",
              prefixImage: "assets/images/home/search_icon.png",
              suffixImage: "assets/images/home/filter_icon.png",
            ),
          ),

          ///searchbar

          Container(
            height: getProportionateScreenHeight(55),
            width: SizeConfig.screenWidth,
            child: ListView.builder(
                itemCount: names.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        width: index == 0
                            ? getProportionateScreenWidth(119)
                            : getProportionateScreenWidth(109),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(0.0, .5), //(x,y)
                                blurRadius: 8.0,
                              ),
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: index == 0 ? 0 : 5),
                        // height: index==0?getProportionateScreenHeight(55):getProportionateScreenHeight(45),
                        width: index == 0
                            ? getProportionateScreenWidth(119)
                            : getProportionateScreenWidth(109),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(28),
                          color: index == 0
                              ? Color(0xFFE4F2F6)
                              : Colors.white70,
                          // border: Border.all(width: index==0?0.2:0)
                        ),

                        child: index == 0
                            ? CategorySelectedItem(
                          index: 0,
                        )
                            : CategoryItem(index),
                      ),
                    ],
                  );
                }),
          ),

          ///list_view_horizantal

          Container(
            margin: EdgeInsets.symmetric(
              vertical: 25,
            ),
            height: getProportionateScreenHeight(200),
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image:
                  AssetImage("assets/images/home/kids.png"),
                )),
          ),

          ///kids_photo

          Container(
            alignment: Alignment.bottomLeft,
            height: getProportionateScreenHeight(210),
            width: getProportionateScreenWidth(370),
            // color: Colors.red,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "السلع",
                      style: body3_18pt,
                    ),
                    Spacer(),
                    Text(
                      "عرض المزيد",
                      style: body2_14pt,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productsImages.length,
                        itemBuilder: (context, index) =>
                        index == 0
                            ? SelectedProductCard()
                            : ProductCard())),

              ],
            ),
          ),

          ///product_listView
          Stack(
              children: [
          Container(margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          width: getProportionateScreenWidth(345),
          height: getProportionateScreenHeight(233),
          decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(5),),
          child: Image.asset(
            "assets/images/home/hours.png", fit: BoxFit.fill,),),
        Container(margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          width: getProportionateScreenWidth(345),
          height: getProportionateScreenHeight(233),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),),),
        Container(margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            width: getProportionateScreenWidth(345),
            height: getProportionateScreenHeight(233),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
            child
            :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.play_arrow_solid,size: 50,color: Colors.white,),
              Text("خيل عربي اصيل ",style: whiteText_18pt,),
              ],
            )),


      ],
    ),///video player

                  Container(
                    alignment: Alignment.bottomLeft,
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(370),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "المتاجر",
                              style: body3_18pt,
                            ),
                            Spacer(),
                            Text(
                              "عرض المزيد",
                              style: body2_14pt,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 215,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productsImages.length,
                                itemBuilder: (context, index) =>
                                StoreAndStableCard())),

                      ],
                    ),
                  ),///shops
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(370),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "الأطباء البيطريين",
                              style: body3_18pt,
                            ),
                            Spacer(),
                            Text(
                              "عرض المزيد",
                              style: body2_14pt,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 210,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productsImages.length,
                                itemBuilder: (context, index) =>
                               DoctorCard())),

                      ],
                    ),
                  ),///doctors
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(370),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "العروض",
                              style: body3_18pt,
                            ),
                            Spacer(),
                            Text(
                              "عرض المزيد",
                              style: body2_14pt,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 215,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productsImages.length,
                                itemBuilder: (context, index) =>
                               OfferCard(),),),

                      ],
                    ),
                  ),///offers
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(370),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "الاسطبلات",
                              style: body3_18pt,
                            ),
                            Spacer(),
                            Text(
                              "عرض المزيد",
                              style: body2_14pt,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 215,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productsImages.length,
                                itemBuilder: (context, index) =>
                                StoreAndStableCard())),

                      ],
                    ),
                  ),///stables
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(370),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "اخبار الاسطبلات",
                              style: body3_18pt,
                            ),
                            Spacer(),
                            Text(
                              "عرض المزيد",
                              style: body2_14pt,
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 215,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productsImages.length,
                                itemBuilder: (context, index) =>
                               StableNewsCard(),)),
                      ],
                    ),
                  ),///stables_news
                  SizedBox(height: 100,),
    ],
    ),
    ),
    ],
    ),
    ),
    )
    );
  }
}
