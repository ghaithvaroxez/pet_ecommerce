// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:pets/configuration/constants/colors.dart';
// import 'package:pets/configuration/constants/text_style.dart';
// import 'package:pets/configuration/size_config.dart';
//
// class DoctorOrderCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: getProportionateScreenWidth(345),
//       height: getProportionateScreenHeight(134),
//       margin: EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: offWhite,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: getProportionateScreenWidth(105),
//             height: getProportionateScreenHeight(134),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(12),
//                 bottomRight: Radius.circular(12),
//               ),
//               color: offBlue,
//             ),
//             child: Center(
//               child: Image.asset(
//                 "assets/images/home/cat_2.png",
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: getProportionateScreenWidth(10),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(
//                 vertical: getProportionateScreenHeight(16)),
//             child: Column(
//               children: [
//                 Container(
//                   height: getProportionateScreenHeight(30),
//                   width: getProportionateScreenWidth(200),
//                   child: AutoSizeText(
//                     "قطة لونها رمادي فروها ناعم",
//                     textDirection: TextDirection.rtl,
//                     minFontSize: 8,
//                     style: body1_16pt,
//                   ),
//                 ),
//                 // SizedBox(height: getProportionateScreenHeight(2),),
//                 Container(
//                   height: getProportionateScreenHeight(12),
//                   width: getProportionateScreenWidth(200),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: getProportionateScreenWidth(80),
//                         height: getProportionateScreenHeight(12),
//                         child: Row(
//                           children: [
//
//                             Expanded(
//                                 flex: 1,
//                                 child: Container(
//                                   height: getProportionateScreenHeight(12),
//                                   child: Image.asset(
//                                       "assets/images/store/cat_icon.png"),
//                                 )),
//                             SizedBox(width: getProportionateScreenWidth(5),),
//                             Expanded(
//                                 flex: 3,
//                                 child: Container(
//                                   height: getProportionateScreenHeight(12),
//                                   child: AutoSizeText(
//                                     "قطط",
//                                     style: darkGrayText_11pt,
//                                     minFontSize: 5,
//                                     textDirection: TextDirection.rtl,
//                                   ),
//                                 )),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: getProportionateScreenWidth(80),
//                         height: getProportionateScreenHeight(12),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 flex: 1,
//                                 child: Container(
//                                   height: getProportionateScreenHeight(12),
//                                   child: Image.asset(
//                                       "assets/images/home/clock_icon.png"),
//                                 )),
//                             SizedBox(width: getProportionateScreenWidth(5),),
//                             Expanded(
//                                 flex: 3,
//                                 child: Container(
//                                   height: getProportionateScreenHeight(12),
//                                   child: AutoSizeText("منذ ساعة",
//                                       style: darkGrayText_11pt,
//                                       minFontSize: 5,
//                                       textDirection: TextDirection.rtl),
//                                 )),
//
//                           ],
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(10),
//                 ),
//                 Container(
//                   height: getProportionateScreenHeight(50),
//                   width: getProportionateScreenWidth(200),
//                   child: AutoSizeText(
//                       "السلام عليكم لدي قطة لونها رمادي من سلالة أصيلة للمزيد تواصل معي",
//                       minFontSize: 8,
//                       style: darkGrayText_13pt,
//                       textDirection: TextDirection.rtl),
//                 ),
//               ],
//             ),
//           ),
//
//           ///blue container
//         ],
//       ),
//     );
//   }
// }
