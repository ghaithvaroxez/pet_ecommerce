import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
// import 'package:pets_ecommerce/screens/home/controller/home_controller.dart';
// import 'package:pets_ecommerce/screens/home/controller/home_controller.dart';
// import 'package:pets_ecommerce/screens/home/controller/home_controller.dart';
import 'package:pets_ecommerce/screens/home/model/constants.dart';
import 'package:pets_ecommerce/screens/home/view/components/category_item.dart';
import 'package:pets_ecommerce/screens/home/view/components/category_selected_item.dart';
import 'package:pets_ecommerce/screens/home/view/components/doctor_card.dart';
import 'package:pets_ecommerce/screens/home/view/components/offer_card.dart';
import 'package:pets_ecommerce/screens/home/view/components/product_card.dart';
import 'package:pets_ecommerce/screens/home/view/components/selected_product_card.dart';
import 'package:pets_ecommerce/screens/status/controller/status_controller.dart';
import 'package:pets_ecommerce/screens/status/model/status_model.dart';
import 'package:pets_ecommerce/screens/widgets/custom_app_bar.dart';
import 'package:video_thumbnail_generator/video_thumbnail_generator.dart';
import 'components/search_bar_component.dart';
import 'components/status_view.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/widgets/navigation_bar/custom_navigation_bar.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';

import 'components/stable_news_card.dart';
import 'components/store_and_stable_card.dart';
// import '../controller/home_controller.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
StatusController statusController=Get.put(StatusController());
class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child:ListView(
        children: [

          SearchBar(),

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
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(0.0, .5), //(x,y)
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10),
                            vertical: index == 0 ? 0 : getProportionateScreenHeight(5)),
                        // height: index==0?getProportionateScreenHeight(55):getProportionateScreenHeight(45),
                        width: index == 0
                            ? getProportionateScreenWidth(119)
                            : getProportionateScreenWidth(109),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
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
                  image: AssetImage("assets/images/home/kids.png"),
                )),
          ),

          ///kids_photo

          Container(
            // alignment: Alignment.bottomLeft,
            height: getProportionateScreenHeight(250),
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
                    height: getProportionateScreenHeight(150),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productsImages.length,
                        itemBuilder: (context, index) => index == 0
                            ? SelectedProductCard()
                            : SelectedProductCard())),
              ],
            ),
          ),
// SizedBox(height: 45,),
          ///product_listView

          //                   width: getProportionateScreenWidth(345),
          //                   height: getProportionateScreenHeight(233),
          //                   decoration: BoxDecoration(
          //                     color: Colors.grey,
          //                     borderRadius: BorderRadius.circular(5),
          //                   ),
SizedBox(height: getProportionateScreenHeight(20),),
          Container(
            width: getProportionateScreenWidth(345),
      height: getProportionateScreenHeight(233),
            child: GetBuilder<StatusController>(
              init: statusController,
              builder:(controller)=> controller.loading?Container(width:getProportionateScreenWidth(35),height:getProportionateScreenHeight(35),child: CircularProgressIndicator()):Container(
                // margin: EdgeInsets.symmetric(vertical: 15),
                child:
                controller.status.length != 0
                    ?Center(
                child: Container(
                                    width: getProportionateScreenWidth(345),
                                    height: getProportionateScreenHeight(233),
                alignment: Alignment.center,
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: 0, vertical: getProportionateScreenHeight(10)),
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                child:
              Container(
                  width: getProportionateScreenWidth(345),
                height: getProportionateScreenHeight(233),

                child: Swiper(
                        autoplay: true,
                        autoplayDelay: 5000,
                        autoplayDisableOnInteraction: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: (){
                                consolePrint(index.toString());
                                Get.to(StatusView(controller.status,index));},
                            child: _buildSwiperList(controller.status[index],index
                               ),
                          );
                        },
                        itemCount: controller.status.length,
                        // pagination: new SwiperPagination(),
                        duration: 3000,
                        // control: new SwiperControl(color: Colors.grey),
                      ),
                    )
                    ,


//               Swiper(
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(onTap: (){Get.to(StatusView(controller.status,index));},child: _buildSwiperList(controller.status[index],index));
//                 },
// page
//                 itemWidth: getProportionateScreenWidth(345),
//                 itemHeight: getProportionateScreenHeight(233),
//                 itemCount: controller.status.length,
//                 duration: 3000,
//
//                 layout: SwiperLayout.CUSTOM,
//                 autoplay: true,
//
//                 pagination: SwiperPagination(),
//                 customLayoutOption:
//                 new CustomLayoutOption(startIndex: -1, stateCount: 3)
//                     .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
//                   new Offset(-340.0, -40.0),
//                   new Offset(0.0, 0.0),
//                   new Offset(340.0, -40.0)
//                 ]),
//                 // control:SwiperControl(),
//               ),
              ),
    ): Container()
              ),
            ),
          ),

          ///video player
