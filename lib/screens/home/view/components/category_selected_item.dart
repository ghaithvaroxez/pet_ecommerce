import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/home/model/constants.dart';


class CategorySelectedItem extends StatelessWidget {

  final int index;

  const CategorySelectedItem({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width:getProportionateScreenWidth( 2),
            ),
            CircleAvatar(
              radius:
               getProportionateScreenHeight(24) ,
              backgroundColor:
              Colors.white70,
              child: Image.asset(
                  images[index]
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(5),
            ),
            Text(names[index],
                style: body1_16pt),
          ],
        ),
      ),
    );
  }
}
