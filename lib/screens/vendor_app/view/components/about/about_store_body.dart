import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/gradient.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';

import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';
import 'package:pets_ecommerce/screens/stores/view/components/about/review_card.dart';

class AboutStoreBodyScreen extends StatefulWidget {
  @override
  _AboutStoreBodyScreenState createState() => _AboutStoreBodyScreenState();
}

class _AboutStoreBodyScreenState extends State<AboutStoreBodyScreen> {
  List<String> location_items = [
    "القدس",
    "رام الله",
    "القدس",
    "رام الله",
    "القدس",
    "رام الله",
    "القدس",
    "رام الله",
    "القدس",
  ];
  String location = "القدس";
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(24),
              vertical: getProportionateScreenHeight(26)),
          child: ListView(
            children: [
              Row(
                children: [
                  AutoSizeText(
                    "Pets Carival",
                    style: h5_25pt,
                    minFontSize: 16,
                  ),
                  Spacer(),
                ],
              ),
Container(
  height: getProportionateScreenHeight(60),
  child: Row(
    children: [
      Container(
        alignment: Alignment.centerRight,
        child: Container(
            width: getProportionateScreenWidth(156),
            height:
            getProportionateScreenHeight(45),
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(6),
              border: Border.all(
                  width: 1,
                  color:
                  Colors.grey.withOpacity(0.6)),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 15),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                // value: _value,
                items: location_items
                    .map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      textDirection:
                      TextDirection.rtl,
                      style: blackText_14pt,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
                hint: Text(location),
                elevation: 8,
                style: blackText_14pt,
                icon: RotatedBox(quarterTurns:90,child: Icon(Icons.arrow_drop_down)),
                iconDisabledColor: Colors.black,
                iconEnabledColor: Colors.blue,
                // isExpanded: true,
              ),
            )),
      ),
      Spacer(),
      Container(height: getProportionateScreenHeight(30),width: getProportionateScreenWidth(30),child: Image.asset("assets/images/home/location_icon.png"),),

    ],
  ),
),
              ///location
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              Container(
                height: getProportionateScreenHeight(30),
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    AutoSizeText(
                      "مواعيد العمل",
                      minFontSize: 14,
                      style: body3_18pt,
                      maxLines: 1,
                    ),
                    Spacer(),
                    AutoSizeText(
                      "تعديل",
                      minFontSize: 14,
                      style: darkGrayText_14pt_underlined,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

              ///مواعيد العمل
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              Row(
                children: [


                  Container(
                    height: getProportionateScreenHeight(20),
                    alignment: Alignment.bottomCenter,
                    child: AutoSizeText(
                      "اضف  مواعيد العمل لديك",
                      maxLines: 1,
                      style: darkGrayText_14pt,
                      minFontSize: 10,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(30),
                    child: Image.asset(
                      "assets/images/vendor_app/clender.png",
                      height: getProportionateScreenHeight(12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),

              Column(
                children: [
                  Container(
                    height: getProportionateScreenHeight(30),
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        AutoSizeText(
                          "معلومات التواصل",
                          minFontSize: 14,
                          style: body3_18pt,
                          maxLines: 1,
                        ),
                        Spacer(),
                        AutoSizeText(
                          "تعديل",
                          minFontSize: 14,
                          style: darkGrayText_14pt_underlined,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
SizedBox(height: getProportionateScreenHeight(15),),
                  Container(
                    height: getProportionateScreenHeight(50),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                 child: Row(
                   children: [
                     SizedBox(width: getProportionateScreenWidth(15),),
                     AutoSizeText("رقم الهاتف الجوال",style: darkGrayText_11pt,)  ,
                     Spacer(),
                     Container(
                       alignment: Alignment.center,
                       height: getProportionateScreenHeight(30),
                       width: getProportionateScreenWidth(30),
                       child: Image.asset("assets/images/vendor_app/pen.png"),
                     ),
                   ],
                 ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(8),),
                  Container(
                    height: getProportionateScreenHeight(50),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                 child: Row(
                   children: [
                     SizedBox(width: getProportionateScreenWidth(15),),
                     AutoSizeText("حساب الفيسبوك",style: darkGrayText_11pt,)  ,
                     Spacer(),
                     Container(
                       alignment: Alignment.center,
                       height: getProportionateScreenHeight(30),
                       width: getProportionateScreenWidth(30),
                       child: Image.asset("assets/images/vendor_app/pen.png"),
                     ),
                   ],
                 ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(8),),
                  Container(
                    height: getProportionateScreenHeight(50),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                 child: Row(
                   children: [
                     SizedBox(width: getProportionateScreenWidth(15),),
                     AutoSizeText("حساب الانستغرام",style: darkGrayText_11pt,)  ,
                     Spacer(),
                     Container(
                       alignment: Alignment.center,
                       height: getProportionateScreenHeight(30),
                       width: getProportionateScreenWidth(30),
                       child: Image.asset("assets/images/vendor_app/pen.png"),
                     ),
                   ],
                 ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(8),),
                  Container(
                    height: getProportionateScreenHeight(50),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                 child: Row(
                   children: [
                     SizedBox(width: getProportionateScreenWidth(15),),
                     AutoSizeText("الايميل  الالكتروني",style: darkGrayText_11pt,)  ,
                     Spacer(),
                     Container(
                       alignment: Alignment.center,
                       height: getProportionateScreenHeight(30),
                       width: getProportionateScreenWidth(30),
                       child: Image.asset("assets/images/vendor_app/pen.png"),
                     ),
                   ],
                 ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  Container(
                    height: getProportionateScreenHeight(30),
                    alignment: Alignment.centerRight,
                    child: AutoSizeText(
                      "وصف للمتجر",
                      minFontSize: 14,
                      style: body3_18pt,
                      maxLines: 1,
                    ),
                  ),
SizedBox(height: getProportionateScreenHeight(15),),
                  Container(
                    height: getProportionateScreenHeight(50),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                    Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: getProportionateScreenHeight(30),
                          width: getProportionateScreenWidth(30),
                          child: Image.asset("assets/images/vendor_app/pen.png"),
                        ),
                      ],
                    ),
                  ),

SizedBox(height: getProportionateScreenHeight(20),),
                  Container(
                    height: getProportionateScreenHeight(30),
                    alignment: Alignment.centerRight,
                    child: AutoSizeText(
                      "شعار المتجر",
                      minFontSize: 14,
                      style: body3_18pt,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20),),
                  Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/vendor_app/upload_photo.png",
                          height: getProportionateScreenHeight(75),
                          width: getProportionateScreenWidth(125),
                        ),
                      ),
                      Center(
                          child: Container(
                            height: getProportionateScreenHeight(20),
                            width: getProportionateScreenWidth(80),
                            child: AutoSizeText(
                              "حمل الصورة",
                              style: body1_16pt,
                              maxLines: 1,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(30),),
                  GestureDetector(
                      onTap: () {
                    },
                      child: Container(
                        // width: getProportionateScreenWidth(170),
                        height: getProportionateScreenHeight(56),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: blueGradient),
                        child: Center(
                          child: AutoSizeText(
                            "حفظ ومتابعة ",
                            style: blueButton_14pt,
                          ),
                        ),
                      )),
                ],
              ),
                 ],
          ),
        ),
      );
  }
}
