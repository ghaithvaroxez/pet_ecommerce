import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/widgets/text_field.dart';
import '../translations/edit_info_screen.i18n.dart';

class EditInfoScreen extends StatelessWidget {
  String title;
  Function action;
  TextEditingController t1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: getProportionateScreenHeight(750),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Material(
                    elevation: 5,
                    color: Colors.white,
                    child: Container(
                        width: SizeConfig.screenWidth,
                        height: getProportionateScreenHeight(95),
                        child: Row(
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(24),
                            ),
                            Spacer(),
                            Container(
                                height: getProportionateScreenHeight(28),
                                child: AutoSizeText(
                                  title,
                                  style: h5_21pt,
                                  minFontSize: 8,
                                )),
                            Spacer(),
                            SizedBox(
                              width: getProportionateScreenWidth(24),
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Container(
                  height: SizeConfig.screenHeight / 3,
                  width: SizeConfig.screenWidth,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          alignment: appLocal == "ar"
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: AutoSizeText(
                            "المعلومات المهنية".i18n, style: body1_16pt,
                            // textDirection: TextDirection.rtl,
                          )),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: borderColor)),
                            child: CustomTextField(
                              textEditingController: t1,
                              textInputType: TextInputType.text,
                            )),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () async {
                            if (t1.text == "") {
                              Get.rawSnackbar(message: "ادخل الوصف اولاً".i18n);
                              Get.back();
                            } else {
                              Get.back();
                              await action();
                            }
                          },
                          child: Container(
                            // width: getProportionateScreenWidth(170),
                            height: getProportionateScreenHeight(56),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: blueGradient),
                            child: Center(
                              child: AutoSizeText(
                                "حفظ ومتابعة ".i18n,
                                style: blueButton_14pt,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  EditInfoScreen({this.title, this.action, this.t1});
}
