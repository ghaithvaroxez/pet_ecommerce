import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/PushNotificationService.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/orders/views/order_details_screen.dart';
import 'package:pets/screens/stores/view/store_details_id.dart';

class NotificationNumberController extends GetxController{
  int count=0;

  getCount()async{
    count=await AuthServices.getNotificationsCount();
    update();
  }

  increaseCount()async{
    int temp=await AuthServices.getNotificationsCount();
    temp++;
  await AuthServices.setNotificationsCount(temp.toString());
  getCount();
    update();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCount();
  }
}