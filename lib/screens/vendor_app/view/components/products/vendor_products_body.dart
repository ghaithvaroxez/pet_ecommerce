import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/products_controller.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/vendor_label_controller.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/constants.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/components/products/vendor_product_card.dart';
import 'package:pets_ecommerce/models/product.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/components/products/add_new_product_screen.dart';
class VendorProductsBodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(26)),
        child: GetBuilder<VendorProductsController>(
init: vendorProductsController,
          builder: (controller) {
  if(controller.state==ProductsScreenState.showProducts)
            return controller.products.length==0?Center(child: Container(child: AutoSizeText("لايوجد منتجات حالياً",style: darkGrayText_16pt,minFontSize: 25,),),):ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) => VendorProductCard(product: controller.products[index]),
            );
  else if(controller.state==ProductsScreenState.addProduct)
    return VendorAppAddNewProduct();
  else if(controller.state==ProductsScreenState.editProduct)
    return Container();
          }
        ),
      );
  }
}
