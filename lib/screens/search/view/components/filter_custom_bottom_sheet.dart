import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/location_model.dart';
import 'package:pets/screens/vendor_app/model/types.dart';
import 'package:pets/screens/vendor_app/requests/products_requests.dart';
import 'package:pets/screens/vendor_app/requests/vendor_app_requests.dart';




// void showModal(context) {
//   showModalBottomSheet(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
//       ),
//       context: context,
//       builder: (context) {
//         //3
//         return  DraggableScrollableSheet(
//                   expand: false,
//                   builder:
//                       (BuildContext context, ScrollController scrollController) {
//                     return Container(
//                       height: getProportionateScreenHeight(651),
//                       width: getProportionateScreenWidth(390),
//                       child: Column(children: <Widget>[
//                         SizedBox(height: getProportionateScreenHeight(10),),
//
//                         Container(
//                           height: getProportionateScreenHeight(10),
//                           child: Row(
//                             children: [
//                               Spacer(),
//                               Container(
//                                 height: getProportionateScreenHeight(10),
//                                 width: getProportionateScreenWidth(60),
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(25),
//                                   color: Color(0xFFD3DAE3),
//
//                                 ),
//                               ),
//                               Spacer(),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: getProportionateScreenHeight(30),),
//                        Container(height:getProportionateScreenHeight(600),width:getProportionateScreenWidth(390),child: BottomSheetBody()),
//
//                       ]),
//                     );
//                   });
//             });
//
// }



