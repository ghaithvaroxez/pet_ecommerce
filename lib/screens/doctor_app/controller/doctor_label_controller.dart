import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';

import 'package:pets_ecommerce/screens/main_screen/model/main_screen_model.dart';

String servicesImg="assets/images/store/not active/products_icon.png";
String aboutStoreImg="assets/images/store/not active/about_store_icon.png";
String ordersImg="assets/images/store/not active/orders_icon.png";


String activeServicesImg="assets/images/store/active/active_products_icon.png";
String activeAboutStoreImg="assets/images/store/active/active_about_store_icon.png";
String activeOrdersImg="assets/images/store/active/active_orders_icon.png";


Color activeBackgroundColor=Colors.white;
class DoctorLabelController extends GetxController
{
  var index=0.obs;

  List<Color> backgroundColors=[
    activeBackgroundColor,
    storeLabelBackgroundGrey,
    storeLabelBackgroundGrey,
  ];


  TextStyle servicesStyle;
  TextStyle aboutStoreStyle;
  TextStyle ordersStyle;


  String services;
  String aboutStore;
  String offers;
  String orders;
  String photos;
  @override
  void onInit() {
    // TODO: implement onInit

    services=activeServicesImg;
    aboutStore=aboutStoreImg;
    orders=ordersImg;
    servicesStyle=activeTextStyle;
    aboutStoreStyle=notActiveTextStyle;
    ordersStyle=notActiveTextStyle;

    super.onInit();
  }
  void changeIndex(int i)
  {
    backgroundColors[index.value]=storeLabelBackgroundGrey;
    backgroundColors[i]=activeBackgroundColor;

    switch(index.value)
    {
      case 0:
        servicesStyle=notActiveTextStyle;
        services=servicesImg;
        break;
      case 1:
        aboutStoreStyle=notActiveTextStyle;
        aboutStore=aboutStoreImg;

        break;
      case 2:
        ordersStyle=notActiveTextStyle;
        orders=ordersImg;
        break;
    }

    switch(i)
    {
      case 0:
        servicesStyle=activeTextStyle;
        services=activeServicesImg;
        break;
      case 1:
        aboutStoreStyle=activeTextStyle;
        aboutStore=activeAboutStoreImg;
        break;
      case 2:
        ordersStyle=activeTextStyle;
        orders=activeOrdersImg;
        break;
    }

    index.value=i;

    update();
  }
}