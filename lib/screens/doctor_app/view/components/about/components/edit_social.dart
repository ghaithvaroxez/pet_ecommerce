import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets/screens/widgets/text_field.dart';
import '../../../../../../main.dart';
import '../translations/edit_social.i18n.dart';

List<String> types = ["فيسبوك".i18n, "انستغرام".i18n, "واتساب".i18n];

List<String> ReqTypes = ["facebook", "instagram", "phone"];

class EditSocialScreen extends StatefulWidget {
  Function editAction;
  Function deleteAction;
  TextEditingController link;
  TextEditingController type;

  @override
  _EditSocialScreenState createState() => _EditSocialScreenState();

  EditSocialScreen({this.editAction, this.deleteAction, this.link, this.type});
}

class _EditSocialScreenState extends State<EditSocialScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 3; i++)
      if (widget.type.text == ReqTypes[i]) widget.type.text = types[i];
  }

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
                                width: getProportionateScreenWidth(300),
                                alignment: Alignment.center,
                                height: getProportionateScreenHeight(28),
                                child: AutoSizeText(
                                  "تعديل معلومات التواصل الاجتماعي".i18n,
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
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15)),
                        alignment: appLocal == "ar"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: AutoSizeText(
                          "النوع".i18n, style: body1_16pt,
                          // textDirection: TextDirection.rtl,
                        )),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Container(
                      alignment: appLocal == "ar"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(right: 15, left: 15),
                          width: getProportionateScreenWidth(156),
                          height: getProportionateScreenHeight(45),
                          padding: EdgeInsets.only(
                              right: getProportionateScreenWidth(4)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 1, color: Colors.grey.withOpacity(0.6)),
                          ),
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: 15),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // value: controller.storeInfo.address,
                              // value: _value,
                              items: types.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                    width: getProportionateScreenWidth(100),
                                    height: getProportionateScreenHeight(45),
                                    child: AutoSizeText(
                                      item,

                                      // textDirection:
                                      // TextDirection.rtl,

                                      style: blackText_14pt,
                                      minFontSize: 9,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) async {
                                setState(() {
                                  widget.type.text = value;
                                });
                              },
                              hint: Text(widget.type.text),
                              elevation: 8,
                              style: blackText_14pt,
                              icon: Container(
                                  width: getProportionateScreenWidth(8),
                                  child: RotatedBox(
                                      quarterTurns: 90,
                                      child: Icon(Icons.arrow_drop_down))),
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.blue,
                              // isExpanded: true,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Container(
                      height: SizeConfig.screenHeight / 3,
                      width: SizeConfig.screenWidth,
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(15)),
                              alignment: appLocal == "ar"
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: AutoSizeText(
                                "الرابط".i18n, style: body1_16pt,
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
                                    border: Border.all(
                                        width: 1, color: borderColor)),
                                child: CustomTextField(
                                  textEditingController: widget.link,
                                  textInputType: TextInputType.text,
                                )),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                    onTap: () async {
                                      if (widget.link.text == "") {
                                        Get.rawSnackbar(
                                            message:
                                                "لم تقم باضافة رابط ".i18n);
                                        Get.back();
                                      } else if (widget.type.text == "") {
                                        Get.rawSnackbar(
                                            message:
                                                "لم تقم باختيار النوع ".i18n);
                                        Get.back();
                                      } else {
                                        Get.back();
                                        for (int i = 0; i < 3; i++)
                                          if (widget.type.text == types[i])
                                            widget.type.text = ReqTypes[i];
                                        await widget.editAction();
                                      }
                                    },
                                    child: Container(
                                      // width: getProportionateScreenWidth(170),
                                      height: getProportionateScreenHeight(56),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          gradient: blueGradient),
                                      child: Center(
                                        child: AutoSizeText(
                                          "حفظ ومتابعة ".i18n,
                                          style: blueButton_14pt,
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Expanded(
                                child: GestureDetector(
                                    onTap: () async {
                                      Get.back();
                                      await widget.deleteAction();
                                    },
                                    child: Container(
                                      // width: getProportionateScreenWidth(170),
                                      height: getProportionateScreenHeight(56),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              width: 1, color: borderColor)),
                                      child: Center(
                                        child: AutoSizeText(
                                          "حذف ".i18n,
                                          style: whiteButton_14pt,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
