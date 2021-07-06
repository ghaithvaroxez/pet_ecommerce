import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/models/product.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/constants.dart';

class VendorProductCard extends StatelessWidget {
  Product product;
VendorProductCard({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: getProportionateScreenWidth(16),right:getProportionateScreenWidth(16),bottom: getProportionateScreenHeight(16)),
      width: getProportionateScreenWidth(353),
      height: getProportionateScreenHeight(140),
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: Colors.grey),
          color: backgroundGrey,
      boxShadow: shadow),
      child: Row(
        children: [
  Container(width: getProportionateScreenWidth(140),
            height: getProportionateScreenHeight(140),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Stack(
                children: [
                  Container(color:Colors.white,child: Image.asset("assets/images/home/custom_background.png",fit: BoxFit.fill,)),
                  Container(child: Image.file(product.img,fit: BoxFit.fill,)),
                ],
              ),

            ),
          ),
          SizedBox(width: getProportionateScreenWidth(8),),
          Expanded(
            child: Container(

              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),

                    height: getProportionateScreenHeight(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  Expanded(flex:5,child: Container(height: getProportionateScreenHeight(20),child: AutoSizeText(product.name,style: body1_16pt,),)),
  Expanded(flex:1,child: Container(height: getProportionateScreenHeight(20),child: AutoSizeText(product.price.toString()+" \$",style: body2_14pt,maxLines: 1,),)),
],
                    ),
                  ),
                 SizedBox(height: getProportionateScreenHeight(10),),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                   children: [
                     Container(              margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
                         height: getProportionateScreenHeight(20),child: Image.asset("assets/images/vendor_app/cat_icon.png")),
                     Spacer(),
                     Expanded(child: Container(height: getProportionateScreenHeight(20),child:Row(
                       children: [
                         Image.asset("assets/images/home/clock_icon.png"),
                         SizedBox(width: getProportionateScreenWidth(5),),
                         AutoSizeText("منذ ساعة",style: darkGrayText_11pt,),
                       ],
                     ))),
                   ]
                 ),
                  SizedBox(height: getProportionateScreenHeight(10),),
                  Container(alignment: Alignment.centerRight,height: getProportionateScreenHeight(20),child: AutoSizeText(product.desc,style: darkGrayText_11pt,),),
Row(
  children: [
    Spacer(
    ),
    Container(

      width: getProportionateScreenWidth(160),
      height: getProportionateScreenHeight(39),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomLeft: Radius.circular(12)  ),
        color: Colors.white,
      ),
      child: Row(
        children: [
Expanded(child: Padding(
  padding: const EdgeInsets.all(7.0),
  child:   Image.asset("assets/images/vendor_app/unupload_icon.png"),
)),
Expanded(child: Padding(   padding: const EdgeInsets.all(7.0),child: Image.asset("assets/images/vendor_app/upload_icon.png"))),
Expanded(child: GestureDetector(  onTap:(){
  vendorProductsController.changeToEditProduct();

},child: Image.asset("assets/images/vendor_app/pen.png"))),
Expanded(child: GestureDetector(onTap:(){
  vendorProductsController.deleteProduct(product);

},child: Image.asset("assets/images/vendor_app/trash.png"))),
        ],
      ),
    ),
  ],
),
                ],
              ),
            ),
          ),

        ],
      )

    );
  }
}
