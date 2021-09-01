import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/gradient.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';


class AuthButton extends StatelessWidget {
  final bool color;
  final String title;
  final String image;
  final Function ontap;

  const AuthButton({Key key, this.color, this.title, this.image="", this.ontap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: TextButton(
        onPressed: ontap,
        child: Container(
          height: getProportionateScreenHeight(56),
          // width: getProportionateScreenWidth(361),
          decoration: BoxDecoration(
              gradient: color?blueGradient:whiteGradient,
              borderRadius: BorderRadius.circular(28),
          border: Border.all(width: color?0:0.7,color: borderColor)),
          child: image!=""?Row(

            children: [
              SizedBox(width: getProportionateScreenWidth(22),),

              Container(margin: EdgeInsets.symmetric(vertical: 0,),child:   image!=""?Image.asset(image,height: getProportionateScreenHeight(20),width: getProportionateScreenWidth(20),):Container(),),

              SizedBox(width: getProportionateScreenWidth(SizeConfig.screenWidth/2-75),),

              Text(title,style: color?blueButton_14pt:subtitle2_14pt,textAlign: TextAlign.center,textDirection: TextDirection.rtl,),

            ],
          ):Center(child:  Text(title,style: color?blueButton_14pt:subtitle2_14pt,textAlign: TextAlign.center,textDirection: TextDirection.rtl,),),
        ),
      ),
    );
  }
}
