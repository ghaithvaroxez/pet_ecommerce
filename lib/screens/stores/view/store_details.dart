import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/view/components/open_now_coponent.dart';
import 'package:pets_ecommerce/screens/stores/controller/customer_store_label_controller.dart';
import 'components/about/about_store_body.dart';
import 'components/orders/orders_body.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/stores/view/components/products/products_body.dart';
import 'package:pets_ecommerce/screens/stores/view/components/offers/offers_body.dart';

class StoreDetailsPage extends StatefulWidget {
  @override
  _StoreDetailsPageState createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  CustomerLabelController _customerLabelController =
      Get.put(CustomerLabelController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      _customerLabelController.changeIndex(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(400),
                child: Container(
                  child: Image.asset(
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
                    "مفتوح الان",
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

                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(200),
                      child: AutoSizeText(
                        "Pets carnival",
                        textDirection: TextDirection.rtl,
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
                              "فلسطين رام الله ",
                              style: blueButton_14pt,
                              minFontSize: 10,
                              maxLines: 1,
                              textDirection: TextDirection.rtl,
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
                          width: getProportionateScreenWidth(200),
                          child: AutoSizeText(
                            "من 9 صباحا  لغاية 9 مساء",
                            style: blueButton_14pt,
                            minFontSize: 10,
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
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
                                    controller.product,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(80),
                                  child: AutoSizeText(
                                    "المنتجات",
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
                            _tabController.animateTo(1);
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
                                    "عن المتجر",
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
                                    controller.offers,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(80),
                                  child: AutoSizeText(
                                    "العروض",
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
                            // padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
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
                                    controller.orders,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: getProportionateScreenHeight(20),
                                  width: getProportionateScreenWidth(80),
                                  child: AutoSizeText(
                                    "ردود الطلبات",
                                    style: controller.ordersStyle,
                                    minFontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

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
                      ProductsBodyScreen(),
                      AboutStoreBodyScreen(),
                      OffersBodyScreen(),
                      OrdersBodyScreen(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