SizedBox(height: getProportionateScreenHeight(25),),
          Container(
            alignment: Alignment.bottomLeft,
            height: getProportionateScreenHeight(275),
            width: getProportionateScreenWidth(370),
            // color: Colors.red,
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(25),
                  child: Row(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(25),
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
                        width: getProportionateScreenWidth(10),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: getProportionateScreenHeight(220),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsImages.length,
                    itemBuilder: (context, index) =>
                        StoreAndStableCard(),
                  ),
                ),
              ],
            ),
          ),

          ///shops
          // SizedBox(
          //   height: getProportionateScreenHeight(20),
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            alignment: Alignment.bottomLeft,
            height: getProportionateScreenHeight(275),
            width: getProportionateScreenWidth(370),
            // color: Colors.red,
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(25),
                  child: Row(
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
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                    height: getProportionateScreenHeight(230),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productsImages.length,
                        itemBuilder: (context, index) =>
                            DoctorCard())),
              ],
            ),
          ),

          ///doctors
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(25)),
            alignment: Alignment.bottomLeft,
            height: getProportionateScreenHeight(275),
            width: getProportionateScreenWidth(370),
            // color: Colors.red,
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(25),
                  child: Row(
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
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),

                Container(
                  height: getProportionateScreenHeight(225),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsImages.length,
                    itemBuilder: (context, index) => OfferCard(),
                  ),
                ),
              ],
            ),
          ),

          ///offers
          // SizedBox(
          //   height: 50,
          // ),
          Container(
            alignment: Alignment.bottomLeft,
            height: getProportionateScreenHeight(275),
            width: getProportionateScreenWidth(370),
            margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
            // color: Colors.red,
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(25),
                  child: Row(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(25),
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
                        width: getProportionateScreenWidth(10),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: getProportionateScreenHeight(220),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsImages.length,
                    itemBuilder: (context, index) =>
                        StoreAndStableCard(),
                  ),
                ),
              ],
            ),
          ),

          ///stables
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            alignment: Alignment.bottomLeft,
            height: getProportionateScreenHeight(275),
            width: getProportionateScreenWidth(370),
            margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),

            // color: Colors.red,
            child: Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(25),
                  child: Row(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(25),
                      ),
                      Text(
                        "المناحل",
                        style: body3_18pt,
                      ),
                      Spacer(),
                      Text(
                        "عرض المزيد",
                        style: body2_14pt,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: getProportionateScreenHeight(220),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsImages.length,
                    itemBuilder: (context, index) =>
                        StoreAndStableCard(),
                  ),
                ),
              ],
            ),
          ),

          ///stables
          SizedBox(
            height: getProportionateScreenHeight(100),
          ),
        ],
      ),
    );
  }
}
// Widget _buildSwiperList(StatusAll item, int index) {
//   return Container(
//     margin: EdgeInsets.only(left: 15, right: 15),
//     child: ClipRRect(
//       borderRadius: BorderRadius.all(Radius.circular(8)),
//       child: item.type=="image"?Image.network(
//         Api.imagePath+item.image,
//         fit: BoxFit.fill,
//       ):ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: ThumbnailImage(
//           videoUrl:
//           Api.imagePath+item.image,
//           height: getProportionateScreenHeight(160),
//           width: getProportionateScreenWidth(220),
//           fit: BoxFit.fill,
//         ),
//       ),
//     ),
//   );
// }

Widget _buildSwiperList(StatusAll item, int index) {
  return
    Container(
      width: getProportionateScreenWidth(345),
      height: getProportionateScreenHeight(233),
      margin: EdgeInsets.only(left: getProportionateScreenWidth(5), right: getProportionateScreenWidth(5)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: item.type=="image"?CachedNetworkImage(
          placeholder: (context,s)=>Container(alignment: Alignment.center,height:getProportionateScreenHeight(25),width:getProportionateScreenWidth(25),child: Text(
            "loading...",
            style: TextStyle(
                color: Color(0xFF2EA5C3).withOpacity(0.6), fontSize: 22),
          ),),
         imageUrl: Api.imagePath+item.image,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => Center(
            child: Text(
              "Pets",
              style: TextStyle(
                  color: Color(0xFF2EA5C3).withOpacity(0.6), fontSize: 22),
            ),
          ),
        ):ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ThumbnailImage(
            videoUrl:
            Api.imagePath+item.image,
            height: getProportionateScreenHeight(160),
            width: getProportionateScreenWidth(220),
            fit: BoxFit.fill,
            errorBuilder:(context, url, error) => Center(
              child: Text(
                "Pets",
                style: TextStyle(
                    color: Color(0xFF2EA5C3).withOpacity(0.6), fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );


  //   Container(
  //   // height: height,
  //   //margin: EdgeInsets.only(top: 2),
  //   child: CachedNetworkImage(
  //     /// fit: comany_list?BoxFit.cover:BoxFit.fill,
  //     fit: comany_list?BoxFit.fill:BoxFit.fill,
  //     imageUrl: "http://vindorlist.sourcecode-ai.com/storage/$image",
  //     // placeholder: (context, url) => Center(child: Lottie.asset('assets/anm1.json'),),
  //     errorWidget: (context, url, error) => Center(
  //       child: Text(
  //         "Logo",
  //         style: TextStyle(
  //             color: Color(0xFF2EA5C3).withOpacity(0.6), fontSize: 22),
  //       ),
  //     ),
  //   ),
  // );
}