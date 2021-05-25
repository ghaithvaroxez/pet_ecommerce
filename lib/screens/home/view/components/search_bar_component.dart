import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';


class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      width: getProportionateScreenWidth(345),
      height: getProportionateScreenHeight(48),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: backgroundGrey),
      child: CustomTextField(
        hint: "ابحث هنا",
        prefixImage: "assets/images/home/search_icon.png",
        suffixImage: "assets/images/home/filter_icon.png",
      ),
    );
  }
}
