import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/home/model/constants.dart';


class CategorySelectedItem extends StatelessWidget {

String name;
String image;
int id;

   CategorySelectedItem({Key key, this.name,this.image,this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width:getProportionateScreenWidth( 2),
          ),
          CircleAvatar(
            radius:
             getProportionateScreenHeight(24) ,
            backgroundImage: NetworkImage( Api.imagePath+image),
            backgroundColor:
            Colors.white70,
            // child: Image.network(
            //    Api.imagePath+image
            // ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          AutoSizeText(name,
              style: body1_16pt),
        ],
      ),
    );
  }
}
