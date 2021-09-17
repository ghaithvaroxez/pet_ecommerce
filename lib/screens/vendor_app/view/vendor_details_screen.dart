import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/vendor_app/controller/info_controller.dart';
import 'package:pets/screens/vendor_app/controller/offers_controller.dart';
import 'package:pets/screens/vendor_app/controller/products_controller.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/types.dart';
import 'package:pets/screens/vendor_app/requests/products_requests.dart';
import 'package:pets/screens/vendor_app/view/components/offers/add_new_offer_screen.dart';
import 'package:pets/screens/vendor_app/view/components/products/vendor_products_body.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/vendor_app/controller/vendor_label_controller.dart';
import 'package:pets/screens/vendor_app/model/constants.dart';
import 'package:pets/screens/widgets/floating_action_button.dart';

import 'components/about/about_store_body.dart';
import 'components/offers/vendor_offers_body.dart';
import 'components/orders/orders_body.dart';
import 'components/photos/photos_body.dart';
import 'components/products/add_new_product_screen.dart';

import 'vendor_details_page.i18n.dart';
class VendorDetailsPage extends StatefulWidget {
  @override
  _VendorDetailsPageState createState() => _VendorDetailsPageState();
}


class _VendorDetailsPageState extends State<VendorDetailsPage>
    with SingleTickerProviderStateMixin {
  VendorInfoController customVendorInfoController =
  Get.put(VendorInfoController());

  bool isloading=false;
  VendorAppProductsReq _vendorAppProductsReq=VendorAppProductsReq();
  VendorOffersController vendorOffersController =Get.put(VendorOffersController());
  VendorProductsController vendorProductsController=Get.put(VendorProductsController());
  VendorLabelController vendorAppLabelController =
  Get.put(VendorLabelController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vendorAppTabController = TabController(length: 4, vsync: this);
    vendorAppTabController.addListener(() {
      vendorAppLabelController.changeIndex(vendorAppTabController.index);
    });

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      floatingActionButton: FancyFab(onPressed1:    (){

        vendorAppTabController.animateTo(0);
        vendorAppLabelController.changeIndex(0);
        Get.to(VendorAppAddProduct(vendorProductsController));
      },
        onPressed2:  (){
          vendorAppTabController.animateTo(2);
          vendorAppLabelController.changeIndex(2);
          Get.to(VendorAppAddOffer(vendorOffersController));
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(300),
                child: Container(
                  child:  GetBuilder<VendorInfoController>(
                    init: customVendorInfoController,
                    builder: (controller)=>controller.init==false? Image.asset(
                      "assets/images/home/shop_image.png",
                      fit: BoxFit.fill,
                    ):controller.storeInfo.store.image==null?Image.asset(
                      "assets/images/home/shop_image.png",
                      fit: BoxFit.fill,
                    ):CachedNetworkImage(
                      imageUrl: Api.imagePath+controller.storeInfo.store.image,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Container(alignment:Alignment.center,height:getProportionateScreenHeight(75),width:getProportionateScreenWidth(75),child: CircularProgressIndicator(value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/home/shop_image.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ),
                ),


            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(300),
                child: Container(
                  child: Image.asset(
                    "assets/images/store/black_layer.png",
                    fit: BoxFit.fill,
                  ),
                ),
            ),


            // Positioned(
            //   top: getProportionateScreenHeight(34),
            //   left: getProportionateScreenWidth(24),
            //   child: GestureDetector(
            //     onTap: (){
            //       Navigator.pop(context);
            //     },
            //     child: Container(
            //       width: getProportionateScreenWidth(48),
            //       height: getProportionateScreenHeight(48),
            //       decoration: BoxDecoration(
            //           color: Colors.white.withOpacity(0.8),
            //           shape: BoxShape.circle),
            //       child: Center(
            //         child: Icon(
            //           Icons.arrow_back_ios_outlined,
            //           size: 14,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: getProportionateScreenHeight(180),
            //   right: getProportionateScreenWidth(10),
            //   child: Stack(
            //     children: [
            //
            //       Image.asset("assets/images/vendor_app/camera.png",    width: getProportionateScreenWidth(52),
            //         height: getProportionateScreenHeight(52),fit: BoxFit.fill,),
            //
            //     ],
            //   ),
            // ),///camera

            Positioned(
              top: getProportionateScreenHeight(250),
              left: 0,
              right: 0,
              child: Container(
                height: getProportionateScreenHeight(55),
                child: Row(

                  children: [
                    Expanded(
                      child: GetBuilder<VendorLabelController>(
                        init:  vendorAppLabelController,
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            vendorAppTabController.animateTo(0);
                            controller.changeIndex(0);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(12)),
                            decoration: BoxDecoration(
                              borderRadius:appLocal=="ar"? BorderRadius.only(
                                  topRight: Radius.circular(12)):BorderRadius.only(
                                  topLeft: Radius.circular(12)),
                              color: controller.backgroundColors[0],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(18),
                                  width: getProportionateScreenWidth(18),
                                  child: Image.asset(
                                    controller.product,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(80),
                                  child: AutoSizeText(
                                    "المنتجات".i18n,
                                    style: controller.productsStyle,
                                    minFontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///products

                    Expanded(
                      child: GetBuilder<VendorLabelController>(
                        init:  vendorAppLabelController,
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            vendorAppTabController.animateTo(1);
                            controller.changeIndex(1);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(12)),
                            decoration: BoxDecoration(
                              color: controller.backgroundColors[1],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(18),
                                  width: getProportionateScreenWidth(18),
                                  child: Image.asset(
                                    controller.aboutStore,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(80),
                                  child: AutoSizeText(
                                    "عن المتجر".i18n,
                                    style: controller.aboutStoreStyle,
                                    minFontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///about store

                    Expanded(
                      child: GetBuilder<VendorLabelController>(
                        init:  vendorAppLabelController,
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            vendorAppTabController.animateTo(2);
                            controller.changeIndex(2);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(12)),
                            decoration: BoxDecoration(
                              color: controller.backgroundColors[2],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(18),
                                  width: getProportionateScreenWidth(18),
                                  child: Image.asset(
                                    controller.offers,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(80),
                                  child: AutoSizeText(
                                    "العروض".i18n,
                                    style: controller.offersStyle,
                                    minFontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///offers
                // Expanded(
                //         child: GetBuilder<VendorLabelController>(
                //           init:  vendorAppLabelController,
                //           builder: (controller) => GestureDetector(
                //             onTap: () {
                //               vendorAppTabController.animateTo(3);
                //               controller.changeIndex(3);
                //             },
                //             child: Container(
                //               padding: EdgeInsets.only(
                //                   top: getProportionateScreenHeight(12)),
                //               decoration: BoxDecoration(
                //                 color: controller.backgroundColors[3],
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Container(
                //                     height: getProportionateScreenHeight(18),
                //                     width: getProportionateScreenWidth(18),
                //                     child: Image.asset(
                //                       controller.orders,
                //                       fit: BoxFit.fill,
                //                     ),
                //                   ),
                //                   Container(
                //                     alignment: Alignment.center,
                //                     height: getProportionateScreenHeight(20),
                //                     width: getProportionateScreenWidth(80),
                //                     child: AutoSizeText(
                //                       "ردود الطلبات",
                //                       style: controller.ordersStyle,
                //                       minFontSize: 8,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),

                    ///orders

                    Expanded(
                      child: GetBuilder<VendorLabelController>(
                        init:  vendorAppLabelController,
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            // vendorAppTabController.animateTo(4);
                            // controller.changeIndex(4);
                            vendorAppTabController.animateTo(3);
                            controller.changeIndex(3);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(12)),
                            // padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
                            decoration: BoxDecoration(
                              borderRadius: appLocal=="ar"?BorderRadius.only(
                                  topLeft: Radius.circular(12)):BorderRadius.only(
                                  topRight: Radius.circular(12)),
                              color: controller.backgroundColors[3],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(18),
                                  width: getProportionateScreenWidth(18),
                                  child: Image.asset(
                                    controller.photos,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(80),
                                  child: AutoSizeText(
                                    "الصور".i18n,
                                    style: controller.photosStyle,
                                    minFontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///photos
                  ],
                ),
              ),
            ),
            Positioned(
                top: getProportionateScreenHeight(305),
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: TabBarView(
                    controller: vendorAppTabController,
                    children: [
                      // ProductsBodyScreen(),
                      // AboutStoreBodyScreen(),
                      // OffersBodyScreen(),
                      // OrdersBodyScreen(),
                      VendorProductsBodyScreen(vendorProductsController),
                      AboutStoreBodyScreen(customVendorInfoController),
                      VendorOffersBodyScreen(vendorOffersController),
                      // OrdersBodyScreen(),
                      VendorPhotosBody(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
