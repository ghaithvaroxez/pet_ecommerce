import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';

import 'package:pets/screens/filter/view/components/location_drop_down_button.dart';
import 'package:pets/screens/filter/controller/type_controller.dart';
import 'package:pets/screens/filter/view/components/type_card.dart';
import 'components/type_drop_down_button.dart';

class CustomBottomSheet extends StatelessWidget {
  FilterType _filterType = Get.put(FilterType());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        height: getProportionateScreenHeight(651),
        width: getProportionateScreenWidth(392),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: getProportionateScreenHeight(26),
                  width: getProportionateScreenWidth(56),
                  child: Image.asset("assets/images/bottom_sheet/grey_bar.png"),
                )
              ],
            ),
            Container(
              height: getProportionateScreenHeight(30),
              child: Row(
                children: [
                  Container(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(24),
                    child: AutoSizeText(
                      "النوع",
                      textDirection: TextDirection.rtl,
                      style: body3_18pt,
                    ),
                  ),
                  Spacer(),
                  Container(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(24),
                      child: AutoSizeText(
                        "المدينة",
                        textDirection: TextDirection.rtl,
                        style: body3_18pt,
                      )),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TypeDropDownButton(),
                LocationDropDownButton(),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            Row(
              children: [
                Container(
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenWidth(150),
                  child: Text(
                    "الصنف",
                    style: body3_18pt,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            GetBuilder<FilterType>(
// init: _filterType,
                builder: (controller) {
              return Container(
                height: getProportionateScreenHeight(50),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.types.length,
                  itemBuilder: (context, index) => TypeCard(
                    title: controller.types[index].type,
                    callback: controller.changeType(index),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
