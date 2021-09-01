import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/auth/view/splash/login_or_register.dart';
import 'package:pets/screens/auth/view/splash/splash_screen.dart';
import 'package:pets/screens/categories/view/categories_screen.dart';
import 'package:pets/screens/corner/view/my_corner_details.dart';
import 'package:pets/screens/corner/view/select_corner.dart';
import 'package:pets/screens/doctor_app/view/doctor_details_screen.dart';
import 'package:pets/screens/favorites/views/favorite_view.dart';
import 'package:pets/screens/maps/view/map_screen.dart';
import 'package:pets/screens/my_corner/view/my_corners_list.dart';
import 'package:pets/screens/my_orders/view/orders_main_screen.dart';
import 'package:pets/screens/vendor_app/view/vendor_details_screen.dart';
import 'package:pets/services/local_storage_service.dart';
import 'components/drawer_item.dart';
import 'package:pets/screens/profile/view/profile_screen.dart';
import '../../../screens/status/view/my_status_screen.dart';
class CustomDrawer extends StatefulWidget {
  bool home;
  CustomDrawer({this.home = false});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}
int  gusetId;
class _CustomDrawerState extends State<CustomDrawer> {

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
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: SizeConfig.screenHeight,
        width: getProportionateScreenWidth(288),
        child: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(271),
              width: getProportionateScreenWidth(288),
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: getProportionateScreenHeight(271),
                        width: getProportionateScreenWidth(288),
                        child: Image.asset(
                    "assets/images/drawer/image_background.png",
                    fit: BoxFit.fill,
                  ),
                      )),
                  Positioned(
                    bottom: getProportionateScreenHeight(90),
                    left: getProportionateScreenWidth(90),
                    child: Container(
                      height: getProportionateScreenHeight(111),
                      width: getProportionateScreenWidth(111),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: gusetId==146?Container(child: Center(child: AutoSizeText("pets",style: h4_21pt_lightBlue,),),):Container(decoration: BoxDecoration(boxShadow: shadow,shape:BoxShape.circle,image: DecorationImage(image: img==null? AssetImage("assets/images/drawer/user_img.png"):NetworkImage(Api.imagePath+img),fit: BoxFit.fill
                    ),),),),
                  ),
                  Positioned(
                    bottom: getProportionateScreenHeight(55),

                    child: Container(
                      width: getProportionateScreenWidth(288),
                      height: getProportionateScreenHeight(30),
                      alignment: Alignment.center,
                      child: gusetId==146?Container(height: 0,width: 0,):AutoSizeText(
                        name,
                        style: body1_16pt,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:getProportionateScreenHeight(8),
            ),
            Expanded(
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      //user
                      gusetId==146?Container(height: 0,width: 0,):CustomeDraweritem(
                        title: "حسابي",
                        img: "assets/images/drawer/drawer_icons/user_icon.png",
                        onTap: () async{

              UserModel user=await AuthServices.getCurrentUser();
             Navigator.of(context).pop();
              if( widget.home!=true) Navigator.of(context).pop();
                          if(user.user.role=="user")
                            // home!=true?Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ProfileScreen())):

                            Get.to(ProfileScreen());
                          else if(user.user.role=="provider")
                            // home!=true?Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => VendorDetailsPage())) :
                            Get.to(VendorDetailsPage());
                          else if(user.user.role=="doctor")
                            // home!=true?Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => DoctorAppDetailsPage())) :
                            Get.to(DoctorAppDetailsPage());


                        },
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      //categories
                      CustomeDraweritem(
                        title: "أصناف",
                        img:
                            "assets/images/drawer/drawer_icons/category_icon.png",
                      onTap: () {
                         Navigator.of(context).pop();
                         if( widget.home!=true) Navigator.of(context).pop();
                          Get.to(CategoriesScreen());
                        },
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      //favorite
                      gusetId==146?Container(height: 0,width: 0,):CustomeDraweritem(
                        title: "المفضلة",
                        img:
                            "assets/images/drawer/drawer_icons/favorite_icon.png",
                      onTap: () {
                       Navigator.of(context).pop();
                       if( widget.home!=true) Navigator.of(context).pop();
                          Get.to(FavoriteView());

                        },
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      //map
                      CustomeDraweritem(
                        title: "الخريطة",
                        img:
                            "assets/images/drawer/drawer_icons/location_icon.png",
                      onTap: () {
                         Navigator.of(context).pop();
                         if( widget.home!=true) Navigator.of(context).pop();
                          Get.to(()=>MapScreen());
                        },
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      gusetId!=146?Container(height: 0,width: 0,): CustomeDraweritem(
                        title: "تسجيل حساب",
                        img:
                        "assets/images/drawer/drawer_icons/user_icon.png",
                        onTap: () async{
                          Navigator.of(context).pop();
                          await  LocalStorageService.prefs.clear();
                          Get.offAll(SplashScreen());
                        },
                      ),
                      //money
                      gusetId==146?Container(height: 0,width: 0,):CustomeDraweritem(
                        title: "تسديد الاشتراك",
                        img: "assets/images/drawer/drawer_icons/money_icon.png",
                      onTap: () {
                         Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      //my_baqa
                      gusetId==146?Container(height: 0,width: 0,):CustomeDraweritem(
                        title: "باقتي",
                        img:
                            "assets/images/drawer/drawer_icons/my_baqa_icon.png",
                      onTap: () {
                         Navigator.of(context).pop();
                        },
                        isExpanded: true,
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      //my_status
                      gusetId==146?Container(height: 0,width: 0,):CustomeDraweritem(
                        title: "حالتي",
                        img:
                            "assets/images/drawer/drawer_icons/status_icon.png",
                      onTap: () {
                         Navigator.of(context).pop();
                         if( widget.home!=true) Navigator.of(context).pop();
                         Get.to(MyStatus());
                        },
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      //my_corner
                      gusetId==146?Container(height: 0,width: 0,):  CustomeDraweritem(
                        title: "زاويتي",
                        img:
                            "assets/images/drawer/drawer_icons/corner_icon.png",
                      onTap: () {
                          Navigator.of(context).pop();
                         if( widget.home!=true) Navigator.of(context).pop();
                          Get.to(MyCornerList());
                        },
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      gusetId==146?Container(height: 0,width: 0,):  CustomeDraweritem(
                        title: "طلباتي",
                        img:
                        "assets/images/drawer/drawer_icons/drawer_order.png",
                      onTap: () {
                         Navigator.of(context).pop();
                         if(widget.home!=true)Get.back();
                         Get.to(OrdersMainScreen());
                          // home!=true?Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyCornerList())) : Get.to(MyCornerList());
                        },
                      ),
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      //setting
                      gusetId==146?Container(height: 0,width: 0,): CustomeDraweritem(
                        title: "الإعدادت",
                        img:
                            "assets/images/drawer/drawer_icons/setting_icon.png",
                      onTap: () {
                         Navigator.of(context).pop();
                        },
                      ),

                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                      //user
                      Spacer(),
                      gusetId==146?Container(height: 0,width: 0,): CustomeDraweritem(
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
                      SizedBox(
                        height:getProportionateScreenHeight(8),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
