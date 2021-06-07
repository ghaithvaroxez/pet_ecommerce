import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';
class FavoriteProductsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(24),
    vertical: getProportionateScreenHeight(26)),
    child: ListView.builder(
    itemCount: 30,
    itemBuilder: (context, index) => Column(
    children: [
    Row(
    children: [
    StoreProductCard(),
    SizedBox(width: getProportionateScreenWidth(15),),
    StoreProductCard(),
    ],
    ),
    SizedBox(height: getProportionateScreenHeight(16),),
    ],
    ),
    ),
    );
  }
}
