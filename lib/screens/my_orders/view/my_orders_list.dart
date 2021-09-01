import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/gradient.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
import 'package:pets_ecommerce/screens/corner/model/corner_model.dart';
import 'package:pets_ecommerce/screens/home/view/components/search_bar_component.dart';
import 'package:pets_ecommerce/screens/my_corner/view/my_corners_list.dart';
import 'package:pets_ecommerce/screens/my_orders/controller/my_orders_controller.dart';
import 'package:pets_ecommerce/screens/stores/view/components/vertical_store_list_card.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';
import 'package:pets_ecommerce/screens/corner/view/components/vertical_corner_card.dart';
import 'package:http/http.dart' as http;
import 'package:pets_ecommerce/services/http_requests_service.dart';

import 'package:get/get.dart';

import 'package:pets_ecommerce/screens/widgets/drawer/custom_drawer.dart';

import 'add_order_screen.dart';
import 'components/my_order_vertical_card.dart';
class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}
MyOrdersController ordersController=Get.put(MyOrdersController());
class _MyOrdersScreenState extends State<MyOrdersScreen> {

  @override
  void initState() {
ordersController.getMyOrders();
    // TODO: implement initState
    super.initState();
    consolePrint("in int state");

  }
  @override
  Widget build(BuildContext context) {
    return
      // error?Container(height: getProportionateScreenHeight(400),width: getProportionateScreenWidth(400),
      // child: Center(child: AutoSizeText("عذراً لقد حدثت مشكلة الرجاء المحاولة لاحقاً"),),):loading?LoadingScreen():
     Scaffold(
       // endDrawer: CustomDrawer(),

       body: Builder(
         builder: ((context)=> SafeArea(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               // Directionality(
               //   textDirection: TextDirection.rtl,
               //   child: Container(
               //     child: Material(
               //       elevation: 5,
               //       color: Colors.white,
               //       child: Container(
               //           width: SizeConfig.screenWidth,
               //           height: getProportionateScreenHeight(95),
               //           child: Row(
               //             children: [
               //               SizedBox(
               //                 width: getProportionateScreenWidth(24),
               //               ),
               //               GestureDetector(
               //                 onTap: (){ Scaffold.of(context).openEndDrawer();},
               //                 child: CircleAvatar(
               //                   radius: 24,
               //                   backgroundColor: Colors.grey.shade50,
               //                   child: Image.asset(
               //                     "assets/images/home/menu_icon.png",
               //                     height: 24,
               //                     width: 20,
               //                   ),
               //                 ),
               //               ),
               //               Spacer(),
               //               Container(
               //                   height: getProportionateScreenHeight(28),
               //                   width: getProportionateScreenWidth(75),
               //                   child: AutoSizeText(
               //                     "طلباتي",
               //                     style: h5_21pt,
               //                     minFontSize: 8,
               //                   )),
               //               Spacer(),
               //               CircleAvatar(
               //                 radius: 24,
               //                 backgroundColor: Colors.grey.shade50,
               //                 child: Image.asset(
               //                   "assets/images/home/notification_icon.png",
               //                   height: 24,
               //                   width: 20,
               //                 ),
               //               ),
               //               SizedBox(
               //                 width: getProportionateScreenWidth(24),
               //               ),
               //             ],
               //           )),
               //     ),
               //   ),
               // ),

               ///appBAr
               ///
               Container(
                 child: GetBuilder<MyOrdersController>(
                   init: ordersController,
                   builder:(controller)=> controller.loading?Container(
                     width: getProportionateScreenWidth(390),
                     height: getProportionateScreenHeight(200),
                     child: Container(
                         height: getProportionateScreenHeight(75),
                         width: getProportionateScreenWidth(75),
                         alignment: Alignment.center,
                         child: Center(
                           child: CircularProgressIndicator(),
                         )),
                   ):Expanded(
                     // margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
                       child: Container(
                           width: getProportionateScreenWidth(390),

                           // height: getProportionateScreenHeight(500),
                         // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16),vertical: getProportionateScreenHeight(16)),
                         child:RefreshIndicator(
                           onRefresh: ()async{
                             await controller.getMyOrders();
                           },
                           child: SingleChildScrollView(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                             ...List<Widget>.generate(
                             // physics: NeverScrollableScrollPhysics(),
                                  controller.myOrders.length,
                              ( index) =>
                                     index==0?Column(children: [
                                       SizedBox(height: getProportionateScreenHeight(20),),
                               MyVerticalOrderListCard(controller.myOrders[index],()async{await controller.deleteOrder(controller.myOrders[index].id);})
                                     ],):index==controller.myOrders.length-1?Column(children: [

                                       MyVerticalOrderListCard(controller.myOrders[index],()async{await controller.deleteOrder(controller.myOrders[index].id);})
                                      , SizedBox(height: getProportionateScreenHeight(20),),
                                     ],):MyVerticalOrderListCard(controller.myOrders[index],()async{await controller.deleteOrder(controller.myOrders[index].id);})),
                               ],
                             ),
                           ),
                         )
                       )),
                 ),
               ),
             ],
           ),
         )),
       )



     );
  }
}
