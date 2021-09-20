import 'package:flutter/material.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:get/get.dart';
import 'translations/social_media_component.i18n.dart';

class SocialMedia extends StatelessWidget {
  String wa;
  String fb;
  String ins;
  bool freez = false;
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
            borderRadius: appLocal == "en"
                ? BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))
                : BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
            color: Colors.white.withOpacity(0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              freez
                  ? Image.asset("assets/images/home/whatsapp.png")
                  : GestureDetector(
                      onTap: () async {
                        if (wa == null) {
                          Get.rawSnackbar(
                            message: "عذرا لا يوجد رقم هاتف !".i18n,
                            backgroundColor: Colors.blueGrey.withOpacity(0.8),
                          );
                          return;
                        }
                        // await FlutterLaunch.launchWathsApp(phone: wa,);
                        var whatsappUrl = "whatsapp://send?phone=$wa";
                        if (await canLaunch(whatsappUrl))
                          launch(whatsappUrl);
                        else {
                          consolePrint("can't launch facebook");
                          Get.rawSnackbar(
                            message: "عذراً يوجد مشكلة في الرقم".i18n,
                            backgroundColor: Colors.blueGrey.withOpacity(0.8),
                          );
                        }
                      },
                      child: Image.asset("assets/images/home/whatsapp.png")),
              SizedBox(
                width: 5,
              ),
              freez
                  ? Image.asset("assets/images/home/facebook.png")
                  : GestureDetector(
                      onTap: () async {
                        if (fb == null) {
                          Get.rawSnackbar(
                            message: "عذرا لا يوجد رابط !".i18n,
                            backgroundColor: Colors.blueGrey.withOpacity(0.8),
                          );
                          return;
                        }
                        String url =
                            fb.contains("http://") ? fb : "http://" + fb;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          consolePrint("can't launch $url");
                          Get.rawSnackbar(
                            message: "عذراً يوجد مشكلة في الرابط".i18n,
                            backgroundColor: Colors.blueGrey.withOpacity(0.8),
                          );
                        }
                      },
                      child: Image.asset("assets/images/home/facebook.png")),
              SizedBox(
                width: 5,
              ),
              freez
                  ? Image.asset("assets/images/home/instagram.png")
                  : GestureDetector(
                      onTap: () async {
                        if (ins == null) {
                          Get.rawSnackbar(
                            message: "عذرا لا يوجد رابط !".i18n,
                            backgroundColor: Colors.blueGrey.withOpacity(0.8),
                          );
                          return;
                        }

                        String url =
                            ins.contains("http://") ? ins : "http://" + ins;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          consolePrint("can't launch instagram");
                          Get.rawSnackbar(
                            message: "عذراً يوجد مشكلة في الرابط".i18n,
                            backgroundColor: Colors.blueGrey.withOpacity(0.8),
                          );
                        }
                      },
                      child: Image.asset("assets/images/home/instagram.png")),
            ],
          ),
        ),
      ],
    );
  }

  SocialMedia({this.wa, this.fb, this.ins, this.freez = false});
}
