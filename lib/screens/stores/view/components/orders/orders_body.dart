import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/stores/view/components/offers/store_offer_card.dart';
import 'package:pets_ecommerce/screens/stores/view/components/orders/store_orders_card.dart';

class OrdersBodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24),
            vertical: getProportionateScreenHeight(26)),
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) =>  StoreOrderCard(),
        ),
      );
  }
}
