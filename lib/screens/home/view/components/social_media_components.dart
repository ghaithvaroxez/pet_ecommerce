import 'package:flutter/material.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:get/get.dart';


class SocialMedia extends StatelessWidget {
  String wa;
  String fb;
  String ins;
bool freez=false;
bool e;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: getProportionateScreenWidth(24),
          width: getProportionateScreenWidth(98),
          // alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12)),
            color: Colors.white.withOpacity(0.6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              freez?Image.asset("assets/images/home/whatsapp.png"):GestureDetector(onTap: () async {
                // await FlutterLaunch.launchWathsApp(phone: wa,);
                var whatsappUrl ="whatsapp://send?phone=$wa";
                await canLaunch(whatsappUrl)? launch(whatsappUrl)
                    :
                Get.rawSnackbar(message: "عذرا لا يوجد رابط !",);
              },child: Image.asset("assets/images/home/whatsapp.png")),
              SizedBox(
                width: 5,
              ),
              freez?Image.asset("assets/images/home/facebook.png"):   GestureDetector(onTap: ()async {

      if (await canLaunch(fb)) {
        await launch(fb);
      } else {
       Get.rawSnackbar(message: "عذرا لا يوجد رابط !",);
      }
    },child: Image.asset("assets/images/home/facebook.png")),
              SizedBox(
                width: 5,
              ),
              freez?Image.asset("assets/images/home/instagram.png"):   GestureDetector(onTap: ()async{

                if (await canLaunch(ins)) {
                await launch(ins);
                } else {
                Get.rawSnackbar(message: "عذرا لا يوجد رابط !",);
                }

              },child: Image.asset("assets/images/home/instagram.png")),
            ],
          ),
        ),
      ],
    );
  }

  SocialMedia({this.wa, this.fb, this.ins,this.freez=false});
}
