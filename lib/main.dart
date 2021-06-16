// import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pets_ecommerce/screens/auth/model/contstants.dart';
import 'package:pets_ecommerce/screens/auth/view/login/login_screen.dart';
import 'package:pets_ecommerce/screens/auth/view/otp/otp_screen.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
import 'package:pets_ecommerce/screens/auth/view/splash/splash_screen.dart';
import 'package:pets_ecommerce/screens/error/view/error_view.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => App(), // Wrap your app
  //   ),
  // );
  runApp(
    App()// Wrap your app
  );
}
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
            // locale: DevicePreview.locale(context), // Add the locale here
            // builder: DevicePreview.appBuilder,
// home: RegisterScreen(UserType.user),// Add the builder here
//             home: OtpScreen(),
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


