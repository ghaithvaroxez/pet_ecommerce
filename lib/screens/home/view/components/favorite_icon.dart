import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';

import 'package:get/get.dart';
class FavoriteIcon extends StatefulWidget {
  Function fav;
  bool s;
  FavoriteIcon({this.fav,this.s=false});
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  IconData borderFavorite=Icons.favorite_outline;
  IconData favorite=Icons.favorite;
  IconData myIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        setState(() {
          if(myIcon==borderFavorite)
            myIcon=favorite;
          else myIcon=borderFavorite;
          widget.s=(!widget.s);
        });
        bool k=await  widget.fav();
        if(k==null||k==false){

          setState(() {
            if(myIcon==borderFavorite)
              myIcon=favorite;
            else myIcon=borderFavorite;
            widget.s=(!widget.s);
          });
          Get.rawSnackbar(message: "تعذرت العمليةالرجاء المحاولة لاحقاً");
        }

      },
      child: Container(
        // height: getProportionateScreenHeight(15),
        // width: getProportionateScreenWidth(15),
        child:widget.s?Icon(
           favorite,
            color: Colors.lightBlueAccent,
            // size: 22,

        ):Icon(
           borderFavorite,
            color: Colors.grey,
            // size: 22,

        ),
      ),
    );
  }
}
