import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/stores/view/components/offers/store_offer_card.dart';

class OffersBodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24),
            vertical: getProportionateScreenHeight(26)),
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                children: [
                  StoreOfferCard(),
                  SizedBox(width: getProportionateScreenWidth(15),),
                  StoreOfferCard(),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(16),),
            ],
          ),
        ),

        // child: GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       // mainAxisSpacing: getProportionateScreenHeight(16),
        //       // crossAxisSpacing: getProportionateScreenHeight(16),
        //       // childAspectRatio:1.3
        //       childAspectRatio: 1.19
        //     ),
        //     itemCount: 30,
        //     itemBuilder: (context, index) => StoreProductCard()),
      );
  }
}
