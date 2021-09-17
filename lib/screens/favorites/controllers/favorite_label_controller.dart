import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/constants/colors.dart';

import 'package:pets/screens/main_screen/model/main_screen_model.dart';


/*
products
stores
doctors
stables
offers

 */

String productsImg="assets/images/favorite/notActive/products_icon.png";
String storesImg="assets/images/favorite/notActive/store_icon.png";
String doctorsImg="assets/images/favorite/notActive/doctor_icon.png";
String stablesImg="assets/images/favorite/notActive/stable_icon.png";
String offersImg="assets/images/favorite/notActive/offers_icon.png";
String sievesImg="assets/images/favorite/notActive/sive_not_active.png";

String activeProductsImg="assets/images/favorite/active/active_products_icon.png";
String activeStoresImg="assets/images/favorite/active/active_store_icon.png";
String activeDoctorsImg="assets/images/favorite/active/active_doctor_icon.png";
String activeStablesImg="assets/images/favorite/active/active_stable_icon.png";
String activeOffersImg="assets/images/favorite/active/active_offers_icon.png";
String activeSievesImg="assets/images/favorite/active/sieve_active.png";

Color activeBackgroundColor=Colors.white;

String productsBackground="assets/images/favorite/offers_image.png";
String storesBackground="assets/images/favorite/stores_image.png";
String doctorsBackground="assets/images/favorite/offers_image.png";
String stablesBackground="assets/images/favorite/stable_image.png";
String offersBackground="assets/images/favorite/offers_image.png";
String sievesBackground="assets/images/favorite/products_image.png";


class FavoriteLabelController extends GetxController
{
  var index=0.obs;

  List<Color> backgroundColors=[
    activeBackgroundColor,
    storeLabelBackgroundGrey,
    storeLabelBackgroundGrey,
    storeLabelBackgroundGrey,
    storeLabelBackgroundGrey,
    storeLabelBackgroundGrey,
  ];


  TextStyle productsStyle;

  TextStyle storesStyle;
  TextStyle doctorsStyle;
  TextStyle stablesStyle;
  TextStyle offersStyle;
  TextStyle sievesStyle;

  String products;
  String stores;
  String doctors;
  String stables;
  String offers;
  String sieves;

  String background;
  @override
  void onInit() {
    // TODO: implement onInit

    products=activeProductsImg;
    stores=storesImg;
    doctors=doctorsImg;
    stables=stablesImg;
    offers=offersImg;
    sieves=sievesImg;

    background=productsBackground;

    productsStyle=activeTextStyle;
    storesStyle=notActiveTextStyle;
    doctorsStyle=notActiveTextStyle;
    offersStyle=notActiveTextStyle;
    stablesStyle=notActiveTextStyle;
    sievesStyle=notActiveTextStyle;
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
        products=productsImg;
        break;
      case 1:
        storesStyle=notActiveTextStyle;
        stores=storesImg;

        break;

      case 2:
        doctorsStyle=notActiveTextStyle;
        doctors=doctorsImg;
        break;

        case 3:
        stablesStyle=notActiveTextStyle;
        stables=stablesImg;
        break;

        case 4:
          sievesStyle=notActiveTextStyle;
          sieves=sievesImg;
        break;

        case 5:
        offersStyle=notActiveTextStyle;
        offers=offersImg;
        break;
    }

    switch(i)
    {
      case 0:
        productsStyle=activeTextStyle;
        products=activeProductsImg;
        background=productsBackground;
        break;
      case 1:
        storesStyle=activeTextStyle;
        stores=activeStoresImg;
        background=storesBackground;
        break;
      case 2:
        doctorsStyle=activeTextStyle;
        doctors=activeDoctorsImg;
        background=doctorsBackground;
        break;
        case 3:
        stablesStyle=activeTextStyle;
        stables=activeStablesImg;
        background=stablesBackground;
        break;

        case 4:
          sievesStyle=activeTextStyle;
          sieves=activeSievesImg;
        background=sievesBackground;
        break;

        case 5:
        offersStyle=activeTextStyle;
        offers=activeOffersImg;
        background=offersBackground;
        break;
    }

    index.value=i;

    update();
  }
}