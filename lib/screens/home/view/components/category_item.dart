import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';

import 'package:pets_ecommerce/screens/home/model/constants.dart';



class CategoryItem extends StatelessWidget {
  String name;
  String image;
int id;
  CategoryItem({Key key, this.name,this.image,this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
              right: -5,
              child: CircleAvatar(
                backgroundImage: NetworkImage(Api.imagePath+image,),
                radius: getProportionateScreenHeight(22),
                backgroundColor:
                Colors.white,
                // child: Image.network(
                //     Api.imagePath+image),
              )),
          Positioned(
              right: getProportionateScreenWidth(50),
              bottom: getProportionateScreenHeight(10),
              child: AutoSizeText(
                name,
                style: body2_14pt,
              )),
        ],
      ),
    );
  }
}
