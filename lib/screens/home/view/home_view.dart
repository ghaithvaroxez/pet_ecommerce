import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/categories/view/categories_screen.dart';
import 'package:pets/screens/categories/view/catgory_stores.dart';
// import 'package:pets/screens/home/controller/home_controller.dart';
// import 'package:pets/screens/home/controller/home_controller.dart';
// import 'package:pets/screens/home/controller/home_controller.dart';
import 'package:pets/screens/home/model/constants.dart';
import 'package:pets/screens/home/model/home_model.dart';
import 'package:pets/screens/home/view/components/all_offers_screen.dart';
import 'package:pets/screens/home/view/components/all_products_screen.dart';
import 'package:pets/screens/home/view/components/category_item.dart';
import 'package:pets/screens/home/view/components/category_selected_item.dart';
import 'package:pets/screens/home/view/components/doctor_card.dart';
import 'package:pets/screens/home/view/components/offer_card.dart';
import 'package:pets/screens/home/view/components/product_card.dart';
import 'package:pets/screens/home/view/components/selected_product_card.dart';
import 'package:pets/screens/main_screen/model/main_screen_model.dart';
import 'package:pets/screens/status/controller/status_controller.dart';
import 'package:pets/screens/status/model/status_model.dart';
import 'package:pets/screens/widgets/custom_app_bar.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:video_thumbnail_generator/video_thumbnail_generator.dart';
import 'components/search_bar_component.dart';
import 'components/status_view.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets/lib/screens/widgets/navigation_bar/custom_navigation_bar.dart';
import 'package:pets/screens/widgets/text_field.dart';

import 'components/stable_news_card.dart';
import 'components/store_and_stable_card.dart';
// import '../controller/home_controller.dart';
import 'package:http/http.dart' as http;
import '../controller/home_controller.dart';

import '../../stores/view/select_barn.dart';
import '../../stores/view/select_sieve.dart';
import 'translations/home_view.i18n.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
StatusController statusController=Get.put(StatusController());
HomeController  homeController=Get.put(HomeController());

Future<bool> addStoreToFavorite(int storeId) async {
  try{
    consolePrint("store id" + storeId.toString());
    var url = Uri.parse(
        "${Api.baseUrl}/addToFavourite/$storeId/store/Store");
    consolePrint("before add to favorite print");
    final h = await HttpService().getHeaders();
    final apiResult = await http.post(url, headers: h);
    consolePrint("after add to favorite print");

    if (apiResult.statusCode == 200) {
      consolePrint("statusCode==200");
      var j = jsonDecode(apiResult.body);
      if (j["favourites"] != null) {
        consolePrint("fav != null");
        return true;
      } else {
        consolePrint("fav = null");
        return false;
      }
    } else {
      consolePrint("statusCode!=200");
      return false;
    }
  }catch(e){
    consolePrint(e.toString());
    return false;
  }
}


Future<bool> addBarnToFavorite(int storeId) async {
  try{
    consolePrint("store id" + storeId.toString());
    var url = Uri.parse(
        "${Api.baseUrl}/addToFavourite/$storeId/store/barn");
    consolePrint("before add to favorite print");
    final h = await HttpService().getHeaders();
    final apiResult = await http.post(url, headers: h);
    consolePrint("after add to favorite print");

    if (apiResult.statusCode == 200) {
      consolePrint("statusCode==200");
      var j = jsonDecode(apiResult.body);
      if (j["favourites"] != null) {
        consolePrint("fav != null");
        return true;
      } else {
        consolePrint("fav = null");
        return false;
      }
    } else {
      consolePrint("statusCode!=200");
      return false;
    }
  }catch(e){
    consolePrint(e.toString());
    return false;
  }
}


