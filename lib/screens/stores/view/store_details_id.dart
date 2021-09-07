import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';

import 'package:pets/screens/home/view/components/open_now_coponent.dart';
import 'package:pets/screens/stores/controller/customer_store_label_controller.dart';
import 'package:pets/screens/stores/model/all_stores.dart';
import 'package:pets/services/http_requests_service.dart';
import 'components/about/about_store_body.dart';
import 'components/orders/orders_body.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets/lib/screens/stores/view/components/products/products_body.dart';
import 'package:pets/screens/stores/view/components/offers/offers_body.dart';
import 'package:http/http.dart';
import '../model/custoer_store_offer.dart';
import 'package:http/http.dart' as http;
import '../view/components/products/p_bodyy.dart';
import '../view/components/photos/photos_body.dart';
import 'translations/store_details.i18n.dart';
class StoreDetailsById extends StatefulWidget {

int id;
  StoreDetailsById(this.id);
  @override
  _StoreDetailsByIdState createState() => _StoreDetailsByIdState();
}

class _StoreDetailsByIdState extends State<StoreDetailsById>   with SingleTickerProviderStateMixin{
  // Store storeModel;
  ///

  TabController _tabController;
  CustomerLabelController _customerLabelController =
  Get.put(CustomerLabelController());


  bool loading =false;
  bool error =false;

  var storeImage;
  var storeName;
  var storeDistrict;
  var storeOpenFrom;
  var storeCloseAt;


