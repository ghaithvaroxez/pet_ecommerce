import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pets_ecommerce/screens/auth/view/auth_0.dart';
import 'package:pets_ecommerce/screens/auth/view/auth_1.dart';
import 'package:pets_ecommerce/screens/auth/view/auth_2.dart';
import 'package:pets_ecommerce/screens/auth/view/auth_3.dart';
import 'package:pets_ecommerce/screens/home/view/home_view.dart';
import 'configuration/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:SplashScreen(),
      // home:WelcomeScreen(),
      // home:SignUpTypeScreen(),
      // home:PhonAuthScreen(),
      home:HomeScreen(),


    );
  }
}
