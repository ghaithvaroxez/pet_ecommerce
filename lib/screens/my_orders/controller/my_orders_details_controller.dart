import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/corner/model/corner_model.dart';
import 'package:pets_ecommerce/screens/my_corner/view/my_corners_list.dart';

import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/my_orders/requests/my_orders_requests.dart';
import 'package:pets_ecommerce/screens/my_orders/view/my_orders_list.dart';
import 'package:pets_ecommerce/screens/orders/model/all_orders_model.dart';
import 'package:pets_ecommerce/screens/orders/views/select_order_view.dart';
class MyOrdersDetailsController extends GetxController{
  bool loading =false;
  MyOrdersRequests myOrdersRequests=MyOrdersRequests();
  Order order;
  int oId;
  MyOrdersDetailsController(this.oId);

  getOrder()async{
    order =await myOrdersRequests.getOrderId(oId);
    update();
  }


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    init();
  }
  init()async{
    setLoading();
    await myOrdersRequests.getmodel();
    // await getOrder();
    removeLoading();
    update();
  }

 Future<bool> updateOrder(
  @required int oreder_id,
      // Function refresh,
  {@required String orderImage,
  @required String name,
  @required String desc,
  @required int cat_id,
  @required int type_id,
  @required String order_type,
  @required int price}) async
  {
    consolePrint("in my order details controller image:"+orderImage );
    // consolePrint("in my corner controller bool image:"+newImage.toString() );
    setLoading();
    try {
      bool k = await myOrdersRequests.updateOrder(oreder_id, orderImage: orderImage, name: name, desc: desc, cat_id: cat_id, type_id: type_id, order_type: order_type, price: price);
      if (k == true) {
        // await refresh();
        await ordersController.getMyOrders();
        await allOrdersController.fetchData();
        ///await cornerController.init();
        Get.back();
        removeLoading();
        update();
        return k;
      } else {
        Get.back();
        ///await cornerController.init();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't edit your corner now try again later",
            backgroundColor: Colors.redAccent);
        return false;
      }
    } catch(e) {
      Get.back();
      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't edit your corner  now try again later",
          backgroundColor: Colors.redAccent);
      return false;
    }
  }




  //state management
  setLoading() {
    loading = true;
    update();
  }

  removeLoading() {
    loading = false;
    update();
  }

}