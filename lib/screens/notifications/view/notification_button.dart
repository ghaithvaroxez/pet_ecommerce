import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/view/splash/login_or_register.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:get/get.dart';
import 'package:pets/services/local_storage_service.dart';
import '../controller/notification_controller.dart';
import 'notifications_screen.dart';
import 'package:pets/screens/home/view/components/translations/favorite_icon.i18n.dart';

class NotificationButton extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

NotificationNumberController notificationNumberController =
    Get.put(NotificationNumberController());

class _NotificationButtonState extends State<NotificationButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gusetId == 146) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    title: Text(
                      'يجب عليك تسجيل حساب اولاً '.i18n,
                      textDirection: appLocal == "ar"
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      style: body3_18pt,
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          'العودة'.i18n,
                          style: GoogleFonts.tajawal(
                              color: Colors.red.withOpacity(0.6)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          return;
                          // Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text(
                          'تسجيل حساب'.i18n,
                          style: GoogleFonts.tajawal(
                              color: Colors.blue.withOpacity(0.6)),
                        ),
                        onPressed: () async {
                          Get.back();
                          await LocalStorageService.prefs.clear();
                          Get.offAll(LoginOrRegister());
                          return;
                        },

                        // language.changeLanguage();
                        // Navigator.of(context).pop();
                        // await  LocalStorageService.prefs.clear();
                        // Get.offAll(SplashScreen());
                        // Navigator.popUntil(context, ModalRoute.withName('/'));
                      ),
                    ],
                  )));
          return;
        }
        Get.to(NotificationScreen());
      },
      child: Container(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            GestureDetector(
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade50,
                child: Image.asset(
                  "assets/images/home/notification_icon.png",
                  height: 24,
                  width: 20,
                ),
              ),
            ),
            // GetBuilder<NotificationNumberController>(
            //   init: notificationNumberController,
            //   builder:(controller)=> appLocal=="ar"?Positioned(left:-2,top:-2,child: CircleAvatar(
            //     radius: 8,
            //     backgroundColor: Colors.red,
            //     child: AutoSizeText(controller.count.toString(),style: TextStyle(color: Colors.white),),
            //   ))
            //       : Positioned(right:-2,top:-2,child: CircleAvatar(
            //     radius: 8,
            //     backgroundColor: Colors.red,
            //     child: AutoSizeText(controller.count.toString(),style: TextStyle(color: Colors.white),),
            //   )),
            // ),
          ],
        ),
      ),
    );
  }
}
