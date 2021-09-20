import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/doctor_app/controller/doctor_controler.dart';
import 'package:pets/screens/doctor_app/model/constants.dart';
import 'package:pets/screens/vendor_app/controller/products_controller.dart';
import 'package:pets/screens/vendor_app/controller/vendor_label_controller.dart';
import 'package:pets/screens/vendor_app/model/constants.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets/screens/vendor_app/view/components/products/vendor_product_card.dart';
import 'package:pets/models/product.dart';
import 'package:get/get.dart';
import 'package:pets/screens/vendor_app/model/enums.dart';
import 'package:pets/screens/vendor_app/view/components/products/add_new_product_screen.dart';
import '../services/doctor_service_card.dart';
import '../services/add_new_service_screen.dart';
import '../services/edit_servie_screen.dart';
import 'translations/doctor_service_body.i18n.dart';

class DoctorServicesBodyScreen extends StatelessWidget {
  DoctorController doctorController;

  DoctorServicesBodyScreen(this.doctorController);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(26),
          horizontal: getProportionateScreenWidth(8)),
      child: GetBuilder<DoctorController>(
          init: doctorController,
          builder: (controller) => controller.isLoading == true
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
              : controller.doctorModel.doctor.doctorServices.length == 0
                  ? Center(
                      child: Container(
                        child: AutoSizeText(
                          "لايوجد خدمات حالياً".i18n,
                          style: darkGrayText_16pt,
                          minFontSize: 25,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount:
                          controller.doctorModel.doctor.doctorServices.length,
                      itemBuilder: (context, index) => DoctorServiceCard(
                        service:
                            controller.doctorModel.doctor.doctorServices[index],
                        delete: () async {
                          await controller.deleteService(controller
                              .doctorModel.doctor.doctorServices[index]);
                        },
                        edit: () {
                          Get.to(VendorAppEditService(
                              controller
                                  .doctorModel.doctor.doctorServices[index],
                              doctorController));
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
