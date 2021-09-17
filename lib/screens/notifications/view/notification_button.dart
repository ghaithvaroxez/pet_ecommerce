import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:get/get.dart';
import '../controller/notification_controller.dart';
import 'notifications_screen.dart';
class NotificationButton extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}
NotificationNumberController notificationNumberController=Get.put(NotificationNumberController());

class _NotificationButtonState extends State<NotificationButton> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       if( gusetId==146)
       {
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
