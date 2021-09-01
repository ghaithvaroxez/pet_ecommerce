import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/home/view/components/favorite_icon.dart';
import 'package:pets/screens/stores/view/components/products/products_details_page.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import 'package:get/get.dart';

class HomeStoreProductCard extends StatelessWidget {
  HomeStoreProductCard(this.storeProdcut,this.fav);
  StoreProduct storeProdcut;
  Function fav;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ProductDetailsPage(storeProdcut,false));
      },
      child: Container(
        margin: EdgeInsets.only(left: getProportionateScreenWidth(5),right:getProportionateScreenWidth(5),),
        width: getProportionateScreenWidth(120),
        height: getProportionateScreenHeight(150),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3, color: borderColor),
            color: Colors.white),
        child: Stack(
          children: [
            Positioned(
                top: getProportionateScreenHeight(115),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                  height: getProportionateScreenHeight(35),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    color: Colors.grey.shade200,
                  ),
                  child: AutoSizeText(
                    storeProdcut.name,
                    textAlign: TextAlign.center,
                    style: body2_14pt,
                    minFontSize: 9,
                  ),
                )),
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  height: getProportionateScreenHeight(115),
                  width: getProportionateScreenWidth(120),
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
