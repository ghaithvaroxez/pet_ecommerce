import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';


class UnApprovedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: getProportionateScreenWidth(350),
          height: getProportionateScreenHeight(350),
          child:   Lottie.asset('assets/images/auth/unAproved.json'),)
        ,SizedBox(height: getProportionateScreenHeight(25),),
         Container(width: getProportionateScreenWidth(400),child: AutoSizeText("تم ارسال طلبك بنجاح سوف تتمكن من الدحول عند الموافقة عليه ",style: h5_21pt,textDirection: TextDirection.rtl,),)

        ],
      ),
    );
  }
}
