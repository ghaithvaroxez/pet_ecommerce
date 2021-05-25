import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pets_ecommerce/screens/auth/view/auth_0.dart';
import 'package:pets_ecommerce/screens/auth/view/auth_1.dart';
import 'package:pets_ecommerce/screens/auth/view/auth_2.dart';
import 'package:pets_ecommerce/screens/auth/view/auth_3.dart';
import 'package:pets_ecommerce/screens/home/view/home_view.dart';
import 'package:pets_ecommerce/screens/main_screen/view/main_view.dart';
import 'package:pets_ecommerce/screens/stores/view/components/store_details_body.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/stores/view/store_details.dart';
import 'configuration/size_config.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
  // runApp(
  //   MyApp()// Wrap your app
  // );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
      // home:SplashScreen(),
      // home:WelcomqeScreen(),
      // home:SignUpTypeScreen(),
      // home:PhonAuthScreen(),
      // home:HomeScreen(),
      // home:MainScreen(),
      // home:StoreDetailsPage(),
        home:StoreDetailsBody(),
    );
  }
}