import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/doctors/view/doctor_details.dart';

import 'package:pets/screens/home/view/components/favorite_icon.dart';
import 'package:pets/screens/home/view/components/social_media_components.dart';
import 'package:pets/screens/doctors/model/all_doctors.dart';
import 'package:get/get.dart';
class DoctorCard extends StatefulWidget {
  Doctor doctor;
  Function fav;
  DoctorCard(this.doctor,this.fav);

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  String fb,wa,ins;
  bool bfb=true,bwa=true,bins=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i =0; i<widget.doctor.doctorContacts.length;i++)
    {
      if( widget.doctor.doctorContacts[i].type=="facebook"&&bfb==true)
      {
        fb= widget.doctor.doctorContacts[i].link;
        bfb=false;
      }
      else if( widget.doctor.doctorContacts[i].type=="phone"&&bwa==true)
      {
        wa= widget.doctor.doctorContacts[i].link;
        bwa=false;
      }
      else if ( widget.doctor.doctorContacts[i].type=="instagram"&&bins==true)
      {
        ins= widget.doctor.doctorContacts[i].link;
        bins=false;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(DoctorDetailsPage(widget.doctor.id));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        width: getProportionateScreenWidth(161),
        height: getProportionateScreenHeight(230),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3, color: borderColor),
            color: Colors.white),
        child: Stack(
          children: [

            Positioned(
                height: getProportionateScreenHeight(190),
                width: getProportionateScreenWidth(160),
                bottom: getProportionateScreenHeight(40),
                child: widget.doctor.image==""||widget.doctor.image==null?Image.asset(
                  "assets/images/home/female_doctor.png",
                  fit: BoxFit.fitHeight,
                ):ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    Api.imagePath+widget.doctor.image,
                    fit: BoxFit.fill,
                  ),
                )),///doctor_image
            Positioned(
                top: getProportionateScreenHeight(150),
                child: Container(
                  height: getProportionateScreenHeight(80),
                  width: getProportionateScreenWidth(160.7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    color: Colors.grey.shade200,
                    // color: Colors.red,
                  ),
                  child: Container(
                    height: getProportionateScreenHeight(80),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Container
                          (height: (getProportionateScreenHeight(40)),width: getProportionateScreenWidth(120),
                         alignment: Alignment.center, child: AutoSizeText(
                            widget.doctor.firstName + " "+widget.doctor.lastName,
                            maxLines: 1,
                            minFontSize: 9,
                            style: h6_20pt,
                          ),
                        ),
                        // Container(
                        //   height: getProportionateScreenHeight(30),
                        //   child: Row(
                        //     children: [
                        //       Spacer(),
                        //       SocialMedia(),
                        //       // Spacer(),
                        //       // SizedBox(width: getProportionateScreenWidth(5),),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )),///grey footer
              Positioned(
                        bottom: getProportionateScreenHeight(4),
                        left: getProportionateScreenWidth(4),
                        child: SocialMedia(wa: wa,fb: fb,ins: ins,),
                      ),///social media
            // Positioned(
            //   right: getProportionateScreenWidth(10),
            //   top: getProportionateScreenHeight(8),
            //   child: Container(
            //     height: getProportionateScreenHeight(14),
            //     width: getProportionateScreenWidth(15),
            //     child: IconButton(
            //       icon: Icon(
            //         Icons.share_outlined,
            //         size: 22,
            //       ),
            //     ),
            //   ),
            // ),///share icon
            Positioned(
              left: getProportionateScreenWidth(25),
              top: getProportionateScreenHeight(8),
              child:FavoriteIcon(s: widget.doctor.favStatus,fav: widget.fav,),
            ),///favorite icon

          ],
        ),
      ),
    );
  }
}
