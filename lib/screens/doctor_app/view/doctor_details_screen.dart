import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/gradient.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/doctor_app/controller/doctor_controler.dart';
import 'package:pets_ecommerce/screens/stores/view/components/orders/orders_body.dart';
import 'package:pets_ecommerce/screens/widgets/floating_action_button.dart';
import '../model/constants.dart';
import 'package:get/get.dart';
import '../controller/doctor_label_controller.dart';
import '../view/components/about/doctor_about_body.dart';
import 'components/orders/doctor_orders_body.dart';
import '../view/components/services/doctor_services_body.dart';
import 'components/services/add_new_service_screen.dart';
import 'package:pets_ecommerce/screens/doctor_app/model/doctor.dart';
import 'package:http/http.dart' as http;

class DoctorAppDetailsPage extends StatefulWidget {

  @override
  _DoctorAppDetailsPageState createState() => _DoctorAppDetailsPageState();
}

class _DoctorAppDetailsPageState extends State<DoctorAppDetailsPage>
    with SingleTickerProviderStateMixin {
  DoctorController customDoctorController=Get.put(DoctorController());
  TabController doctorAppTabController;
  DoctorLabelController customDoctorLabelController=Get.put(DoctorLabelController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctorAppTabController = TabController(length: 2, vsync: this);
    doctorAppTabController.addListener(() {
      customDoctorLabelController.changeIndex(doctorAppTabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      floatingActionButton:  Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: blueGradient
        ),
        child: GestureDetector(

          onTap: (){
            doctorAppTabController.animateTo(0);
            customDoctorLabelController.changeIndex(0);
             Get.to(VendorAppAddService(customDoctorController));
            // customDoctorServicesController.changeToAddService();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: getProportionateScreenHeight(300),
              child: Container(
                child:  GetBuilder<DoctorController>(
                  init: customDoctorController,
                  builder: (controller)=>controller.init==false? Image.asset(
                    "assets/images/doctors/femal_doctor_details_image.png",
                    fit: BoxFit.fill,
                  ):controller.doctorModel.doctor.image==null?Image.asset(
                    "assets/images/doctors/femal_doctor_details_image.png",
                    fit: BoxFit.fill,
                  ):CachedNetworkImage(
                    imageUrl: Api.imagePath+controller.doctorModel.doctor.image,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Container(alignment:Alignment.center,height:getProportionateScreenHeight(75),width:getProportionateScreenWidth(75),child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/home/shop_image.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: getProportionateScreenHeight(300),
              child: Container(
                child: Image.asset(
                  "assets/images/store/black_layer.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),


            // Positioned(
            //   top: getProportionateScreenHeight(34),
            //   left: getProportionateScreenWidth(24),
            //   child: GestureDetector(
            //     onTap: (){
            //       Navigator.pop(context);
            //     },
            //     child: Container(
            //       width: getProportionateScreenWidth(48),
            //       height: getProportionateScreenHeight(48),
            //       decoration: BoxDecoration(
            //           color: Colors.white.withOpacity(0.8),
            //           shape: BoxShape.circle),
            //       child: Center(
            //         child: Icon(
            //           Icons.arrow_back_ios_outlined,
            //           size: 14,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: getProportionateScreenHeight(180),
            //   right: getProportionateScreenWidth(10),
            //   child: Stack(
            //     children: [
            //
            //       Image.asset("assets/images/vendor_app/camera.png",    width: getProportionateScreenWidth(52),
            //         height: getProportionateScreenHeight(52),fit: BoxFit.fill,),
            //
            //     ],
            //   ),
            // ),///camera

            Positioned(
              top: getProportionateScreenHeight(250),
              left: 0,
              right: 0,
              child: Container(
                height: getProportionateScreenHeight(55),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(

                    children: [
                      Expanded(
                        child: GetBuilder<DoctorLabelController>(
                          init:  customDoctorLabelController,
                          builder: (controller) => GestureDetector(
                            onTap: () {
                              doctorAppTabController.animateTo(0);
                              controller.changeIndex(0);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(12)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12)),
                                color: controller.backgroundColors[0],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: getProportionateScreenHeight(18),
                                    width: getProportionateScreenWidth(18),
                                    child: Image.asset(
                                      controller.services,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: getProportionateScreenHeight(20),
                                    width: getProportionateScreenWidth(80),
                                    child: AutoSizeText(
                                      "الخدمات ",
                                      style: controller.servicesStyle,
                                      minFontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///products

                      Expanded(
                        child: GetBuilder<DoctorLabelController>(
                          init:  customDoctorLabelController,
                          builder: (controller) => GestureDetector(
                            onTap: () {
                              doctorAppTabController.animateTo(1);
                              controller.changeIndex(1);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(12)),
                              decoration: BoxDecoration(
                                color: controller.backgroundColors[1],
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: getProportionateScreenHeight(18),
                                    width: getProportionateScreenWidth(18),
                                    child: Image.asset(
                                      controller.aboutStore,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: getProportionateScreenHeight(20),
                                    width: getProportionateScreenWidth(80),
                                    child: AutoSizeText(
                                      "معلومات شخصية",
                                      style: controller.aboutStoreStyle,
                                      minFontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///about store


                      // Expanded(
                      //   child: GetBuilder<DoctorLabelController>(
                      //     init:  customDoctorLabelController,
                      //     builder: (controller) => GestureDetector(
                      //       onTap: () {
                      //         doctorAppTabController.animateTo(2);
                      //         controller.changeIndex(2);
                      //       },
                      //       child: Container(
                      //         padding: EdgeInsets.only(
                      //             top: getProportionateScreenHeight(12)),
                      //         // padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.only(
                      //               topLeft: Radius.circular(12)),
                      //           color: controller.backgroundColors[2],
                      //         ),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Container(
                      //               height: getProportionateScreenHeight(18),
                      //               width: getProportionateScreenWidth(18),
                      //               child: Image.asset(
                      //                 controller.orders,
                      //                 fit: BoxFit.fill,
                      //               ),
                      //             ),
                      //             Container(
                      //               alignment: Alignment.center,
                      //               height: getProportionateScreenHeight(20),
                      //               width: getProportionateScreenWidth(80),
                      //               child: AutoSizeText(
                      //                 "ردود الطلبات",
                      //                 style: controller.ordersStyle,
                      //                 minFontSize: 8,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      ///photos
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: getProportionateScreenHeight(305),
                left: 0,
                right: 0,
                bottom: 0,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    child: TabBarView(
                      controller: doctorAppTabController,
                      children: [
                        // ProductsBodyScreen(),
                        // AboutStoreBodyScreen(),
                        // OffersBodyScreen(),
                        // OrdersBodyScreen(),
                        DoctorServicesBodyScreen(customDoctorController),
                        AboutDoctorBodyScreen(customDoctorController),
                        // DoctorOrdersBodyScreen(),

                        // VendorProductsBodyScreen(),
                        // AboutStoreBodyScreen(),
                        // VendorOffersBodyScreen(),
                        // OrdersBodyScreen(),
                        // OrdersBodyScreen()
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
