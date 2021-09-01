import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/search/view/search_screen.dart';

import 'package:pets/screens/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:pets/screens/search/view/components/filter_custom_bottom_sheet.dart';


class SearchBar extends StatelessWidget {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: ((context)=>SearchScreen())));
      },
      child:
      Container(
        margin: EdgeInsets.only( left: getProportionateScreenWidth(24),right: getProportionateScreenWidth(24),top: getProportionateScreenHeight(16),bottom: getProportionateScreenHeight(8)),
        width: getProportionateScreenWidth(345),
        height: getProportionateScreenHeight(48),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9), color: backgroundGrey),
        child: Container(
          child: Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(10),),
              GestureDetector(onTap:(){

              },child: Image.asset("assets/images/home/search_icon.png",fit: BoxFit.fill,height: getProportionateScreenHeight(20),width: getProportionateScreenHeight(20),)),
           SizedBox(width: getProportionateScreenWidth(10),),
              Container(width: getProportionateScreenWidth(270),
                height: getProportionateScreenHeight(60),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                child:
                  AutoSizeText("ابحث هنا ",style:darkGrayText_14pt,),
//                 TextField(
//                   controller: searchController,
// onSubmitted: (value){
//                     print(value);
//                     print("submitted");
// },
// decoration: InputDecoration(
//   hintText: "ابحث هنا",
//   // floatingLabelBehavior:FloatingLabelBehavior.auto,
//   hintStyle: darkGrayText_14pt,
//   border: InputBorder.none
//     ,
//
// ),
//                   keyboardType:TextInputType.text ,
//                 ),
              ),

            // Spacer(),
            //   GestureDetector(onTap: (){
            //     FocusScope.of(context).unfocus();
            //     // showModal(context);
            //   },child:
              Container(height:getProportionateScreenHeight(48),width:getProportionateScreenWidth(20),child: Container(height:getProportionateScreenHeight(12),width:getProportionateScreenWidth(20),child: Image.asset("assets/images/home/filter_icon.png",height: getProportionateScreenHeight(12),width: getProportionateScreenWidth(20),))
              // )
      ),
              SizedBox(width: getProportionateScreenWidth(10),),


            ],
          ),
       ),
      ),
    );
  }
}
// IconButton(
//     icon: Image.asset(
//       "assets/images/home/filter_icon.png",
//     ),
//     onPressed: () {
//       Get.bottomSheet(
//         CustomBottomSheet(),
//         barrierColor: Colors.grey.withOpacity(0.2),
//         backgroundColor: Colors.white,
//       );
//     }),