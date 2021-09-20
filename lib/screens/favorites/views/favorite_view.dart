import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/doctors/controllers/customer_doctor_label_controller.dart';
import 'package:pets/screens/favorites/controllers/favorite_label_controller.dart';
import 'package:get/get.dart';
import 'package:pets/screens/favorites/views/components/products_body.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'components/doctors_body.dart';
import 'components/offers_body.dart';
import 'components/sieves_body.dart';
import 'components/stables_body.dart';
import 'components/stores_body.dart';
import 'translations/favorite_view.i18n.dart';
import 'package:pets/screens/notifications/view/notification_button.dart';

class FavoriteView extends StatefulWidget {
  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  FavoriteLabelController _favoriteLabelController =
      Get.put(FavoriteLabelController());

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      _favoriteLabelController.changeIndex(_tabController.index);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      drawer: CustomDrawer(
        home: false,
      ),
      body: Builder(
        builder: ((context) => SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: getProportionateScreenHeight(400),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Image.asset(
                          productsBackground,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(100),
                            ),
                            Image.asset(
                              storesBackground,
                              height: getProportionateScreenHeight(260),
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                        Image.asset(
                          doctorsBackground,
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          stablesBackground,
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          offersBackground,
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          offersBackground,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    // GetBuilder<FavoriteLabelController>(
                    //   // init: _customerLabelController,
                    //   builder: (controller) =>
                    //   Image.asset(
                    //     controller.background,
                    //     fit: BoxFit.fill,
                    //   ),
                  ),
                  // ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: getProportionateScreenHeight(400),
                    child: GetBuilder<FavoriteLabelController>(
                        // init: _customerLabelController,
                        builder: (controller) => Opacity(
                              opacity:
                                  controller.index != 1 && controller.index != 4
                                      ? 1
                                      : 0,
                              child: Image.asset(
                                "assets/images/favorite/black_layer.png",
                                fit: BoxFit.fill,
                              ),
                            )),
                  ),
                  // Container(
                  //
                  //   child: Image.asset(
                  //     "assets/images/favorite/black_layer.png",
                  //     fit: BoxFit.fill,
                  //   ),
                  // )),
                  Positioned(
                    top: getProportionateScreenHeight(30),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(95),
                      child: Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(24),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey.shade50,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GetBuilder<FavoriteLabelController>(
                            // init: _customerLabelController,
                            builder: (controller) => Container(
                              height: getProportionateScreenHeight(28),
                              width: getProportionateScreenWidth(75),
                              child: AutoSizeText(
                                "المفضلة".i18n,
                                style: controller.index != 1 &&
                                        controller.index != 4
                                    ? blueButton_25pt
                                    : teal_25pt,
                                minFontSize: 8,
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey.shade50,
                              child: Image.asset(
                                "assets/images/home/menu_icon.png",
                                height: 24,
                                width: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(24),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///title
                  Positioned(
                    top: getProportionateScreenHeight(350),
                    left: 0,
                    right: 0,
                    child: Container(
                      height: getProportionateScreenHeight(55),
                      child: Row(
                        children: [
                          Expanded(
                            child: GetBuilder<FavoriteLabelController>(
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
                                    borderRadius: appLocal == "ar"
                                        ? BorderRadius.only(
                                            topRight: Radius.circular(12))
                                        : BorderRadius.only(
                                            topLeft: Radius.circular(12)),
                                    color: controller.backgroundColors[0],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(18),
                                        width: getProportionateScreenWidth(18),
                                        child: Image.asset(
                                          controller.products,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            getProportionateScreenHeight(20),
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
                            child: GetBuilder<FavoriteLabelController>(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(18),
                                        width: getProportionateScreenWidth(18),
                                        child: Image.asset(
                                          controller.stores,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            getProportionateScreenHeight(20),
                                        width: getProportionateScreenWidth(80),
                                        child: AutoSizeText(
                                          "المتاجر".i18n,
                                          style: controller.storesStyle,
                                          minFontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// stores

                          Expanded(
                            child: GetBuilder<FavoriteLabelController>(
                              // init: _FavoriteLabelController,
                              builder: (controller) => GestureDetector(
                                onTap: () {
                                  _tabController.animateTo(2);
                                  controller.changeIndex(2);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenHeight(12)),
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                                    color: controller.backgroundColors[2],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(18),
                                        width: getProportionateScreenWidth(18),
                                        child: Image.asset(
                                          controller.doctors,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            getProportionateScreenHeight(20),
                                        width: getProportionateScreenWidth(80),
                                        child: AutoSizeText(
                                          "الأطباء".i18n,
                                          style: controller.doctorsStyle,
                                          minFontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ///doctors
                          Expanded(
                            child: GetBuilder<FavoriteLabelController>(
                              // init: _FavoriteLabelController,
                              builder: (controller) => GestureDetector(
                                onTap: () {
                                  _tabController.animateTo(3);
                                  controller.changeIndex(3);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenHeight(12)),
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                                    color: controller.backgroundColors[3],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(18),
                                        width: getProportionateScreenWidth(18),
                                        child: Image.asset(
                                          controller.stables,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            getProportionateScreenHeight(20),
                                        width: getProportionateScreenWidth(80),
                                        child: AutoSizeText(
                                          "الاسطبلات".i18n,
                                          style: controller.stablesStyle,
                                          minFontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ///stables
                          Expanded(
                            child: GetBuilder<FavoriteLabelController>(
                              // init: _FavoriteLabelController,
                              builder: (controller) => GestureDetector(
                                onTap: () {
                                  _tabController.animateTo(4);
                                  controller.changeIndex(4);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenHeight(12)),
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.only(
                                    //     topLeft: Radius.circular(12)),
                                    color: controller.backgroundColors[4],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(18),
                                        width: getProportionateScreenWidth(18),
                                        child: Image.asset(
                                          controller.sieves,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            getProportionateScreenHeight(20),
                                        width: getProportionateScreenWidth(80),
                                        child: AutoSizeText(
                                          "المناحل".i18n,
                                          style: controller.sievesStyle,
                                          minFontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ///sieves

                          Expanded(
                            child: GetBuilder<FavoriteLabelController>(
                              // init: _FavoriteLabelController,
                              builder: (controller) => GestureDetector(
                                onTap: () {
                                  _tabController.animateTo(5);
                                  controller.changeIndex(5);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenHeight(12)),
                                  decoration: BoxDecoration(
                                    borderRadius: appLocal == "ar"
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(12))
                                        : BorderRadius.only(
                                            topRight: Radius.circular(12)),
                                    color: controller.backgroundColors[5],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(18),
                                        width: getProportionateScreenWidth(18),
                                        child: Image.asset(
                                          controller.offers,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            getProportionateScreenHeight(20),
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
                        ],
                      ),
                    ),
                  ),

                  ///tabBar
                  Positioned(
                    top: getProportionateScreenHeight(405),
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          FavoriteProductsBody(),
                          FavoriteStoresBody(),
                          FavoriteDoctorsBody(),
                          FavoriteStablesBody(),
                          FavoriteSiviesBody(),
                          FavoriteOffersBody(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
