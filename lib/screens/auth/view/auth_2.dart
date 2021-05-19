import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/auth/view/components/auth_button.dart';

class SignUpTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
     
            Positioned(
              top: getProportionateScreenHeight(55),
              left: getProportionateScreenWidth(130),
              right: getProportionateScreenWidth(130),
              child:Text(
                "إنشاء حساب",
                style: h4_21pt,
              ),
            ),///text
            Positioned(top: 120,child: Container(
              height: getProportionateScreenHeight(400),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash_screen/white_logo.png"),
                  )
              ),
            ),///logo)
            ),
Positioned(top:getProportionateScreenHeight(570),left:getProportionateScreenWidth(14),right:getProportionateScreenWidth(14),child: AuthButton(color: true,title: "كمستخدم",image:"assets/images/auth/user_icon.png" ,),),
Positioned(top:getProportionateScreenHeight(642),left:getProportionateScreenWidth(14),right:getProportionateScreenWidth(14),child: AuthButton(color: false,title: "كصاحب متجر",image:"assets/images/auth/vendor_icon.png" ,),),
Positioned(top:getProportionateScreenHeight(714),left:getProportionateScreenWidth(14),right:getProportionateScreenWidth(14),child: AuthButton(color: false,title: "كطبيب بيطري",image:"assets/images/auth/doctor_icon.png" ,),),
//
//
//             SizedBox(height: getProportionateScreenHeight(100),),

//             Spacer(),
//             GestureDetector(
//               onTap: (){},
//               child: Container(height: getProportionateScreenHeight(65),
//                 width: getProportionateScreenWidth(SizeConfig.screenWidth),
//                 margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(28),
//                   color: Colors.lightBlue,
//                 ),
//                 child: Row(
//                   children: [
//                     Spacer(),
//                     Center(
//
//                       child: AutoSizeText(
//                         "User",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Icon(Icons.person,color: Colors.white,size: getProportionateScreenHeight(35),),
//                     SizedBox(width: getProportionateScreenWidth(25),),
//                   ],
//                 ),
//               ),
//             ),///as user
//             SizedBox(height: getProportionateScreenHeight(15),),
//             GestureDetector(
//               onTap: (){},
//               child: Container(height: getProportionateScreenHeight(65),
//                 width: getProportionateScreenWidth(SizeConfig.screenWidth),
//                 margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(28),
//                   border: Border.all(width: 1,color: Colors.blue),
//                 ),
//                 child:  Row(
//                   children: [
//                     Spacer(),
//                     Center(
//
//                       child: AutoSizeText(
//                         "Vendor",
// style: TextStyle(
//   color: Colors.lightBlue
// ),
//                       ),
//                     ),
//                     Spacer(),
//                     Icon(Icons.add_business_rounded,color: Colors.blue.withOpacity(0.8),size: getProportionateScreenHeight(35),),
//                     SizedBox(width: getProportionateScreenWidth(25),),
//                   ],
//                 ),
//               ),
//             ),///vendor
//             SizedBox(height: getProportionateScreenHeight(15),),
//             GestureDetector(
//               onTap: (){},
//               child: Container(height: getProportionateScreenHeight(65),
//                 width: getProportionateScreenWidth(SizeConfig.screenWidth),
//                 margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(28),
//                   border: Border.all(width: 1,color: Colors.blue),
//                 ),
//                 child:  Row(
//                   children: [
//                     Spacer(),
//                     Center(
//
//                       child: AutoSizeText(
//                         "Doctor",
//                         style: TextStyle(
//                             color: Colors.lightBlue
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Icon(Icons.how_to_reg_sharp,color: Colors.blue.withOpacity(0.8),size: getProportionateScreenHeight(35),),
//                     SizedBox(width: getProportionateScreenWidth(25),),
//
//                   ],
//                 ),
//               ),
//             ),///doctor
//             SizedBox(height: 49,),
          ],
        ),
      ),
    );
  }
}
