import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';

import 'package:pets_ecommerce/screens/widgets/text_field.dart';
import 'package:get/get.dart';



class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( left: 24,right: 24,top: 16,bottom: 8),
      width: getProportionateScreenWidth(345),
      height: getProportionateScreenHeight(48),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), color: backgroundGrey),
      child: CustomTextField(
        hint: "ابحث هنا",
        prefixImage: "assets/images/home/search_icon.png",
      ),
    );
  }
}
// IconButton(
//     icon: Image.asset(
//       "assets/images/home/filter_icon.png",
//     ),
//     onPressed: () {
//       Get.bottomSheet(
//         CustomBottomSheet(),
//         barrierColor: Colors.grey.withOpacity(0.2),
//         backgroundColor: Colors.white,
//       );
//     }),