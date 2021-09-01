import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/doctors/view/doctor_details.dart';
import 'package:pets_ecommerce/screens/home/view/components/favorite_icon.dart';
import 'package:pets_ecommerce/screens/home/view/components/open_now_coponent.dart';
import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';
import '../../model/all_doctors.dart';
class VerticalDoctorListCard extends StatelessWidget {
  Doctor doctor;
  Function fav;
  VerticalDoctorListCard(this.doctor,this.fav);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DoctorDetailsPage(doctor.id));
      },
      child: Container(
        height: getProportionateScreenHeight(128),
        width: getProportionateScreenWidth(345),
        margin: EdgeInsets.only(
            left: getProportionateScreenWidth(24),
            right: getProportionateScreenWidth(24),
            bottom: getProportionateScreenHeight(25)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: borderColor),
          boxShadow: shadow,
          color: backgroundGrey,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: getProportionateScreenHeight(127),
                width: getProportionateScreenWidth(154),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  // color: Colors.red
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  child:doctor.image!=null?
                      Image.network(Api.imagePath+doctor.image,fit: BoxFit.fill,): Image.asset(
                    "assets/images/doctors/femal_doctor_details_image.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            ///image


            Positioned(
              right: getProportionateScreenWidth(171),
              top: getProportionateScreenHeight(20),
              bottom: getProportionateScreenHeight(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  doctor.firstName!=null&&doctor.lastName!=null? Container(
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(150),
                    child: AutoSizeText(
                      doctor.firstName+" "+doctor.lastName,
                      style: body3_18pt,
                    ),
                  ):Container(height: 0,),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/home/clock_icon.png",
                        height: getProportionateScreenHeight(12),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Container(
                        width: getProportionateScreenWidth(120),
                        child: Row(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(20),
                              // width: getProportionateScreenWidth(120),
                              child: AutoSizeText(
                                "${doctor.openFrom} ",textDirection: TextDirection.ltr,
                                style: body3_18pt,
                                minFontSize: 10,
                              ),
                            ),
                            Container(
                              height: getProportionateScreenHeight(20),
                              // width: getProportionateScreenWidth(120),
                              child: AutoSizeText(
                                "-",
                                style: body3_18pt,
                                minFontSize: 10,
                              ),
                            ),
                            Container(
                              height: getProportionateScreenHeight(20),
                              // width: getProportionateScreenWidth(120),
                              child: AutoSizeText(
                                "${doctor.closedAt} ",textDirection: TextDirection.ltr ,
                                style: body3_18pt,
                                minFontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/home/location_icon.png",
                        height: getProportionateScreenHeight(12),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Container(
                        height: getProportionateScreenHeight(18),
                        width: getProportionateScreenWidth(120),
                        child: AutoSizeText(
                          doctor.district,
                          style: body3_18pt,
                          minFontSize: 10,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),

            Positioned(
              bottom: getProportionateScreenHeight(4),
              left: getProportionateScreenWidth(4),
              child: SocialMedia(freez: true,),
            ),///social media

            ///social media
            Positioned(
              // width: getProportionateScreenWidth(15),
              // height: getProportionateScreenHeight(15),
              left:getProportionateScreenWidth(15),
              top: getProportionateScreenHeight(15),
              child: FavoriteIcon(fav: fav,s: doctor.favStatus,),
            ),
          ],
        ),
      ),
    );
  }
}