  fetchData()async
  {
    consolePrint("fetch data");
    loading=true;
    setState(() {

    });

    var url=Uri.parse("${Api.baseUrl}/store/${widget.id}");
    final h=await HttpService().getHeaders();
    final apiResult =await http.get(url,headers: h);
    if(apiResult.statusCode==200)
    {
      var d= json.decode(apiResult.body);
      storeName=d["store"]["name"];
      storeImage=d["store"]["image"];
      storeDistrict=d["store"]["district"];
      storeOpenFrom=d["store"]["open_from"];
      storeCloseAt=d["store"]["closed_at"];
      // consolePrint(d["store"]["store_products"].toString());
      // products= List<StoreProduct>.from(d["store"]["store_products"].map((x) => StoreProduct.fromJson(x)));
    }

    else
    {
      error=true;
    }

    loading=false;
    setState(() {

    });


  }
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      _customerLabelController.changeIndex(_tabController.index);
    });
    _tabController.animateTo(2);
    _customerLabelController.changeIndex(2);
  }


  @override
  Widget build(BuildContext context) {

    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child:loading?LoadingScreen():error?Container(height:getProportionateScreenHeight(500),width:getProportionateScreenWidth(370),child: Container(alignment:Alignment.center,child: AutoSizeText("حدثت مشكلة الرجاء المحاولة لاحقا",style: body3_18pt,)),)

    // loading?LoadingScreen():
        :Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(400),
                child: Container(
                  child:  storeImage!=null?Image.network(Api.imagePath+ storeImage,fit: BoxFit.cover,):
                  Image.asset(
                    "assets/images/home/shop_image.png",
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(400),
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
            Positioned(
              top: getProportionateScreenHeight(290),
              left: getProportionateScreenWidth(10),
              child: Container(
                width: getProportionateScreenWidth(102),
                height: getProportionateScreenHeight(40),
                padding: EdgeInsets.only(top: getProportionateScreenHeight(10),bottom: getProportionateScreenHeight(10),left: getProportionateScreenWidth(15),right:getProportionateScreenWidth(25) ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.brown,
                    Colors.brown.withOpacity(0.6),
                    // Colors.white,

                  ]),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                ),
                child: Center(
                  child: AutoSizeText(
                    "مفتوح الان".i18n,
                    minFontSize: 11,
                    style: blueButton_14pt,
                  ),
                ),
              ),
            ),
            Positioned(
              top: getProportionateScreenHeight(260),
              right: getProportionateScreenWidth(10),
              // width: getProportionateScreenWidth(190),
              height: getProportionateScreenHeight(80),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(200),
                      child: AutoSizeText(
                         storeName,
                        // textDirection: TextDirection.rtl,
                        style: blueButton_25pt,
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(20),
                      // width: getProportionateScreenWidth(200),
                      alignment: Alignment.centerRight,
                      // color: Colors.red,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Container(

                            // alignment: Alignment.centerRight,
                            height: getProportionateScreenHeight(20),
                            width: getProportionateScreenWidth(200),
                            child: AutoSizeText(
                               storeDistrict,
                              style: blueButton_14pt,
                              minFontSize: 10,
                              maxLines: 1,
                              // textDirection: TextDirection.rtl,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Image.asset(
                            "assets/images/home/location_icon.png",
                            height: getProportionateScreenHeight(12),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          height: getProportionateScreenHeight(20),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Row(
                              children: [
                                Container(

                                  height: getProportionateScreenHeight(20),
                                  // width: getProportionateScreenWidth(120),
                                  child: AutoSizeText(
                                    "${ storeOpenFrom} ",textDirection: TextDirection.ltr,
                                    style: blueButton_14pt,
                                    minFontSize: 10,
                                  ),
                                ),
                                Container(
                                  height: getProportionateScreenHeight(20),
                                  // width: getProportionateScreenWidth(120),
                                  child: AutoSizeText(
                                    "-",
                                    style: blueButton_14pt,
                                    minFontSize: 10,
                                  ),
                                ),
                                Container(
                                  height: getProportionateScreenHeight(20),
                                  // width: getProportionateScreenWidth(120),
                                  child: AutoSizeText(
                                    "${ storeCloseAt} ",textDirection: TextDirection.ltr ,
                                    style: blueButton_14pt,
                                    minFontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),

                        Image.asset(
                          "assets/images/home/clock_icon.png",
                          height: getProportionateScreenHeight(12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: getProportionateScreenHeight(350),
              left: 0,
              right: 0,
              child: Container(
                height: getProportionateScreenHeight(55),
                child: Row(
                  children: [
                    Expanded(
                      child: GetBuilder<CustomerLabelController>(
                        // init: _customerLabelController,
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            _tabController.animateTo(0);
                            controller.changeIndex(0);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(12)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12)),
                              color: controller.backgroundColors[0],
                            ),
                            child: Column(
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


                    Expanded(
                      child: GetBuilder<CustomerLabelController>(
                        // init: _customerLabelController,
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            _tabController.animateTo(1);
                            controller.changeIndex(1);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(12)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                // topLeft: Radius.circular(12)
                              ),
                              color: controller.backgroundColors[1],
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
                      child: GetBuilder<CustomerLabelController>(
                        // init: _customerLabelController,
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            _tabController.animateTo(2);
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
                      child: GetBuilder<CustomerLabelController>(
                        // init: _customerLabelController,
                        builder: (controller) => GestureDetector(
                          onTap: () {
                            _tabController.animateTo(3);
                            controller.changeIndex(3);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: getProportionateScreenHeight(12)),
                            decoration: BoxDecoration(
                              color: controller.backgroundColors[3],
                              borderRadius: BorderRadius.only(
                                  topRight:Radius.circular(12)
                              ),
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
                    //   child: GetBuilder<CustomerLabelController>(
                    //     // init: _customerLabelController,
                    //     builder: (controller) => GestureDetector(
                    //       onTap: () {
                    //         _tabController.animateTo(4);
                    //         controller.changeIndex(4);
                    //       },
                    //       child: Container(
                    //         padding: EdgeInsets.only(
                    //             top: getProportionateScreenHeight(12)),
                    //         // padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.only(
                    //               topRight: Radius.circular(12)),
                    //           color: controller.backgroundColors[4],
                    //         ),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //               height: getProportionateScreenHeight(18),
                    //               width: getProportionateScreenWidth(18),
                    //               child: Image.asset(
                    //                 controller.orders,
                    //                 fit: BoxFit.fill,
                    //               ),
                    //             ),
                    //             Container(
                    //               alignment: Alignment.center,
                    //               height: getProportionateScreenHeight(20),
                    //               width: getProportionateScreenWidth(80),
                    //               child: AutoSizeText(
                    //                 "ردود الطلبات",
                    //                 style: controller.ordersStyle,
                    //                 minFontSize: 8,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    ///orders
                  ],
                ),
              ),
            ),
            Positioned(
                top: getProportionateScreenHeight(405),
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      CustomerPhotosBody(   widget.id),
                      PBody(   widget.id),
                      AboutStoreBodyScreen(   widget.id),
                      OffersBodyScreen(   widget.id),
                      // OrdersBodyScreen(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
