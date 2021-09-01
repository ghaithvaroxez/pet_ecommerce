import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/my_orders/controller/my_orders_controller.dart';
import 'package:pets/screens/my_orders/view/my_orders_list.dart';
import '../../loading_screen.dart';
import '../controller/oreders_label_controller.dart';
import 'package:get/get.dart';

import 'add_order_screen.dart';
import 'my_answerd_orders_screen.dart';
class OrdersMainScreen extends StatefulWidget {
  @override
  _OrdersMainScreenState createState() => _OrdersMainScreenState();
}

class _OrdersMainScreenState extends State<OrdersMainScreen>with SingleTickerProviderStateMixin {
  bool loading =false;
  bool error =false;
  // fetchdata()
  // async {
  //   loading=true;
  //   setState(() {
  //
  //   });
  //   consolePrint("befor get ");
  //   final h=await HttpService().getHeaders();
  //   final apiResult = await http.get(
  //       Api.baseUrl+Api.getDoctorId + '/' + widget.id.toString()
  //       ,headers: h);
  //   consolePrint("after get ");
  //   if(apiResult.statusCode==200)
  //     doctorModel= doctorModelFromJson(apiResult.body);
  //
  //   else error=true;
  //
  //   loading=false;
  //   setState(() {
  //
  //   });
  // }

  TabController _tabController;
  OrdersLabelController _customerDoctorDetailsLabelController =
  Get.put(OrdersLabelController());
  @override
  void initState() {
    // fetchdata();
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _customerDoctorDetailsLabelController.changeIndex(_tabController.index);
    });
    _tabController.animateTo(1);
    _customerDoctorDetailsLabelController.changeIndex(1);

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: (){
          Get.to(AddOrderScreen(ordersController));
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: blueGradient
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: loading?LoadingScreen()
            :Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(400),
                child: Container(
                  child: Image.asset(
                    "assets/images/favorite/stores_image.png",
                    fit: BoxFit.fill,
                  )//:Image.network(Api.imagePath+doctorModel.doctor.image,fit: BoxFit.cover,),
                )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(400),
                child: Container(
                  child: Image.asset(
                    "assets/images/doctors/black_to_white_gradient.png",
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
              top: getProportionateScreenHeight(34),
              left: getProportionateScreenWidth(24),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: getProportionateScreenWidth(48),
                  height: getProportionateScreenHeight(48),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),



            Positioned(
              top: getProportionateScreenHeight(350),
              left: 0,
              right: 0,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  height: getProportionateScreenHeight(55),
                  child: Row(
                    children: [
                      Expanded(
                        child: GetBuilder<OrdersLabelController>(
                          init: _customerDoctorDetailsLabelController,
                          // init: _customerLabelController,
                          builder: (controller) => GestureDetector(
                            onTap: () {
                              _tabController.animateTo(0);
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
                                      controller.ordersResponse,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: getProportionateScreenHeight(20),
                                    width: getProportionateScreenWidth(80),
                                    child: AutoSizeText(
                                      "طلباتي ",
                                      style: controller.ordersResponseStyle,
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
                        child: GetBuilder<OrdersLabelController>(
                          init: _customerDoctorDetailsLabelController,
                          // init: _customerLabelController,
                          builder: (controller) => GestureDetector(
                            onTap: () {
                              _tabController.animateTo(1);
                              controller.changeIndex(1);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: getProportionateScreenHeight(12)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                                color: controller.backgroundColors[1],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: getProportionateScreenHeight(18),
                                    width: getProportionateScreenWidth(18),
                                    child: Image.asset(
                                      controller.personalInfo,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: getProportionateScreenHeight(20),
                                    width: getProportionateScreenWidth(80),
                                    child: AutoSizeText(
                                      "ردودي",
                                      style: controller.personalInfoStyle,
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
                      //   child: GetBuilder<CustomerDoctorDetailsLabelController>(
                      //     init: _customerDoctorDetailsLabelController,
                      //     builder: (controller) => GestureDetector(
                      //       onTap: () {
                      //         _tabController.animateTo(2);
                      //         controller.changeIndex(2);
                      //       },
                      //       child: Container(
                      //         padding: EdgeInsets.only(
                      //             top: getProportionateScreenHeight(12)),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                      //           color: controller.backgroundColors[2],
                      //         ),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Container(
                      //               height: getProportionateScreenHeight(18),
                      //               width: getProportionateScreenWidth(18),
                      //               child: Image.asset(
                      //                 controller.ordersResponse,
                      //                 fit: BoxFit.fill,
                      //               ),
                      //             ),
                      //             Container(
                      //               alignment: Alignment.center,
                      //               height: getProportionateScreenHeight(20),
                      //               width: getProportionateScreenWidth(80),
                      //               child: AutoSizeText(
                      //                 "ردود الطلبات",
                      //                 style: controller.ordersResponseStyle,
                      //                 minFontSize: 8,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ///orders
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: getProportionateScreenHeight(405),
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      MyOrdersScreen(),
                      MyAnswerdOrdersScreen(),



                      // DoctorServicesBody(doctorModel.doctor.doctorServices),
                      // DoctorPersonalInfoBody(doctorModel.doctor),
                      // DoctorOrdersResponseBody(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
