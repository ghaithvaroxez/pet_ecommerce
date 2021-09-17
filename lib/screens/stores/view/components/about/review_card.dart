import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';

import '../../../../../main.dart';


class ReviewCad extends StatelessWidget {
  String comment;
  String name;
  int rate;
  String imagePath;
  ReviewCad(this.comment, this.name, this.rate,this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
      width: getProportionateScreenWidth(345),
      height: getProportionateScreenHeight(85),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: offWhite,
        boxShadow: shadow,
      ),
      child: Stack(
        children: [
          appLocal=="ar"?Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: getProportionateScreenHeight(85),
              width: getProportionateScreenWidth(70),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Image.network(imagePath==null?"":Api.imagePath+imagePath,fit: BoxFit.fill,),
              ),
            ),
          ):Positioned(
            left: 0,
            top: 0,
            child: Container(
              // color: Colors.red,
              height: getProportionateScreenHeight(85),
              width: getProportionateScreenWidth(70),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.network(imagePath==null?"":Api.imagePath+imagePath,fit: BoxFit.fill,),
              ),
            ),
          ),
          appLocal=="ar"?Positioned(
              right: getProportionateScreenWidth(83),
              child: Container(
                height: getProportionateScreenHeight(85),
                width: getProportionateScreenWidth(235),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(5),),
                    Container(
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(200),
                      child: AutoSizeText(
                        name==null?"":name,
                        style: body2_14pt,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(45),
                      width: getProportionateScreenWidth(200),
                      child:comment==null?Container(height: 0,width: 0,): AutoSizeText(
                        comment,
                        style: darkGrayText_11pt,
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              )):Positioned(
              left: getProportionateScreenWidth(83),
              child: Container(
                height: getProportionateScreenHeight(85),
                width: getProportionateScreenWidth(235),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(5),),
                    Container(
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(200),
                      child: AutoSizeText(
                        name==null?"":name,
                        style: body2_14pt,
                        // textDirection: TextDirection.rtl,
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(45),
                      width: getProportionateScreenWidth(200),
                      child:comment==null?Container(height: 0,width: 0,): AutoSizeText(
                        comment,
                        style: darkGrayText_11pt,
                        // textDirection: TextDirection.rtl,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              )),
          appLocal=="ar"?
          Positioned(
              left: getProportionateScreenWidth(8),
              top: getProportionateScreenHeight(10),
              child: Container(
                child: Row(
                  children: [
                    AutoSizeText(rate.toString(),style: darkGrayText_11pt,minFontSize: 8,),


                    SizedBox(width: getProportionateScreenWidth(2),),
                    Image.asset("assets/images/store/star_icon.png"),
                  ],
                ),
              ))
              :Positioned(
              right: getProportionateScreenWidth(8),
              top: getProportionateScreenHeight(10),
              child: Container(
                child: Row(
                  children: [



                    AutoSizeText(rate.toString(),style: darkGrayText_11pt,minFontSize: 8,),


                    SizedBox(width: getProportionateScreenWidth(2),),
                    Image.asset("assets/images/store/star_icon.png"),

                  ],
                ),
              ))
        ],
      ),
    );
  }
}
