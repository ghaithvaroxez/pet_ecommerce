import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/doctor_app/model/doctor.dart';
import 'package:pets/screens/home/view/components/favorite_icon.dart';
import 'package:get/get.dart';
import '../services/service_details_screen.dart';

class DoctorServicesCard extends StatelessWidget {
  DoctorService doctorService;

  DoctorServicesCard(this.doctorService);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DoctorServiceDetailsPage(doctorService));
      },
      child: Container(
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
                child: Image.network(
                  Api.imagePath + doctorService.image,
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
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(150.7),
                      child: AutoSizeText(
                        doctorService.name,
                        style: body2_14pt,
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
