import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';

import 'package:pets_ecommerce/screens/main_screen/model/main_screen_model.dart';

String productsImg="assets/images/store/not active/products_icon.png";
String aboutStoreImg="assets/images/store/not active/about_store_icon.png";
String offersImg="assets/images/store/not active/offers_icon.png";
String ordersImg="assets/images/store/not active/orders_icon.png";

String activeProductsImg="assets/images/store/active/active_products_icon.png";
String activeAboutStoreImg="assets/images/store/active/active_about_store_icon.png";
String activeOffersImg="assets/images/store/active/active_offers_icon.png";
String activeOrdersImg="assets/images/store/active/active_orders_icon.png";

Color activeBackgroundColor=Colors.white;
class CustomerLabelController extends GetxController
{
  var index=0.obs;

  List<Color> backgroundColors=[
activeBackgroundColor,
storeLabelBackgroundGrey,
storeLabelBackgroundGrey,
storeLabelBackgroundGrey,
  ];


  TextStyle productsStyle;
  TextStyle aboutStoreStyle;
  TextStyle offersStyle;
  TextStyle ordersStyle;

  String product;
  String aboutStore;
  String offers;
  String orders;
  @override
  void onInit() {
    // TODO: implement onInit

    product=activeProductsImg;
    aboutStore=aboutStoreImg;
    offers=offersImg;
    orders=ordersImg;
    productsStyle=activeTextStyle;
    aboutStoreStyle=notActiveTextStyle;
    offersStyle=notActiveTextStyle;
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
      productsStyle=notActiveTextStyle;
      product=productsImg;
      break;
    case 1:
      aboutStoreStyle=notActiveTextStyle;
      aboutStore=aboutStoreImg;

      break;
    case 2:
      offersStyle=notActiveTextStyle;
      offers=offersImg;
      break;
    case 3:
      ordersStyle=notActiveTextStyle;
      orders=ordersImg;
      break;
  }

  switch(i)
  {
    case 0:
      productsStyle=activeTextStyle;
      product=activeProductsImg;
      break;
    case 1:
      aboutStoreStyle=activeTextStyle;
      aboutStore=activeAboutStoreImg;
      break;
    case 2:
      offersStyle=activeTextStyle;
      offers=activeOffersImg;
      break;
    case 3:
      ordersStyle=activeTextStyle;
      orders=activeOrdersImg;
      break;
  }

  index.value=i;

  update();
}
}