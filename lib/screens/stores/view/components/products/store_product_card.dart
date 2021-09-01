import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/home/view/components/favorite_icon.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:get/get.dart';
import '../products/products_details_page.dart';
class StoreProductCard extends StatelessWidget {
  StoreProductCard(this.storeProdcut,this.fav);
  StoreProduct storeProdcut;
  Function fav;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ProductDetailsPage(storeProdcut));
      },
      child: Container(
        // margin: EdgeInsets.only(left: getProportionateScreenWidth(16),right:getProportionateScreenWidth(16),bottom: getProportionateScreenHeight(16)),
        width: getProportionateScreenWidth(163),
        height: getProportionateScreenHeight(160),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3, color: borderColor),
            color: Colors.white),
        child: Stack(
          children: [
            Positioned(
                top: getProportionateScreenHeight(120),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(162.7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    color: Colors.grey.shade200,
                  ),
                  child: Container(
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(150.7),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      storeProdcut.name,
                      textAlign: TextAlign.center,
                      style: body2_14pt,
                      minFontSize: 9,
                    ),
                  ),
                )),
            Positioned(
              left: 0,
                top: 0,
                child: Container(
                  height: getProportionateScreenHeight(120),
                  width: getProportionateScreenWidth(162.7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(Api.imagePath+storeProdcut.image,fit: BoxFit.fill,),
                  ),

                  // Image.asset(
                  //   "assets/images/home/cat_1.png",
                  //   fit: BoxFit.fill,
                  // ),

                )),
                  Positioned(
                  // width: getProportionateScreenWidth(15),
                  // height: getProportionateScreenHeight(15),
                  left:getProportionateScreenWidth(15),
      top: getProportionateScreenHeight(15),
      child: FavoriteIcon(fav: fav,s: storeProdcut.favStatus,),
      )
          ],
        ),
      ),
    );
  }
}
