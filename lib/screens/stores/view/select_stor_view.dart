import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/home/view/components/search_bar_component.dart';
import 'package:pets_ecommerce/screens/stores/view/components/vertical_store_list_card.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';

class SelectStoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
        child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) => index == 0
                ? Column(
                    children: [
                      SearchBar(),
                      VerticalStoreListCard()],
                  )
                : VerticalStoreListCard()));
  }
}
