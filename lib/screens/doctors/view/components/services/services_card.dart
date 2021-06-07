import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/view/components/favorite_icon.dart';


class DoctorServicesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: getProportionateScreenWidth(16),right:getProportionateScreenWidth(16),bottom: getProportionateScreenHeight(16)),
      width: getProportionateScreenWidth(163),
      height: getProportionateScreenHeight(160),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            // left: getProportionateScreenWidth(25),
              child: Container(
                height: getProportionateScreenHeight(135),
                width: getProportionateScreenWidth(163),

                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    "assets/images/doctors/doctor_services_cat.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Positioned(
              top: getProportionateScreenHeight(120),
              child: Container(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(162.7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "فحص شامل للقطط",
                      style: body2_14pt,
                    )),
              )),
          Positioned(
              left: getProportionateScreenWidth(25),
              top: getProportionateScreenHeight(8),
              child: FavoriteIcon())
        ],
      ),
    );
  }
}
