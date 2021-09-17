import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/corner/model/corner_model.dart';
// import '../requests/my_corner_requests.dart';
import 'package:get/get.dart';
import 'package:pets/screens/my_orders/requests/my_orders_requests.dart';
import 'package:pets/screens/orders/model/all_orders_model.dart';
import 'package:pets/screens/orders/views/select_order_view.dart';
import 'translations/my_oreders_controller.i18n.dart';
class MyOrdersController extends GetxController{
  List<Order> myOrders=[];
  // List<Order> myAnswers=[];
  bool loading =false;
  MyOrdersRequests myOrdersRequests=MyOrdersRequests();


getMyOrders()async{
  myOrders=await myOrdersRequests.getMyOrders();
  update();
}

// getMyAnswers()async{
//   myAnswers=await myOrdersRequests.getMyAnsweredOrders();
//   update();
// }
@override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  init()async{
  setLoading();
  await myOrdersRequests.getmodel();
  await getMyOrders();
  removeLoading();
  update();
  }

  addOrder(
      @required String orderImage,
      @required String name,
      @required String desc,
      @required int cat_id,
      @required int type_id,
      @required String order_type,
      @required double price,
      ) async
  {

try{
  setLoading();
  bool k=await myOrdersRequests.addOrder(orderImage, name, desc, cat_id, type_id, order_type, price);
  if(k){
    Get.back();
    Get.rawSnackbar(message: "لقد تم اضافة طلبك بنجاح ".i18n,backgroundColor: Colors.green);
  await getMyOrders();
  await allOrdersController.fetchData();

  removeLoading();
  }
  else{

    Get.rawSnackbar(message: "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ".i18n,backgroundColor: Colors.redAccent);
    Get.back();
    removeLoading();
  }

} catch(e)
{
  consolePrint(e.toString());
  Get.rawSnackbar(message: "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ".i18n,backgroundColor: Colors.redAccent);
  Get.back();
  removeLoading();
}
update();

  }

  deleteOrder(int id)async
  {
    try{
      setLoading();
      bool k=await myOrdersRequests.deleteOrder(id);
      if(k){
        Get.rawSnackbar(message: "لقد تم حذف طلبك بنجاح ".i18n,backgroundColor: Colors.green);
        await getMyOrders();
        await allOrdersController.fetchData();
        removeLoading();
      }
      else{

        Get.rawSnackbar(message: "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ".i18n,backgroundColor: Colors.redAccent);
        removeLoading();
      }

    } catch(e)
    {
      consolePrint(e.toString());
      Get.rawSnackbar(message: "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ".i18n,backgroundColor: Colors.redAccent);
      removeLoading();
    }
    update();

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