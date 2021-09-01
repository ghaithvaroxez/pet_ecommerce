import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/view/splash/splash_screen.dart';
import 'package:pets/screens/corner/view/my_corner_details.dart';
import 'package:pets/screens/favorites/views/favorite_view.dart';
import 'package:pets/screens/my_corner/view/my_corners_list.dart';
import 'package:pets/screens/my_orders/view/orders_main_screen.dart';
import 'package:pets/screens/status/view/my_status_screen.dart';
import 'package:pets/screens/widgets/drawer/components/drawer_item.dart';
import 'package:pets/screens/profile/view/components/profile_item.dart';
import 'package:get/get.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/local_storage_service.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name="";
  String img="";
  getdata()async
  {
    name=await AuthServices.getName();
    img=await AuthServices.getImage();
    setState(() {

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          height: getProportionateScreenHeight(851),
          width: getProportionateScreenWidth(395),
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(325),
                width: getProportionateScreenWidth(395),
                child: Stack(
                  children: [
                    Positioned(child: Container(
                      height: getProportionateScreenHeight(48),
                      width: getProportionateScreenWidth(48),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("assets/images/profile/back_circle.png"),
                    )),
                    Positioned(
                        child: Container(
                          height: getProportionateScreenHeight(325),
                          width: getProportionateScreenWidth(395),
                          child: Image.asset(
                            "assets/images/drawer/image_background.png",
                            fit: BoxFit.fill,
                          ),
                        )),
                    Positioned(
                      bottom: getProportionateScreenHeight(130),
                      // left: getProportionateScreenWidth(130),
                      child: Container(
                        height: getProportionateScreenHeight(150),
                        width: getProportionateScreenWidth(395),
                        alignment: Alignment.center,
                        child: Container(
                          height: getProportionateScreenHeight(150),
                          width: getProportionateScreenWidth(150),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: gusetId==146?Container(child: Center(child: AutoSizeText("pets",style: h4_21pt_lightBlue,),),):Container(decoration: BoxDecoration(boxShadow: shadow,shape:BoxShape.circle,image: DecorationImage(image: img==null? AssetImage("assets/images/drawer/user_img.png"):NetworkImage(Api.imagePath+img),fit: BoxFit.fill
                          ),),),),
                      ),
                    ),
                    Positioned(
                      bottom: getProportionateScreenHeight(80),
// right: getProportionateScreenWidth(130),
                      child: Container(
                        width: getProportionateScreenWidth(390),
                        height: getProportionateScreenHeight(30),
                        alignment: Alignment.center,
                        child: gusetId==146?Container(height: 0,width: 0,):AutoSizeText(
                          name,
                          style: body3_21pt_nb2,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              Expanded(
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        //user
                        CustomeProfileItem(
                          title: " المعلومات الشخصية ",
                          img: "assets/images/profile/personal_info_icon.png",
                          onTap: () {

                            // Get.back();
                            Get.to(EditProfileScreen( ()async{
                              await getdata();
                              setState(() {

                              });
                            } ));
                          },
                          isExpanded: true,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        //categories

                        //favorite
                        CustomeProfileItem(
                          title: "المفضلة",
                          img:
                          "assets/images/drawer/drawer_icons/favorite_icon.png",
                          onTap: () {
                            Get.to(FavoriteView());
                            // Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        //map
                        CustomeProfileItem(
                          title: "الإشعارات",
                          img:
                          "assets/images/profile/notification_icon.png",
                          onTap: () {
                            // Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),

                        //money
                        CustomeProfileItem(
                          title: "طلباتي",
                          img: "assets/images/profile/my_orders_icon.png",
                          onTap: () {
                            Get.to(OrdersMainScreen());
                            // Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        CustomeProfileItem(
                          title: "زاويتي",
                          img:
                          "assets/images/drawer/drawer_icons/corner_icon.png",
                          onTap: () {
                            Get.back();
                            Get.to(MyCornerList());
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        //my_baqa

                        //my_status
                        CustomeProfileItem(
                          title: "حالتي",
                          img:
                          "assets/images/drawer/drawer_icons/status_icon.png",
                          onTap: () {
                            Get.to(MyStatus());

                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        //my_corner

                        //setting
                        CustomeProfileItem(
                          title: "الإعدادت",
                          img:
                          "assets/images/drawer/drawer_icons/setting_icon.png",
                          onTap: () {
                            Get.back();
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),

                        CustomeProfileItem(
                          title: "الأسئلة الشائعة",
                          img:
                          "assets/images/profile/questions_icon.png",
                          onTap: () {
                            Get.back();
                          },
                        ),

                        //user
                        SizedBox(
                          height: getProportionateScreenHeight(6),
                        ),
                        CustomeProfileItem(
                          title: "تسجيل الخروج",
                          img:
                          "assets/images/drawer/drawer_icons/logout_icon.png",
                          onTap: ()async {
                            showDialog(
                                context: context,
                                builder: ((context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  title:  Text(
                                    'هل أنت متأكد ؟',
                                    textDirection: TextDirection.rtl,
                                    style: body3_18pt,
                                  ),
                                  content: Text(
                                    'انت على وشك تسجيل الخروج !',
                                    textDirection: TextDirection.rtl,
                                    style: body1_16pt,
                                  ),
                                  actions: [
                                    TextButton(
                                      child:  Text(
                                        'نعم',
                                      ),
                                      onPressed: () async{
                                        // language.changeLanguage();
                                        Navigator.of(context).pop();
                                        await  LocalStorageService.prefs.clear();
                                        Get.offAll(SplashScreen());
                                        // Navigator.popUntil(context, ModalRoute.withName('/'));
                                      },
                                    ),
                                    TextButton(
                                      child: Text('لا'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                )));

                          },
                          isRed: true,
                        ),

                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
