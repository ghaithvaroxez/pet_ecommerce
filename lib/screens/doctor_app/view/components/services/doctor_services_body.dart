import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/doctor_app/controller/doctor_services_controller.dart';
import 'package:pets_ecommerce/screens/doctor_app/model/constants.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/products_controller.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/vendor_label_controller.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/constants.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/components/products/vendor_product_card.dart';
import 'package:pets_ecommerce/models/product.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
import 'package:pets_ecommerce/screens/vendor_app/view/components/products/add_new_product_screen.dart';
import '../services/doctor_service_card.dart';
import '../services/add_new_service_screen.dart';
class DoctorServicesBodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(26)),
      child: GetBuilder<DoctorServicesController>(
          init: customDoctorServicesController,
          builder: (controller) {
            if(controller.state==ServicesScreenState.showServices)
              return controller.services.length==0?Center(child: Container(child: AutoSizeText("لايوجد خدمات حالياً",style: darkGrayText_16pt,minFontSize: 25,),),):ListView.builder(
                itemCount: controller.services.length,
                itemBuilder: (context, index) => DoctorServiceCard(service: controller.services[index]),
              );
            else if(controller.state==ServicesScreenState.addService)
              return DoctorAppAddNewService();
            else if(controller.state==ServicesScreenState.editService)
              return Container();
          }
      ),
    );
  }
}
