//
//
// import 'package:flutter/material.dart';
// import 'package:pets_ecommerce/configuration/printer.dart';
// import 'package:pets_ecommerce/configuration/size_config.dart';
// import 'package:http/http.dart' as http;
// import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
// import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';
// import 'dart:convert';
//
// import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
// class ProductsBodyScreen extends StatefulWidget {
// int id;
// ProductsBodyScreen(this.id);
//
//
//   @override
//   _ProductsBodyScreenState createState() => _ProductsBodyScreenState();
// }
//
// class _ProductsBodyScreenState extends State<ProductsBodyScreen> {
//
//
//   List<StoreProduct> products=[];
//   bool loading =true;
//   bool error=false;
//   fetchData()async
//   {
//     consolePrint("fetch data");
//     loading=true;
//     setState(() {
//
//     });
//
//     var url=Uri.parse("http://pets.sourcecode-ai.com/api/store/${widget.id}");
//     final apiResult =await http.get(url);
//     if(apiResult.statusCode==200)
//     {
//       var d= json.decode(apiResult.body);
// consolePrint(d["store"]["store_products"]);
//       products= List<StoreProduct>.from(d["store"]["store_products"].map((x) => StoreProduct.fromJson(x)));
//     }
//
//     else
//     {
//       error=true;
//     }
//
//     loading=false;
//     setState(() {
//
//     });
//
//
//   }
//   @override
//   void initState() {
//     fetchData();
//     // TODO: implement initState
//     super.initState();
//     consolePrint("initial state of gproductas boud tgg screvnn ffdmfk dfdkmdkfmfdfldsomf ddmksdmkvmm vkds dokfdokm;ksidk;m;;kodfsdm n ds");
//   }
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     return loading?LoadingScreen():Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: getProportionateScreenWidth(16),
//             vertical: getProportionateScreenHeight(8)),
//         child:  SingleChildScrollView(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   ...List<Widget>.generate(
//                   products.length,
//                         (index)=>index%2==0?Container(
//                       margin: EdgeInsets.symmetric(vertical: 10),
//
//                       child:  StoreProductCard(products[index]),
//                     ):Container(height: 0,),
//
//                   ),
//                 ],
//               ),
//               Spacer(),
//               Column(
//                 children: [
//                   ...List<Widget>.generate(
//                     products.length,
//                         (index)=>index%2==1?Container(
//                       margin: EdgeInsets.symmetric(vertical: 10),
//
//                       child:  StoreProductCard(products[index]),
//                     ):Container(height: 0,),
//
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//
//
//
//         // ListView.builder(
//         //   itemCount: products.length,
//         //   itemBuilder: (context, index) => Column(
//         //     children: [
//         //       Row(
//         //         children: [
//         //           Column(
//         //             children: [
//         //               ...List<Widget>.generate(
//         //                 products.length,
//         //                     (index)=>index%2==0?Container(
//         //                   margin: EdgeInsets.symmetric(vertical: 10),
//         //
//         //                   child:        StoreProductCard(products[index]),
//         //                 ):Container(),
//         //
//         //               ),
//         //             ],
//         //           ),
//         //           SizedBox(width: getProportionateScreenWidth(15),),
//         //           Column(
//         //             children: [
//         //               ...List<Widget>.generate(
//         //              products.length,
//         //                     (index)=>index%2==1?Container(
//         //                   margin: EdgeInsets.symmetric(vertical: 10),
//         //                   child:StoreProductCard(products[index]),
//         //                 ):Container(),
//         //
//         //               ),
//         //             ],
//         //           ),
//         //         ],
//         //       ),
//         //       SizedBox(height: getProportionateScreenHeight(16),),
//         //     ],
//         //   ),
//         // ),
//
//         // child: GridView.builder(
//         //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         //       crossAxisCount: 2,
//         //       // mainAxisSpacing: getProportionateScreenHeight(16),
//         //       // crossAxisSpacing: getProportionateScreenHeight(16),
//         //       // childAspectRatio:1.3
//         //       childAspectRatio: 1.19
//         //     ),
//         //     itemCount: 30,
//         //     itemBuilder: (context, index) => StoreProductCard()),
//       );
//   }
// }
