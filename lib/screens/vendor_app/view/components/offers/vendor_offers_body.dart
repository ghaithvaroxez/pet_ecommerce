import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/vendor_app/controller/offers_controller.dart';
import 'package:pets/screens/vendor_app/controller/products_controller.dart';
import 'package:pets/screens/vendor_app/controller/vendor_label_controller.dart';
import 'package:pets/screens/vendor_app/model/constants.dart';
import 'package:pets/screens/vendor_app/view/components/offers/edit_offer_screen.dart';
import 'package:pets/screens/vendor_app/view/components/offers/vendor_offer_card.dart';
import 'package:pets/screens/vendor_app/view/components/products/edit_product_screen.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets/screens/vendor_app/view/components/products/vendor_product_card.dart';
import 'translation/vendor_offers_body.dart';
import 'package:get/get.dart';
import 'package:pets/screens/vendor_app/model/enums.dart';
import 'package:pets/screens/vendor_app/view/components/products/add_new_product_screen.dart';

class VendorOffersBodyScreen extends StatefulWidget {
  VendorOffersController vendorOffersController;
  VendorOffersBodyScreen (this.vendorOffersController);
  @override
  _VendorOffersBodyScreenState createState() => _VendorOffersBodyScreenState();
}

class _VendorOffersBodyScreenState extends State<VendorOffersBodyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // vendorProductsController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(26),horizontal: getProportionateScreenWidth(8)),
      child: GetBuilder<VendorOffersController>(
          init: widget.vendorOffersController,
          builder: (controller) => controller.loading == true
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenHeight(50),
                width: getProportionateScreenWidth(50),
                child: CircularProgressIndicator(),
              )
            ],
          )
              : controller.offers.length == 0
              ? Center(
            child: Container(
              child: AutoSizeText(
                "لايوجد عروض حالياً".i18n,
                style: darkGrayText_16pt,
                minFontSize: 25,
              ),
            ),
          )
              : ListView.builder(
            itemCount: controller.offers.length,
            itemBuilder: (context, index) => VendorOfferCard(
              offer: controller.offers[index],
              delete:
                  ()async{
                await controller.deleteOffer(controller.offers[index]);
              },
              edit: () {
                Get.to(
                    VendorAppEditOffer(controller.offers[index],widget.vendorOffersController));
              },
              changeStatus: ()async{
                controller.changeStatus(controller.offers[index].id);
              },
            ),
          )

        //         else if(controller.state==ProductsScreenState.addProduct)
        //     return VendorAppAddNewProduct
        //     ();else if(controller.state==ProductsScreenState.editProduct)
        // return VendorAppEditProduct();

      ),
    );
  }
}
