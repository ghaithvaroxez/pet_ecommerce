import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';




class CustomeDraweritem extends StatelessWidget {
  String title;
  String img;
  bool isExpanded;
  bool isRed;
Function onTap;
  CustomeDraweritem({this.title, this.img, this.isExpanded=false,this.onTap,this.isRed=false});

  @override
  Widget build(BuildContext context) {
    return
    Container(
        alignment: Alignment.center,
        width: getProportionateScreenWidth(272),
        height: getProportionateScreenHeight(40),
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  // border: Border.all(color: Colors.red,width: 1),

),
        child:GestureDetector(

          onTap: onTap,
          child: Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(10),),

              Container(
                alignment: Alignment.center,
                width: getProportionateScreenWidth(16),
                height: getProportionateScreenHeight(20),
                child: Image.asset(img,fit: BoxFit.fill,),
              ),
              SizedBox(width: getProportionateScreenWidth(10),),
              Container(
                alignment: Alignment.centerRight,
                width: getProportionateScreenWidth(100),
                height: getProportionateScreenHeight(40),
                child: AutoSizeText(title,style: darkGrayText_14pt,),
              ),
              Spacer(),
              isExpanded?Row(
                children: [

                  AutoSizeText("10",style: darkGrayText_14pt,),
                  SizedBox(width: getProportionateScreenWidth(4),),
                  AutoSizeText("عروض",style: subtitle2_14pt,),
                  SizedBox(width: getProportionateScreenWidth(12),),
                  Directionality(textDirection: TextDirection.ltr,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.grey,
                      size: 16,
                    ),
                  ),


                ],
              ):Container(),
              SizedBox(width: getProportionateScreenWidth(22),),
            ],
          ),
        ),

    );
  }
}

