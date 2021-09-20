import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/home/view/components/search_bar_component.dart';
import 'package:pets/screens/orders/views/components/vertical_order_list_card.dart';
import 'package:pets/services/http_requests_service.dart';
import '../../loading_screen.dart';
import '../model/all_orders_model.dart';
import 'package:http/http.dart' as http;
import '../controllers/orders_controller.dart';
import 'package:get/get.dart';
import 'translations/select_order_view.i18n.dart';

class SelectOrderView extends StatefulWidget {
  @override
  _SelectOrderViewState createState() => _SelectOrderViewState();
}

OrdersController allOrdersController = Get.put(OrdersController());

class _SelectOrderViewState extends State<SelectOrderView> {
  // bool loading =false;
  // bool error=false;
  // OrdersModel ordersModel;
//   fetchData()async{
//     error=false;
//     loading=true;
//     setState(() {
//
//     });
//     try{
//
//       var url=Uri.parse("${Api.baseUrl}/show/orders");
//       consolePrint("before print");
//       final h=await HttpService().getHeaders();
//       final apiResult=await http.get(url,headers: h);
//       consolePrint("after print");
// consolePrint("statusCode:"+apiResult.statusCode.toString());
//       if(apiResult.statusCode==200)
//       {
//         ordersModel =ordersModelFromJson(apiResult.body);
//       }
//       else {
//         error=true;
//       }
//
//     }catch(e){
//       error=true;
//       consolePrint(e.toString());
//       loading=false;
//       setState(() {
//
//       });
//
//     }
//
//
//
//     loading=false;
//     setState(() {
//
//     });
//
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allOrdersController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
        init: allOrdersController,
        builder: (controller) => Container(
            margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
            child: controller.error
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: getProportionateScreenHeight(600),
                        width: getProportionateScreenWidth(370),
                        child: Center(
                          child: Text(
                            "الرجاء المحاولة مجدداً ".i18n,
                            style: body3_18pt,
                          ),
                        ),
                      ),
                    ],
                  )
                : controller.loading
                    ? LoadingScreen()
                    : RefreshIndicator(
                        onRefresh: () async {
                          await controller.fetchData();
                        },
                        child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.ordersModel.orders.length,
                            itemBuilder: (context, index) => index == 0
                                ? Column(
                                    children: [
                                      SearchBar(),
                                      VerticalOrderListCard(
                                          controller.ordersModel.orders[index],
                                          false)
                                    ],
                                  )
                                : VerticalOrderListCard(
                                    controller.ordersModel.orders[index],
                                    false)),
                      )));
  }
}
