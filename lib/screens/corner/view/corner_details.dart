import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';


class CornerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(270),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: shadow,
                  ),
                  child: Image.asset(
                    "assets/images/home/shop_image.png",
                    fit: BoxFit.fill,
                  ),
                )),

            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(270),
                child: Container(
                  child: Image.asset(
                    "assets/images/store/black_layer.png",
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
              top: getProportionateScreenHeight(34),
              left: getProportionateScreenWidth(24),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: getProportionateScreenWidth(48),
                  height: getProportionateScreenHeight(48),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
                top: getProportionateScreenHeight(190),

                right:getProportionateScreenWidth(15),
                height: getProportionateScreenHeight(35),
                child: Container(
                  height: getProportionateScreenHeight(35),
                  width: getProportionateScreenWidth(150),

                  child: AutoSizeText("احمد العمودي",style: blueButton_25pt,),

                )),

            Positioned(
                top: getProportionateScreenHeight(305),

                right:getProportionateScreenWidth(15),
                height: getProportionateScreenHeight(505),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(345),

                        child: AutoSizeText("عنوان الزاوية",textDirection: TextDirection.rtl,style: h6_20pt,),

                      ),
                      SizedBox(height: getProportionateScreenHeight(20),),
                    Container(
                      width: getProportionateScreenWidth(345),
                      alignment: Alignment.center,
                      child: AutoSizeText("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق"
                       ,
                          textDirection: TextDirection.rtl,
                          style: darkGrayText_16pt,),
                    ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          alignment: Alignment.center,
                          height: 130,
                          width: getProportionateScreenWidth(340),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            itemBuilder: (context,index)=>Container(width: getProportionateScreenWidth(105),child: Image.asset("assets/images/profile/corner_image.png",fit: BoxFit.fill,),),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20),),
                      Container(
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(345),

                        child: AutoSizeText("الزوايا السابقة",textDirection: TextDirection.rtl,style: h6_20pt,),

                      ),
                      SizedBox(height: getProportionateScreenHeight(20),),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          alignment: Alignment.center,
                          height: 130,
                          width: getProportionateScreenWidth(340),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            itemBuilder: (context,index)=>Container(width: getProportionateScreenWidth(105),child: Image.asset("assets/images/profile/corner_image.png",fit: BoxFit.fill,),),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
