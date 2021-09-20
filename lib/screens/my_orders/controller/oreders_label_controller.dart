import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/screens/main_screen/model/main_screen_model.dart';

/*
* services
* personalInfo
* ordersResponse
*
* */
// String servicesImg="assets/images/doctors/not_active/services.png";
String personalInfoImg = "assets/images/doctors/not_active/personal_info.png";
String ordersResponseImg = "assets/images/doctors/not_active/orders.png";

// String activeServicesImg="assets/images/doctors/active/active_services.png";
String activePersonalInfoImg =
    "assets/images/doctors/active/active_personal_info.png";
String activeOrdersResponseImg =
    "assets/images/doctors/active/active_orders.png";

Color activeBackgroundColor = Colors.white;

class OrdersLabelController extends GetxController {
  var index = 0.obs;

  List<Color> backgroundColors = [
    activeBackgroundColor,
    storeLabelBackgroundGrey,
    // storeLabelBackgroundGrey,
  ];

  // TextStyle servicesStyle;

  TextStyle personalInfoStyle;
  TextStyle ordersResponseStyle;

  // String services;
  String personalInfo;
  String ordersResponse;

  @override
  void onInit() {
    // TODO: implement onInit

    // services=activeServicesImg;
    personalInfo = personalInfoImg;
    ordersResponse = ordersResponseImg;
    // servicesStyle=activeTextStyle;
    personalInfoStyle = notActiveTextStyle;
    ordersResponseStyle = notActiveTextStyle;
    changeIndex(0);
    super.onInit();
  }

  void changeIndex(int i) {
    backgroundColors[index.value] = storeLabelBackgroundGrey;
    backgroundColors[i] = activeBackgroundColor;

    switch (index.value) {
      // case 0:
      //   servicesStyle=notActiveTextStyle;
      //   services=servicesImg;
      //   break;
      case 1:
        personalInfoStyle = notActiveTextStyle;
        personalInfo = personalInfoImg;

        break;
      case 0:
        ordersResponseStyle = notActiveTextStyle;
        ordersResponse = ordersResponseImg;
        break;
    }

    switch (i) {
      // case 0:
      //   servicesStyle=activeTextStyle;
      //   services=activeServicesImg;
      //   break;
      case 1:
        personalInfoStyle = activeTextStyle;
        personalInfo = activePersonalInfoImg;
        break;
      case 0:
        ordersResponseStyle = activeTextStyle;
        ordersResponse = activeOrdersResponseImg;
        break;
    }

    index.value = i;

    update();
  }
}
