import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/offers_controller.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/products_controller.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/vendor_label_controller.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/constants.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/components/offers/add_new_offer_screen.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/components/offers/vendor_offer_card.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/components/products/vendor_product_card.dart';
import 'package:pets_ecommerce/models/product.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/components/products/add_new_product_screen.dart';
class VendorOffersBodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(26)),
        child: GetBuilder<VendorOffersController>(
init: vendorOfferController,
          builder: (controller) {
  if(controller.state==OffersScreenState.showOffers)
            return controller.offers.length==0?Center(child: Container(child: AutoSizeText("لايوجد عروض حالياً",style: darkGrayText_16pt,minFontSize: 25,),),):
            ListView.builder(
              itemCount: controller.offers.length,
              itemBuilder: (context, index) => VendorOfferCard(offer: controller.offers[index]),
            );
  else if(controller.state==OffersScreenState.addOffer)
    return VendorAppAddNewOffer();
  else if(controller.state==OffersScreenState.editOffer)
    return Container();
          }
        ),


      );
  }
}
