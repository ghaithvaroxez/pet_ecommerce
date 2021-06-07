import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
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
                    width: getProportionateScreenWidth(36),
                    height: getProportionateScreenHeight(24),
                    child: AutoSizeText(
                      "النوع",
                      textDirection: TextDirection.rtl,
                      style: body3_18pt,
                    )),
                Spacer(),
                Container(
                    width: getProportionateScreenWidth(36),
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
          SizedBox(height: getProportionateScreenHeight(16),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            ],
          )
        ],
      ),
    );
  }
}
