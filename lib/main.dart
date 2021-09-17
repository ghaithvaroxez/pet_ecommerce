// import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/contstants.dart';
import 'package:pets/screens/auth/view/login/login_screen.dart';
import 'package:pets/screens/auth/view/otp/otp_screen.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/auth/view/splash/splash_screen.dart';
import 'package:pets/screens/doctors/view/doctor_details.dart';
import 'package:pets/screens/error/view/error_view.dart';
import 'package:pets/screens/home/view/home_view.dart';
import 'package:pets/screens/main_screen/view/main_view.dart';
import 'package:pets/screens/vendor_app/view/vendor_details_screen.dart';
import 'package:pets/screens/doctor_app/view/doctor_details_screen.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:pets/services/local_storage_service.dart';
import 'configuration/PushNotificationService.dart';
// import 'configuration/notification/controller/notification_controller.dart';
import 'configuration/notification/controller/notification_controller.dart';
import 'configuration/printer.dart';
import 'translations/codegen_loader.g.dart';
import 'package:pets/screens/notifications/view/notification_button.dart';
import 'package:get/get.dart';


Future<void> _firebaseMessagingBackgroundHandler( message) async {
  // print("onBackground: $message");
  // print('${message['data']}');
  // await notificationController.showNotification(message['title'], message['body']);
 consolePrint("inside background handling");
 await LocalStorageService.getPrefs();
  notificationNumberController.getCount();
  notificationNumberController.increaseCount();

  await notificationController.showNotification(message);//(message.notification.title, message.notification.body);

  // print("================================/nHandling a background message: ${message.messageId}/n============================================");
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await LocalStorageService.getPrefs();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


//   FirebaseMessaging.onBackgroundMessage((message) async{
//     consolePrint("inside onbackground");
// // int temp=await AuthServices.getNotificationsCount();
// // temp++;
// // consolePrint(temp.toString());
// // await AuthServices.setNotificationsCount(temp);
//     notificationNumberController.getCount();
//     notificationNumberController.increaseCount();
//
//     await notificationController.showNotification(message.notification.title, message.notification.body);
//     notificationController.saveNewNotification(message);
//     // AwesomeDialog(
//     //   context: context,
//     //   dialogType: DialogType.INFO,
//     //   animType: AnimType.BOTTOMSLIDE,
//     //   title: message.notification.title,
//     //   desc: message.notification.body,
//     // )..show();
//     // Get.snackbar(message.notification.title, message.notification.body);
//   });
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => App(), // Wrap your app
  //   ),
  // );
  await LocalStorageService.getPrefs();


  runApp(
      EasyLocalization(
          path: 'assets/translations',
          supportedLocales: [
            Locale("en"),
            Locale("ar")
          ],
          fallbackLocale: Locale('en'),
          assetLoader: CodegenLoader(),
          child: Phoenix(child  : App()))// Wrap your app
  );
}
String appLocal="en";
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    appLocal=AuthServices.getLocale();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: "Pets",
            theme: ThemeData(
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.white,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                hourMinuteShape: CircleBorder(),
              ),
            ),
            // localizationsDelegates: [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: [
            //    Locale('en'),
            //    Locale('ar'),
            // ],
            // locale: DevicePreview.locale(context), // Add the locale here
            // builder: DevicePreview.appBuilder,
// home: RegisterScreen(UserType.user),// Add the builder here
//             home: VendorDetailsPage(),
//             home: DoctorAppDetailsPage(),

            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: Locale(appLocal),
            home: SplashScreen(),
// home:WelcomqeScreen(),
// home:SignUpTypeScreen(),
// home:PhonAuthScreen(),
// home:HomeScreen(),
// home:MainScreen(),
// home:StoreDetailsPage(),
// home: ProductsBodyScreen(),
// home: AboutStoreBodyScreen(),
// home: SelectDoctorView(),
// home: FavoriteView(),
// home: VendorDetailsPage(),
// home: BL(),
//           home: SplashScreen(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder,
      // home: RegisterScreen(UserType.user),// Add the builder here
      home: OtpScreen(),
      // home:WelcomqeScreen(),
      // home:SignUpTypeScreen(),
      // home:PhonAuthScreen(),
      // home:HomeScreen(),
      // home:MainScreen(),
      // home:StoreDetailsPage(),
      // home: ProductsBodyScreen(),
// home: AboutStoreBodyScreen(),
// home: SelectDoctorView(),
// home: FavoriteView(),
    );
  }
}

class BL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      // textDirection: TextDirection.rtl,
      child: Container(
        child: VendorDetailsPage(),
      ),
    );
  }
}