Future<bool> addSieveToFavorite(int storeId) async {
  try{
    consolePrint("store id" + storeId.toString());
    var url = Uri.parse(
        "${Api.baseUrl}/addToFavourite/$storeId/store/sieve");
    consolePrint("before add to favorite print");
    final h = await HttpService().getHeaders();
    final apiResult = await http.post(url, headers: h);
    consolePrint("after add to favorite print");

    if (apiResult.statusCode == 200) {
      consolePrint("statusCode==200");
      var j = jsonDecode(apiResult.body);
      if (j["favourites"] != null) {
        consolePrint("fav != null");
        return true;
      } else {
        consolePrint("fav = null");
        return false;
      }
    } else {
      consolePrint("statusCode!=200");
      return false;
    }
  }catch(e){
    consolePrint(e.toString());
    return false;
  }
}


Future<bool> addProductToFavorite(int productId) async {
  try {
    consolePrint("product id" + productId.toString());
    var url = Uri.parse(
        "${Api.baseUrl}/addToFavourite/$productId/product");
    consolePrint("before add to favorite print");
    consolePrint("try to post on " + url.path);

    final h = await HttpService().getHeaders();
    final apiResult = await http.post(url, headers: h);
    consolePrint("after add to favorite print");

    if (apiResult.statusCode == 200) {
      consolePrint("statusCode==200");
      var j = jsonDecode(apiResult.body);
      if (j["favourites"] != null) {
        consolePrint("fav != null");
        return true;
      } else {
        consolePrint("fav = null");
        return false;
      }
    } else {
      consolePrint("statusCode!=200");
      return false;
    }
  }catch(e){
    consolePrint(e.toString());
    return false;
  }
}


Future<bool> addOfferToFavorite(int offerId) async {
  try {
    consolePrint("product id" + offerId.toString());
    var url = Uri.parse(
        "${Api.baseUrl}/addToFavourite/$offerId/offer");
    consolePrint("before add to favorite print");
    consolePrint("try to post on " + url.path);

    final h = await HttpService().getHeaders();
    var apiResult;
    try {
      apiResult = await http.post(url, headers: h);
    } catch (e) {
      consolePrint(e.toString());
      return false;
    }
    consolePrint("after add to favorite print");

    if (apiResult.statusCode == 200) {
      consolePrint("statusCode==200");
      var j = jsonDecode(apiResult.body);
      if (j["favourites"] != null) {
        consolePrint("fav != null");
        return true;
      } else {
        consolePrint("fav = null");
        return false;
      }
    } else {
      consolePrint("statusCode!=200");
      return false;
    }
  }catch(e){
    consolePrint(e.toString());
    return false;
  }
}

Future<bool> addDoctorToFavorite(int doctorId) async {
  consolePrint("store id"+doctorId.toString());
  var url=Uri.parse("${Api.baseUrl}/addToFavourite/$doctorId/doctor");
  consolePrint("before add to favorite print");
  final h=await HttpService().getHeaders();
  final apiResult=await http.post(url,headers: h);
  consolePrint("after add to favorite print");

  if(apiResult.statusCode==200)
  {
    consolePrint("statusCode==200");
    var j=jsonDecode(apiResult.body);
    if(j["favourites"]!=null) {
      consolePrint("fav != null");
      return true;
    } else {
      consolePrint("fav = null");
      return false;
    }
  }
  else {
    consolePrint("statusCode!=200");
    return false ;
  }
}
class _HomeScreenState extends State<HomeScreen> {


  // HomeModel homeModel;
  //
  // bool loading =true;
  // bool error=false;

  // fetchData()async
  // {
  //   consolePrint("fetch data");
  //   loading=true;
  //   setState(() {
  //
  //   });
  //
  //   var url=Uri.parse("${Api.baseUrl}/home");
  //   final h=await HttpService().getHeaders();
  //   final apiResult =await http.get(url,headers: h);
  //   if(apiResult.statusCode==200)
  //   {
  //  homeModel=homeModelFromJson(apiResult.body);
  //   }
  //   else
  //   {
  //     error=true;
  //   }
  //
  //   loading=false;
  //   setState(() {
  //
  //   });
  //
  //
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getHome();
    // fetchData();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child:GetBuilder<HomeController>(
        init: homeController,
     builder:(controller)=> controller.loading?LoadingScreen():controller.error?Container(height:getProportionateScreenHeight(500),width:getProportionateScreenWidth(370),child: Container(alignment:Alignment.center,child: AutoSizeText("الرجاء المحاولة مجدداً".i18n,style: body3_18pt,)),):

