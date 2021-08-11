import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
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
        child:
        Container(
          height: getProportionateScreenHeight(400),
          width: getProportionateScreenWidth(350),
          alignment: Alignment.center,
          child: AutoSizeText("لا يوجد عناصر في المفضلة",style: body3_18pt,),
        ),
        // ListView.builder(
        //   // physics: NeverScrollableScrollPhysics(),
        //     itemCount: 20,itemBuilder:(context,index)=>VerticalStoreListCard() )
    );
  }
}
