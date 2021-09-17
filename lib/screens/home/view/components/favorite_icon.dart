import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';

import 'package:get/get.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/auth/view/splash/login_or_register.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/local_storage_service.dart';
import 'translations/favorite_icon.i18n.dart';
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
if( gusetId==146)
{
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
        title:  Text(
          'يجب عليك تسجيل حساب اولاً '.i18n,
          textDirection: appLocal=="ar"?TextDirection.rtl:TextDirection.ltr,

          style: body3_18pt,
        ),

        actions: [
          TextButton(
            child: Text('العودة'.i18n,style: GoogleFonts.tajawal(color: Colors.red.withOpacity(0.6)),),
            onPressed: () {
              Navigator.pop(context);
              return ;
              // Navigator.pop(context);
            },
          ),
          TextButton(
            child:  Text(
              'تسجيل حساب'.i18n,style: GoogleFonts.tajawal(
                color: Colors.blue.withOpacity(0.6)
            ),
            ),
            onPressed: () async{
              Get.back();
              await  LocalStorageService.prefs.clear();
              Get.offAll(LoginOrRegister());
              return ;
            },

            // language.changeLanguage();
            // Navigator.of(context).pop();
            // await  LocalStorageService.prefs.clear();
            // Get.offAll(SplashScreen());
            // Navigator.popUntil(context, ModalRoute.withName('/'));
          ),

        ],
      )));
  return;
}
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
          Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
        }

      },
      child: Container(
        // height: getProportionateScreenHeight(15),
        // width: getProportionateScreenWidth(15),
        child:widget.s?Icon(
           favorite,
            color: Colors.lightBlueAccent.withOpacity(0.8),
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
