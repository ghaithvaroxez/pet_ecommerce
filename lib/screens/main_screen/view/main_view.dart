import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:pets/configuration/PushNotificationService.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/view/splash/login_or_register.dart';
import 'package:pets/screens/corner/view/select_corner.dart';
import 'package:pets/screens/search/view/components/filter_custom_bottom_sheet.dart';
import 'package:pets/screens/doctors/view/select_doctor_view.dart';
import 'package:pets/screens/filter/view/filtter_bottom_sheet.dart';
import 'package:pets/screens/home/view/home_view.dart';
import 'package:pets/screens/main_screen/controller/title_controller.dart';
import 'package:pets/screens/main_screen/model/main_screen_model.dart';
import 'package:pets/screens/stores/view/select_stor_view.dart';
import 'package:pets/screens/widgets/custom_app_bar.dart';
import 'package:pets/screens/widgets/drawer/components/drawer_item.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/screens/widgets/navigation_bar/custom_bottom_bar.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'package:pets/screens/main_screen/controller/title_controller.dart';
import 'package:pets/screens/orders/views/select_order_view.dart';
import 'package:get/get.dart';
import 'package:pets/screens/profile/view/profile_screen.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:pets/services/local_storage_service.dart';
import 'main_view.i18n..dart';
import 'package:pets/screens/notifications/view/notification_button.dart';
import '../../blocked_screen.dart';

import 'package:http/http.dart' as http;
import '../../../configuration/notification/controller/notification_controller.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

