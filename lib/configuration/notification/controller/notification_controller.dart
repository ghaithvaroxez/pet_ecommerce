import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pets/screens/orders/views/order_details_screen.dart';
import 'package:pets/screens/stores/view/store_details_id.dart';
import 'package:pets/services/local_storage_service.dart';
import '../../PushNotificationService.dart';
import '../../printer.dart';
import '../model/notification.dart';
import '../service/notification.service.dart';
import 'package:pets/screens/stores/view/components/offers/offer_details_screen_by_id.dart';

FlutterLocalNotificationsPlugin localNotification;

class NotificationController extends GetxController {
  List<NotificationModel> notifications = [];
  RxInt count = 0.obs;

  getNotifications() async {
    notifications = await NotificationService.getNotifications();
    count.value = 0;
    for (int i = 0; i < notifications.length; i++) {
      print(notifications[i].read.toString() + i.toString());
      if (notifications[i].read == false) count.value += 1;
    }

    update();
  }

  //  saveNewNotification(RemoteMessage message) {
  //
  //   NotificationModel notificationModel = NotificationModel();
  //   notificationModel.title = message.notification.title;
  //   notificationModel.body = message.notification.body;
  //   notificationModel.timeStamp = DateTime.now().millisecondsSinceEpoch;
  //   notificationModel.read=false;
  //
  //   NotificationService.addNotification(notificationModel);
  //   getNotifications();
  //   update();
  // }

  Future _scheduleNotification(
      String title, String body, String payload, int id) async {
    var scheduledNotificationDateTime =
        new DateTime.now().add(new Duration(seconds: 1));
    payload += ',' + id.toString();
    await localNotification.show(0, title, body, platformChannelSpecifics,
        payload: payload);
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    print('on did recieve');
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('pets', 'pets', 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await localNotification.show(0, title, body, platformChannelSpecifics,
        payload: payload);
  }

  Future selectNotification(
    String payload,
  ) async {
    int id = int.parse(payload.substring(payload.indexOf(',')));
    payload = payload.split(',')[0];
    print('select notification!!');
    if (payload != null) {
      print('notification payload: $payload');
    }
    if (payload == 'New Store Notification') {
      print('===============New Store Notification===============');
      Get.to(StoreDetailsById(id));
      // await Navigator.push(
      //     context,
      //     MaterialPageRoute<void>(builder: (context) => StoreDetailsById(id),
      //     ));
    }

    if (payload == 'New Offer Notification') {
      print('===============New Offer Notification===============');
      consolePrint("offeer tapped");
      Get.to(OfferDetailsPageById(id));

      // await Navigator.push(
      //     context,
      //     MaterialPageRoute<void>(builder: (context) => OfferDetailsPage(id),
      //     ));
    }
    if (payload == 'New Order Notification') {
      print('===============order===============');
      Get.to(OrderDetailsScreen(id));
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute<void>(builder: (context) => OrderDetailsScreen(id),
      // ));
    }

    /* await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    );*/
  }

  checkNotificationType(RemoteMessage message) async {
    if ('${message.data['type']}' == 'New Order Notification') {
      _scheduleNotification(
          '${message.notification.title}',
          '${message.notification.body}',
          '${message.data['type']}',
          int.parse(message.data['item_id']));

      Get.snackbar(
          '${message.notification.title}', '${message.notification.body}',
          duration: Duration(seconds: 5),
          snackStyle: SnackStyle.FLOATING,
          onTap: (n) =>
              Get.to(OrderDetailsScreen(int.parse(message.data['item_id']))));
    }
    if ('${message.data['type']}' == 'New Offer Notificatio') {
      _scheduleNotification(
          '${message.notification.title}',
          '${message.notification.body}',
          '${message.data['type']}',
          int.parse(message.data['item_id']));
      consolePrint("offeer tapped");
      // await Navigator.push(
      //   context,
      //   MaterialPageRoute<void>(builder: (context) => OfferDetailsPage(int.parse(message.data['item_id']),store: false,)),
      // );
    }
    if ('${message.data['type']}' == 'New Store Notification') {
      _scheduleNotification(
          '${message.notification.title}',
          '${message.notification.body}',
          '${message.data['type']}',
          int.parse(message.data['item_id']));
      Get.snackbar(
          '${message.notification.title}', '${message.notification.body}',
          duration: Duration(seconds: 5),
          snackStyle: SnackStyle.FLOATING,
          onTap: (n) =>
              Get.to(StoreDetailsById(int.parse(message.data['item_id']))));
    } else {
      _scheduleNotification('${message.notification.title}',
          '${message.notification.body}', "", -1);
      Get.snackbar(
        '${message.notification.title}',
        '${message.notification.body}',
        duration: Duration(seconds: 5),
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }

  updateNotifications() {
    for (int i = 0; i < notifications.length; i++) {
      if (!notifications[i].read) {
        updateToRead(notifications[i]);
      }
    }
    getNotifications();
    update();
  }

  updateToRead(NotificationModel notificationModel) async {
    //
    notificationModel.read = true;
    NotificationService.updateNotification(notificationModel);
    update();
  }

  init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    bool k = await localNotification.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'driveme',
      'driveme',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    var androidInitilize =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    // localNotification = new FlutterLocalNotificationsPlugin();
    // localNotification.initialize(initilizationsSettings,
    //     onSelectNotification: notificationSelected);
  }

  NotificationDetails platformChannelSpecifics;

  showNotification(RemoteMessage message) async {
    checkNotificationType(message);
    // var androidDetails =new AndroidNotificationDetails("7", "varoxez", "description",importance: Importance.max,showWhen: true,icon: '@mipmap/ic_launcher' );
    // var iOSDetails= new IOSNotificationDetails();
    // var generalNotificationDetails=new NotificationDetails(android:androidDetails, iOS: iOSDetails);

    // await localNotification.show(1, title, desc, generalNotificationDetails);
  }

  Future notificationSelected(String payload) async {}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
    LocalStorageService.getPrefs();
  }
}
