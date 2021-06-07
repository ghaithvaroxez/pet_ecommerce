import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';


class FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  IconData borderFavorite=Icons.favorite_outline;
  IconData favorite=Icons.favorite;
  IconData myIcon=Icons.favorite_outline;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(14),
      width: getProportionateScreenWidth(15),
      child: GestureDetector(
        onTap: (){
          setState(() {
            if(myIcon==borderFavorite)
              myIcon=favorite;
            else myIcon=borderFavorite;
          });


        },
        child: IconButton(
          icon: Icon(
           myIcon,
            color: myIcon==borderFavorite?Colors.white70:Colors.lightBlueAccent,
            size: 22,
          ),
        ),
      ),
    );
  }
}