BuildContext homeContext;
NotificationController notificationController = Get.put(
  NotificationController(),
);

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  // FirebaseMessaging messaging;
  getToken() async {
    // final token= await FirebaseMessaging.instance.getToken();
    //     consolePrint("token is");
    //     consolePrint(token);
    //     consolePrint("token done");
  }

  FirebaseMessaging messaging = FirebaseMessaging();

  Timer _timer;
  Timer _timer1;

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      checkBlock();
    });
  }

  _startTimer1() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      checkConnection();
    });
  }

  _cancelTimer() {
    _timer.cancel();
  }

  _cancelTimer1() {
    _timer.cancel();
  }

  bool connection = true;

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      if (!connection) {
        Get.rawSnackbar(
            backgroundColor: Colors.green,
            message: "لقد تم التوصيل بلانترنت".i18n);
      }
      connection = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if (!connection) {
        Get.rawSnackbar(
            backgroundColor: Colors.green,
            message: "لقد تم التوصيل بلانترنت".i18n);
      }
      connection = true;
    } else {
      if (connection) {
        Get.rawSnackbar(
            backgroundColor: Colors.red,
            message: "الرجاء التاكد من توفر الانترنت".i18n);
      }
      connection = false;
    }
  }

  checkBlock() async {
    try {
      var url = Uri.parse("${Api.baseUrl}/block");
      final h = await HttpService().getHeaders();
      final apiResult = await http.get(url, headers: h);
      consolePrint(apiResult.statusCode.toString());
      if (apiResult.statusCode == 200) {
        var j = jsonDecode(apiResult.body);
        consolePrint("check block :" + apiResult.body);
        if (j['block_status'] != "false") {
          bool k = await logOut();
          if (k) {
            Get.offAll(LoginOrRegister());
            Get.to(BlockedScreen());
          } else {
            // while(!k){
            //   k= await logOut();
            //   if(k){
            //     Get.offAll(BlockedScreen());
            //     break ;
            //   }
            // }
          }
        }
      } else if (apiResult.statusCode == 401) {
        Get.offAll(LoginOrRegister());
      }
    } catch (e) {
      consolePrint("block req" + e.toString());
    }
  }

  Future<bool> logOut() async {
    try {
      var url = Uri.parse("${Api.baseUrl}/logout");
      final h = await HttpService().getHeaders();
      final apiResult = await http.post(url, headers: h);
      if (apiResult.statusCode == 200) {
        var j = jsonDecode(apiResult.body);
        if (j["message"] == "logged out") {
          await LocalStorageService.prefs.clear();
          return true;
        }
      }
      return false;
// else  await logOut();
    } catch (e) {
      consolePrint(e);
      return false;

// await logOut();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cancelTimer();
  }

  // updateDeviceId(){
  //
  // }
  @override
  void initState() {
    // final pushNotificationService = PushNotificationService(messaging,context);
    // pushNotificationService.initialise(true);
    // TODO: implement initState
    super.initState();
    if (gusetId != 146) _startTimer();
    _startTimer1();
//     FirebaseMessaging firebaseMessaging=FirebaseMessaging();
//     messaging.configure(
//       onBackgroundMessage:(Map<String, dynamic> message)async{
//         print("onBackground: $message");
//         print('${message['data']}');
//         await notificationController.showNotification(message['title'], message['body']);
//       }
//       ,
//       //_firebaseMessagingBackgroundHandler,
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         print('${message['data']}');
//         await notificationController.showNotification(message['title'], message['body']);
//
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

    messaging.getToken().then((value) {
      consolePrint("token is");
      consolePrint(value);
      consolePrint("token done");
      // HomeController.subsAll(value);
      // HomeController.postToken(value);
    });
//
    FirebaseMessaging.onBackgroundMessage((message) async {
      consolePrint("inside onbackground");
// int temp=await AuthServices.getNotificationsCount();
// temp++;
// consolePrint(temp.toString());
// await AuthServices.setNotificationsCount(temp);
      notificationNumberController.getCount();
      notificationNumberController.increaseCount();

      await notificationController.showNotification(
          message); //(message.notification.title, message.notification.body);
      // notificationController.saveNewNotification(message);
      // AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.INFO,
      //   animType: AnimType.BOTTOMSLIDE,
      //   title: message.notification.title,
      //   desc: message.notification.body,
      // )..show();
      // Get.snackbar(message.notification.title, message.notification.body);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      // notificationController.saveNewNotification(message);
      // AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.INFO,
      //   animType: AnimType.BOTTOMSLIDE,
      //   title: message.notification.title,
      //   desc: message.notification.body,
      // )..show();
      await notificationController.showNotification(
          message); //(message.notification.title, message.notification.body);
      // Get.snackbar(message.notification.title, message.notification.body);
    });

    getToken();
    // final  messaging = FirebaseMessaging.instance;
    //   messaging.getToken().then((value) {
    //     consolePrint("token is");
    //     consolePrint(value);
    //     consolePrint("token done");
    //     // HomeController.subsAll(value);
    //     // HomeController.postToken(value);
    //   });مبد
    //   messaging.onBackgroundMessage((message) async{
    //     print('Message data: ${message.data}');
    //     // await notificationController.showNotification(message.notification.title, message.notification.body);
    //     // notificationController.saveNewNotification(message);
    //     // AwesomeDialog(
    //     //   context: context,
    //     //   dialogType: DialogType.INFO,
    //     //   animType: AnimType.BOTTOMSLIDE,
    //     //   title: message.notification.title,
    //     //   desc: message.notification.body,
    //     // )..show();
    //     Get.snackbar(message.notification.title, message.notification.body);
    //   });
    //   FirebaseMessaging.onMessage.listen((RemoteMessage message)async {
    //     print('Got a message whilst in the foreground!');
    //     print('Message data: ${message.data}');
    //     // notificationController.saveNewNotification(message);
    //     // AwesomeDialog(
    //     //   context: context,
    //     //   dialogType: DialogType.INFO,
    //     //   animType: AnimType.BOTTOMSLIDE,
    //     //   title: message.notification.title,
    //     //   desc: message.notification.body,
    //     // )..show();
    //     // await notificationController.showNotification(message.notification.title, message.notification.body);
    //     Get.snackbar(message.notification.title, message.notification.body);
    //   });

    homeContext = context;
    bottomTabController = TabController(length: 5, vsync: this);
    customTitle = new CustomTitle();
  }

  restart() {
    Phoenix.rebirth(context);
  }

  out() {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  bool k = false;

  setk() {
    k = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return I18n(
      child: WillPopScope(
        onWillPop: () async {
          if (bottomTabController.index == 0) {
            await showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      title: Text(
                        'هل أنت متأكد ؟'.i18n,
                        // textDirection: TextDirection.rtl,
                        style: body3_18pt,
                      ),
                      content: Text(
                        'انت على وشك الخروج من التطبيق !'.i18n,
                        // textDirection: TextDirection.rtl,
                        style: body1_16pt,
                      ),
                      actions: [
                        TextButton(
                          child: Text(
                            'نعم'.i18n,
                          ),
                          onPressed: () async {
                            // language.changeLanguage();
                            consolePrint("inside yes");
                            setk();
                            Get.back();
                            // k=true;
// return true;

                            // await  LocalStorageService.prefs.clear();
                            // Get.offAll(SplashScreen());
                            // Navigator.popUntil(context, ModalRoute.withName('/'));
                          },
                        ),
                        TextButton(
                          child: Text('لا'.i18n),
                          onPressed: () {
                            Navigator.pop(context);
                            k = false;
                            // k= false;
                            // Navigator.pop(context);
                          },
                        )
                      ],
                    )));
            consolePrint(k.toString());
            return k;
          } else {
            bottomTabController.animateTo(0, curve: Curves.ease);
            return false;
          }
        },
        child: Scaffold(
// floatingActionButton: FloatingActionButton(onPressed: (){
//   getToken();
// },),
          drawer: CustomDrawer(
            home: true,
          ),
          body: Builder(
              builder: ((context) => SafeArea(
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.8,
                          child: Container(
                            height: SizeConfig.screenHeight,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "assets/images/home/custom_background.png"),
                            )),
                          ),
                        ),

                        ///background
                        Positioned(
                          top: 0,
                          left: 0,
                          child: CustomAppBar(open_drawer: () {
                            Scaffold.of(context).openDrawer();
                          }),
                        ),
                        Positioned(
                          top: getProportionateScreenHeight(95),
                          height: getProportionateScreenHeight(754),
                          width: SizeConfig.screenWidth,
                          child: TabBarView(
                            controller: bottomTabController,
                            children: [
                              HomeScreen(),
                              SelectDoctorView(),
                              SelectOrderView(),
                              SelectStoreView(),
                              SelectCornerView(),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child: CustomBottomBar(
                              controller: bottomTabController,
                            )),
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
