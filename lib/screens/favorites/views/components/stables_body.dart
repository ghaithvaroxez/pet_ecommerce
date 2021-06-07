import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/stores/view/components/vertical_store_list_card.dart';

class FavoriteStablesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(
          // horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(16)),
      // margin:  EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
        child: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
            itemCount: 20,itemBuilder:(context,index)=>VerticalStoreListCard() ));
  }
}
