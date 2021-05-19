import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';
import 'package:pets_ecommerce/screens/home/model/constants.dart';


class CategorySelectedItem extends StatelessWidget {

  final int index;

  const CategorySelectedItem({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 2,
          ),
          CircleAvatar(
            radius:
             24 ,
            backgroundColor:
            Colors.white70,
            child: Image.asset(
                images[index]
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(names[index],
              style: body1_16pt),
        ],
      ),
    );
  }
}
