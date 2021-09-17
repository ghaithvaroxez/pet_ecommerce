// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:pets/configuration/printer.dart';
// import 'package:pets/screens/auth/controller/services/auth_services.dart';
// import 'package:pets/screens/doctor_app/requests/doctor_info_requests.dart';
// import 'package:pets/screens/orders/views/order_details_screen.dart';
// import 'package:pets/screens/stores/view/components/offers/offers_details_screen.dart';
// import 'package:pets/screens/stores/view/store_details_id.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// new FlutterLocalNotificationsPlugin();
//
// Future<dynamic> ffirebaseMessagingBackgroundHandler(
//     Map<String, dynamic> message,
//     ) async {
//   print('back back');
//   try{
//     print("myBackgroundMessageHandler message:"+message['data']);
//     print("myBackgroundMessageHandler message: $message");
//     // int msgId = int.tryParse(message["data"]["msgId"].toString()) ?? 0;
//     // print("msgId $msgId");
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'driveme', 'driveme', 'your channel description',
//         color: Colors.blue.shade800,
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: 'ticker');
//     var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics);
//     // await serviceLocatorInstance<NotificationService>().showNotificationWithDefaultSound(message);
//     await flutterLocalNotificationsPlugin.show(1, message["title"],
//         message["body"], platformChannelSpecifics,
//         payload: message["data"]["type"]);
//
//   }catch(error){
//     print('error '+error.toString());
//   }
//
//
// }
//
// class PushNotificationService {
//   final FirebaseMessaging _fcm;
//   BuildContext context;
//   PushNotificationService(this._fcm,this.context);
//
//   Future initialise(bool updateUser) async {
//     if (Platform.isIOS) {
//       _fcm.requestNotificationPermissions(IosNotificationSettings());
//     }
//
//     // If you want to test the push notification locally,
//     // you need to get the token and input to the Firebase console
//     // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
//     String token = await _fcm.getToken();
//     print("FirebaseMessaging token: $token");
//     bool firstTimeOnApp= AuthServices.firstTimeOnApp();
//
//    if(firstTimeOnApp==true) {
//       DoctorAppRequests doctorAppRequests = DoctorAppRequests();
//       doctorAppRequests.getModel();
//       bool k = false;
//
//       while (!k) {
//         k = await doctorAppRequests.updateDeviceId(device_id: token);
//       }
//     }
//     // SharedPreferences prefs = await SharedPreferences.getInstance();
//     // prefs.setString('fcmToken',token);
//     // if(updateUser==true){
//     //   await updateUserFcm(token, context);
//     //
//     // }
//
//
//     FirebaseMessaging.configure(
//       onBackgroundMessage:ffirebaseMessagingBackgroundHandler,
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         print('${message['data']['body']}');
//         checkNotificationType(message);
//         // _scheduleNotification();
//
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         // _scheduleNotification();
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         // _scheduleNotification();
//       },
//     );
//   }
//
//   Future _scheduleNotification(String title, String body, String payload,int id) async {
//     var scheduledNotificationDateTime =
//     new DateTime.now().add(new Duration(seconds: 1));
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//     final IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     final MacOSInitializationSettings initializationSettingsMacOS =
//     MacOSInitializationSettings();
//     final InitializationSettings initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid,
//         iOS: initializationSettingsIOS,
//         macOS: initializationSettingsMacOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: selectNotification);
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'driveme', 'driveme', 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         0, title, body, platformChannelSpecifics,
//         payload: payload);
//   }
//
//   Future onDidReceiveLocalNotification(
//       int id, String title, String body, String payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     print('on did recieve');
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//         'driveme', 'driveme', 'your channel description',
//         importance: Importance.max,
//         priority: Priority.high,
//         showWhen: false
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         0, title, body, platformChannelSpecifics,
//         payload: payload);
//   }
//
//
//   Future selectNotification(String payload,) async {
//     print('select notification!!');
//     if (payload != null) {
//       debugPrint('notification payload: $payload');
//     }
//     if(payload=='New Store Notification')
//     {
//       print('===============New Store Notification===============');
//       // await Navigator.push(
//       //     context,
//       //     MaterialPageRoute<void>(builder: (context) => StoreDetailsById(id),
//       //     ));
//     }
//     if(payload=='New Offer Notification')
//     {
//       print('===============New Offer Notification===============');
//       consolePrint("offeer tapped");
//       // await Navigator.push(
//       //     context,
//       //     MaterialPageRoute<void>(builder: (context) => OfferDetailsPage(id),
//       //     ));
//     }
//     if(payload=='New Order Notification')
//     {
//       print('===============order===============');
//       // await Navigator.push(
//       //   context,
//       //   MaterialPageRoute<void>(builder: (context) => OrderDetailsScreen(id),
//       // ));
//     }
//
//     /* await Navigator.push(
//       context,
//       MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
//     );*/
//   }
//
//   checkNotificationType(Map<String, dynamic> message) async{
//     if('${message['data']['type']}'=='New Order Notification')
//     {
//       _scheduleNotification('${message['title']}','${message['body']}','${message['data']['type']}',message['data']['type']==null?-1:message['data']['type']);
//       await Navigator.push(
//         context,
//         MaterialPageRoute<void>(builder: (context) => OrderDetailsScreen(message['data']['item_id'])),
//       );
//     }
//     if('${message['data']['type']}'=='New Offer Notificatio')
//     {
//       _scheduleNotification('${message['title']}','${message['body']}','${message['type']}',message['data']['type']==null?-1:message['data']['type']);
// consolePrint("offeer tapped");
//       // await Navigator.push(
//       //   context,
//       //   MaterialPageRoute<void>(builder: (context) => OfferDetailsPage(message['data']['item_id'],store: false,)),
//       // );
//     }
//     if('${message['data']['type']}'=='New Store Notification')
//     {
//       _scheduleNotification('${message['title']}','${message['body']}','${message['data']['type']}',message['data']['type']==null?-1:message['data']['type']);
//       await Navigator.push(
//         context,
//         MaterialPageRoute<void>(builder: (context) => StoreDetailsById(message['data']['item_id'])),
//       );
//     }
//     else{
//       _scheduleNotification('${message['title']}','${message['body']}',"",-1);
//
//     }
//   }
//
//import 'package:firebase_messaging/firebase_messaging.dart';
//
// }

