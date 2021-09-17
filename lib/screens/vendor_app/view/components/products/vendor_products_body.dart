import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/vendor_app/controller/products_controller.dart';
import 'package:pets/screens/vendor_app/controller/vendor_label_controller.dart';
import 'package:pets/screens/vendor_app/model/constants.dart';
import 'edit_product_screen.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets/screens/vendor_app/view/components/products/vendor_product_card.dart';
import 'package:get/get.dart';
import 'package:pets/screens/vendor_app/model/enums.dart';
import 'package:pets/screens/vendor_app/view/components/products/add_new_product_screen.dart';
import 'translations/vendor_products_body.i18n.dart';
class VendorProductsBodyScreen extends StatefulWidget {
  VendorProductsController vendorProductsController;
  VendorProductsBodyScreen(this.vendorProductsController);
  @override
  _VendorProductsBodyScreenState createState() => _VendorProductsBodyScreenState();
}

class _VendorProductsBodyScreenState extends State<VendorProductsBodyScreen> {

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
      child: GetBuilder<VendorProductsController>(
          init: widget.vendorProductsController,
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
              : controller.products.length == 0
                  ? Center(
                      child: Container(
                        child: AutoSizeText(
                          "لايوجد منتجات حالياً".i18n,
                          style: darkGrayText_16pt,
                          minFontSize: 25,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => VendorProductCard(
                        product: controller.products[index],
                        delete:
                            ()async{
                          await controller.deleteProduct(controller.products[index]);
                        },
                        edit: () {
                          Get.to(
                              VendorAppEditProduct(controller.products[index],widget.vendorProductsController));
                        },
                        changeStatus:
                            ()async{
                          await controller.changeStatus(controller.products[index].id);
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