     RefreshIndicator(
       onRefresh: ()async{
         await controller.getHome();
       },
       child: ListView(
            children: [

              SearchBar(),
SizedBox(height: getProportionateScreenHeight(8),),
              Container(
                height: getProportionateScreenHeight(25),
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(25),
                    ),
                    Text(
                      "الأصناف".i18n,
                      style: body3_18pt,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        Get.to(CategoriesScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                        child: Text(
                          "عرض المزيد".i18n,
                          style: body2_14pt,
                        ),
                      ),
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
              ///searchbar
              Container(
                height: getProportionateScreenHeight(55),
                width: SizeConfig.screenWidth,
                child: controller.homeModel.categories.length==0?Center(child: AutoSizeText("لا يوجد أصناف لعرضها حالياً".i18n,style: body1_16pt,),):ListView.builder(
                    itemCount: controller.homeModel.categories.length,
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

                            child:
                            // index == 0
                            //     ?
                            GestureDetector(
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(builder: ((context)=>CategoryStores(controller.homeModel.categories[index].id,controller.homeModel.categories[index].name))));

                      },
                                  child: CategorySelectedItem(
                              name: controller.homeModel.categories[index].name,
                              image: controller.homeModel.categories[index].image,
                            ),
                                )
                              //   : GestureDetector(
                              // onTap:(){
                              //   Navigator.of(context).push(MaterialPageRoute(builder: ((context)=>CategoryStores(controller.homeModel.categories[index].id,controller.homeModel.categories[index].name))));
                              // },
                              //     child: CategoryItem(
                              //       name: controller.homeModel.categories[index].name,
                              // image: controller.homeModel.categories[index].image,
                              //     ),
                              //   ),
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
                    ),
                child: Swiper(
                  autoplay: true,
                  autoplayDelay: 5000,
                  autoplayDisableOnInteraction: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(2)),
                      child: ClipRRect(borderRadius:BorderRadius.circular(12),child: Image.network(Api.imagePath+controller.homeModel.slides[index].image,fit: BoxFit.fill,)),
                    );
                  },
                  itemCount: controller.homeModel.slides.length,
                  // pagination: new SwiperPagination(),
                  duration: 3000,
                  // control: new SwiperControl(color: Colors.grey),
                ),
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
                          "السلع".i18n,
                          style: body3_18pt,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Get.to(AllProductsScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                            child: Text(
                              "عرض المزيد".i18n,
                              style: body2_14pt,
                            ),
                          ),
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
                        child: controller.homeModel.products.length==0?Center(child: AutoSizeText("لا يوجد منتجات لعرضها حالياً".i18n,style: body1_16pt,),):ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.homeModel.products.length,
                            itemBuilder: (context, index) =>
                                 HomeStoreProductCard(controller.homeModel.products[index],()async{
                                   bool k=
                                   await addProductToFavorite(controller.homeModel.products[index].id);
setState(() {
  if(k) controller.homeModel.products[index].favStatus=(!controller.homeModel.products[index].favStatus);});

                                   return k;
                                 })
                                )),
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
                // margin: EdgeInsets.symmetric(vertical: 15),
                child:
                controller.homeModel.status.length != 0
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
                                Get.to(StatusView(controller.homeModel.status,index));},
                            child: _buildSwiperList(controller.homeModel.status[index],index
                               ),
                          );
                        },
                        itemCount: controller.homeModel.status.length,
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
    ): Center(child: AutoSizeText("لا يوجد حالات لعرضها حالياً".i18n,style: body1_16pt,),)
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
                            "المتاجر".i18n,
                            style: body3_18pt,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              bottomTabController.animateTo(3, curve: Curves.bounceIn);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3)),
                              child: Text(
                                "عرض المزيد".i18n,
                                style: body2_14pt,
                              ),
                            ),
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
                      child:controller.homeModel.stores.length==0?Center(child: AutoSizeText("لا يوجد متاجر لعرضها حالياً".i18n,style: body1_16pt,),): ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.homeModel.stores.length,
                        itemBuilder: (context, index) =>
                            StoreAndStableCard(controller.homeModel.stores[index],()async{
                              bool k=
                              await addStoreToFavorite(controller.homeModel.stores[index].id);
                              setState(() {

                                if(k) controller.homeModel.stores[index].favStatus=(!controller.homeModel.stores[index].favStatus);
                              });

                              return k;
                            }),
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
                            "الأطباء البيطريين".i18n,
                            style: body3_18pt,
                          ),
                          Spacer(),
                      GestureDetector(
                        onTap: (){
                          bottomTabController.animateTo(1, curve: Curves.bounceIn);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3)),
                            child: Text(
                              "عرض المزيد".i18n,
                              style: body2_14pt,
                            ),
                          ),
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
                        child: controller.homeModel.doctors.length==0?Center(child: AutoSizeText("لا يوجد أطباء لعرضها حالياً".i18n,style: body1_16pt,),):ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.homeModel.doctors.length,
                            itemBuilder: (context, index) =>
                                DoctorCard(controller.homeModel.doctors[index],()async{
                                  bool k=
                                  await addDoctorToFavorite(controller.homeModel.doctors[index].id);
                                  setState(() {

                                    if(k) controller.homeModel.doctors[index].favStatus=(!controller.homeModel.doctors[index].favStatus);
                                  });
                                  return k;
                                }))),
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
                            "العروض".i18n,
                            style: body3_18pt,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Get.to(AllOffersScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                              child: Text(
                                "عرض المزيد".i18n,
                                style: body2_14pt,
                              ),
                            ),
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
                      child: controller.homeModel.offers.length==0?Center(child: AutoSizeText( "لا يوجد عروض حالياً".i18n,style: body1_16pt,),):ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.homeModel.offers.length,
                        itemBuilder: (context, index) => OfferCard(controller.homeModel.offers[index],()async{
                          bool k=
                          await addOfferToFavorite(controller.homeModel.offers[index].id);
                          setState(() {

                            if(k) controller.homeModel.offers[index].favStatus=(!controller.homeModel.offers[index].favStatus);
                          });
                          return k;
                        }),
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
                            "الاسطبلات".i18n,
                            style: body3_18pt,
                          ),
                          Spacer(),
  GestureDetector(
    onTap: (){
        Get.to(SelectBarnView());
    },
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                              child: Text(
                                "عرض المزيد".i18n,
                                style: body2_14pt,
                              ),
                            ),
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
                      child: controller.homeModel.barns.length==0?Center(child: AutoSizeText("لا يوجد أسطبلات لعرضها حالياً".i18n,style: body1_16pt,),):ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.homeModel.barns.length,
                        itemBuilder: (context, index) =>
                            StoreAndStableCard( controller.homeModel.barns[index],()async{
                              bool k=
                              await addBarnToFavorite(controller.homeModel.barns[index].id);
                              setState(() {

                                if(k) controller.homeModel.barns[index].favStatus=(!controller.homeModel.barns[index].favStatus);
                              });
                              return k;
                            }),
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
                            "المناحل".i18n,
                            style: body3_18pt,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Get.to(SelectSieveView());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                              child: Text(
                                "عرض المزيد".i18n,
                                style: body2_14pt,
                              ),
                            ),
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
                      child: controller.homeModel.sieves.length==0?Center(child: AutoSizeText("لا يوجد مناحل لعرضها حالياً".i18n,style: body1_16pt,),):ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.homeModel.sieves.length,
                        itemBuilder: (context, index) =>
                            StoreAndStableCard(controller.homeModel.sieves[index],()async{
                              bool k=
                              await addSieveToFavorite(controller.homeModel.sieves[index].id);
                              setState(() {

                                if(k) controller.homeModel.sieves[index].favStatus=(!controller.homeModel.sieves[index].favStatus);
                              });
                              return k;
                            }),
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
     ),
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