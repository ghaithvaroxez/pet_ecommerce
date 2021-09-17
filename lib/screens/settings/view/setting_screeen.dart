import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/notifications/view/notification_button.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:easy_localization/easy_localization.dart' as ea;
import 'package:pets/services/http_requests_service.dart';
import 'settings.i18n.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
bool offers=false;
bool orders=false;
bool stores=false;
bool barns=false;
bool sieves=false;
  restart(){

    Phoenix.rebirth(context);
  }

  bool loading=false ;
  bool failed=false;

fetchData()async
{
  loading=true;
  setState(() {

  });

  var url=Uri.parse("${Api.baseUrl}/notification/nots");
  consolePrint("before print");
  final h=await HttpService().getHeaders();
  final apiResult=await http.get(url,headers: h);
  consolePrint("after print");

  if(apiResult.statusCode==200)
  {
    var j=jsonDecode(apiResult.body);

    if(j["store_not"]==1)
  stores=true;
      if(j["offer_not"]==1)
  offers=true;
      if(j["barn_not"]==1)
  barns=true;
      if(j["sieve_not"]==1)
  sieves=true;
      if(j["order_not"]==1)
  orders=true;
  }
  else {
    failed=true;
  }
  loading=false;
  setState(() {

  });

}

 ChangeOffers() async {
  // try {
      var url = Uri.parse("${Api.baseUrl}/notification/change");

      final h = await HttpService().getHeaders();
      final apiResult =
          await http.post(url, headers: h, body: {"offer_not": offers ? "1" : "0"});
      if (apiResult.statusCode == 200) {
      } else {
        Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
        setState(() {
          offers = !offers;
        });
        consolePrint("statusCode!=200");
      }
    // }catch(e){
    // consolePrint(e.toString());
    // Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
    // setState(() {
    //   offers = !offers;
    // });
  // }
  }

Future<bool> changeLang() async {
  // try {
  var url = Uri.parse("${Api.baseUrl}/notification/change");

  final h = await HttpService().getHeaders();
  final apiResult =
  await http.post(url, headers: h, body: {});
  if (apiResult.statusCode == 200) {
    return true;
  } else {
    Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
  return false;
    consolePrint("statusCode!=200");
  }
  // }catch(e){
  // consolePrint(e.toString());
  // Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
  // setState(() {
  //   offers = !offers;
  // });
  // }
}
UserModel userModel;

getUser()async{
userModel=await AuthServices.getCurrentUser();

}
ChangeOrders() async {
  try {
      var url = Uri.parse("${Api.baseUrl}/notification/change");

      final h = await HttpService().getHeaders();
      final apiResult =
          await http.post(url, headers: h, body: {"order_not": orders ? "1" : "0"});
      if (apiResult.statusCode == 200) {
      } else {
        Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
        setState(() {
          orders = !orders;
        });
        consolePrint("statusCode!=200");
      }
    }catch(e){
    consolePrint(e.toString());
    Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
    setState(() {
      orders = !orders;
    });
  }
  }

  ChangeStores() async {
  try {
      var url = Uri.parse("${Api.baseUrl}/notification/change");

      final h = await HttpService().getHeaders();
      final apiResult =
          await http.post(url, headers: h, body: {"store_not": stores ? "1" : "0"});
      if (apiResult.statusCode == 200) {
      } else {
        Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
        setState(() {
          stores = !stores;
        });
        consolePrint("statusCode!=200");
      }
    }catch(e){
    consolePrint(e.toString());
    Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
    setState(() {
      stores = !stores;
    });
  }
  }

  ChangeSieves() async {
  try {
      var url = Uri.parse("${Api.baseUrl}/notification/change");

      final h = await HttpService().getHeaders();
      final apiResult =
          await http.post(url, headers: h, body: {"sieve_not": sieves ? "1" : "0"});
      if (apiResult.statusCode == 200) {
      } else {
        Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
        setState(() {
          sieves = !sieves;
        });
        consolePrint("statusCode!=200");
      }
    }catch(e){
    consolePrint(e.toString());
    Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
    setState(() {
      sieves = !sieves;
    });
  }
  }

  ChangeStable() async {
  try {
      var url = Uri.parse("${Api.baseUrl}/notification/change");

      final h = await HttpService().getHeaders();
      final apiResult =
          await http.post(url, headers: h, body: {"barn_not": barns ? "1" : "0"});
      if (apiResult.statusCode == 200) {
      } else {
        Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".
        i18n);
        setState(() {
          barns = !barns;
        });
        consolePrint("statusCode!=200");
      }
    }catch(e){
    consolePrint(e.toString());
    Get.rawSnackbar(message: "الرجاء المحاولة مجدداً".i18n);
    setState(() {
      barns = !barns;
    });
  }
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Builder(
          builder:(context)=>failed?Container(height: getProportionateScreenHeight(400),width: getProportionateScreenWidth(400),
          child: Center(
            child: AutoSizeText("الرجاء المحاولة مجدداً".i18n,style: body3_18pt,),
          ),):loading?LoadingScreen(): Column(
            children: [
              Container(
                child: Material(
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(95),
                      child: Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(24),
                          ),
                          GestureDetector(
                            onTap: (){ Scaffold.of(context).openDrawer();},

                            // onTap: open_drawer,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey.shade50,
                              child: Image.asset(
                                "assets/images/home/menu_icon.png",
                                height: 24,
                                width: 20,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                              height: getProportionateScreenHeight(28),
                              // width: getProportionateScreenWidth(75),
                              child: AutoSizeText(
                                "الإعدادات".i18n,
                                style: h5_21pt,
                                minFontSize: 8,
                              )),
                          Spacer(),
                          NotificationButton(),

                          SizedBox(
                            width: getProportionateScreenWidth(24),
                          ),
                        ],
                      )),
                ),
              ),
SizedBox(height: getProportionateScreenHeight(45),),
ExpansionTile(title: Row(children: [
  Container(height: getProportionateScreenHeight(25),width: getProportionateScreenWidth(25),child: Image.asset("assets/images/home/notification_icon.png",color: blue,//Color(0xFF348BA7),
  ),)
  ,SizedBox(width: getProportionateScreenWidth(5),),
  AutoSizeText("استقبال الإشعارات".i18n,style: body1_16pt,)
],),children: [
  SwitchListTile(
    title: Text("إشعارات العروض".i18n,style: !offers?darkGrayText_16pt:darkBlueText_16pt,
    ),
    value: offers,
    activeColor:blue, //Color(0xFF348BA7),
    inactiveTrackColor: Color(0xFF707070).withOpacity(0.5),
    onChanged: (bool value) {
      setState(() {
        offers = value;
      });
      ChangeOffers();
    },
    // secondary: Image.asset("assets/devs.jpg",),
    // subtitle: Text('Software Company',style: TextStyle(
    //   color: Colors.blueGrey[600],
    // ),
    ),

 userModel.user.role=="user"?Container(width: 0,height: 0,): SwitchListTile(
    title: Text("إشعارات الطلبات".i18n,style: !orders?darkGrayText_16pt:darkBlueText_16pt,
    ),
    value: orders,
    activeColor:blue, //Color(0xFF348BA7),
    inactiveTrackColor: Color(0xFF707070).withOpacity(0.5),
    onChanged: (bool value) {
      setState(() {
        orders = value;
      });
      ChangeOrders();
    },
    // secondary: Image.asset("assets/devs.jpg",),
    // subtitle: Text('Software Company',style: TextStyle(
    //   color: Colors.blueGrey[600],
    // ),
    ),


  SwitchListTile(
    title: Text('إشعارات المتاجر'.i18n,style: !stores?darkGrayText_16pt:darkBlueText_16pt,
    ),
    value: stores,
    activeColor: blue,//Color(0xFF348BA7),
    inactiveTrackColor: Color(0xFF707070).withOpacity(0.5),
    onChanged: (bool value) {
      setState(() {
        stores = value;
      });
      ChangeStores();
    },
  ),

  SwitchListTile(
    title: Text('إشعارات الاسطبلات'.i18n,style: !barns?darkGrayText_16pt:darkBlueText_16pt,
    ),
    value: barns,
    inactiveThumbColor: Colors.white,
    activeColor: blue,//Color(0xFF348BA7),
    inactiveTrackColor: Color(0xFF707070).withOpacity(0.5),
    onChanged: (bool value) {
      setState(() {
        barns = value;
      });
      ChangeStable();
    },
  ),
  SwitchListTile(
    title: Text('إشعارات المناحل'.i18n,style: !sieves?darkGrayText_16pt:darkBlueText_16pt,
    ),
    value: sieves,
    inactiveThumbColor: Colors.white,
    activeColor: blue,//Color(0xFF348BA7),
    inactiveTrackColor: Color(0xFF707070).withOpacity(0.5),
    onChanged: (bool value) {
      setState(() {
        sieves = value;
      });
      ChangeSieves();
    },
  ),

// Container(height: getProportionateScreenHeight(50),color: Colors.red,),
// SizedBox(height: getProportionateScreenHeight(5),),
// Container(height: getProportionateScreenHeight(50),color: Colors.green,),
// SizedBox(height: getProportionateScreenHeight(5),),
// Container(height: getProportionateScreenHeight(50),color: Colors.yellow,),
],),
              SizedBox(height: getProportionateScreenHeight(15),),
              GestureDetector(
                onTap: ()async{
                  if(appLocal=="ar")
                    {
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            title: Text(
                              'هل تريد تغير اللغة الى الانكليزية ؟',
style: body1_16pt_blue,
                              textDirection:TextDirection.rtl,
                            ),
                            // content:  Text(
                            //   'أنت على وشك تغيير لغة التطبيق !!',
                            // ),
                            actions: [
                              TextButton(
                                child:  Text('لا',style: body1_16pt_blue,),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'نعم',
                                  style: body1_16pt_blue,
                                ),
                                onPressed: () async{
                                  try{
                                    // context.locale = Locale('ar');
bool k=await changeLang();
if(k)

                                    {
                                                  I18n.of(context).locale =
                                                      Locale('en');
                                                  AuthServices.setLocale('en');
                                                  restart();
                                                }
                                              }catch(e){
                                    AuthServices.setLocale('en');
                                    restart();
                                  }
                                  // language.changeLanguage();
                                  // SharedPreferenceHelper.saveLanguage(language.getLanguage);

                                  // setState(() {
                                  //   _loading=true;
                                  //   loadData();
                                  // });
                                  Navigator.of(context).pop();
                                  // Navigator.popUntil(context, ModalRoute.withName('/'));
                                },
                              ),

                            ],
                          )));

                    }
                  else{

                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          title: Text(
                             " Do you want to change app language to Arabic ?",
                            textDirection: TextDirection.ltr,
                            style: body1_16pt_blue,

                          ),
                          // content:  Text(
                          //   'you are going to change app language ',
                          //   textDirection: TextDirection.ltr,
                          // ),
                          actions: [  TextButton(
                            child:  Text('no',                            style: body1_16pt_blue,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                            TextButton(
                              child: Text(
                                'yes',
                                style: body1_16pt_blue,

                              ),
                              onPressed: () async{
                                try{

                                  bool k=await changeLang();
                                  if(k){
                                                  context.locale = Locale('ar');

                                                  I18n.of(context).locale =
                                                      Locale('ar');
                                                  AuthServices.setLocale('ar');
                                                  restart();
                                                }
                                              }catch(e){
                                  AuthServices.setLocale('ar');
                                  restart();
                                }
                                // language.changeLanguage();
                                // SharedPreferenceHelper.saveLanguage(language.getLanguage);

                                // setState(() {
                                //   _loading=true;
                                //   loadData();
                                // });
                                Navigator.of(context).pop();
                                // Navigator.popUntil(context, ModalRoute.withName('/'));
                              },
                            ),

                          ],
                        )));



                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),

                  child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                    AutoSizeText("اللغة".i18n,style: body1_16pt,),
                    AutoSizeText(appLocal=="ar"?"العربية":"English",style: body1_16pt_blue,),
                    Container(height: getProportionateScreenHeight(18),width: getProportionateScreenWidth(18), child: Directionality(
                        textDirection: appLocal=="ar"?TextDirection.ltr:TextDirection.rtl,child: Icon(Icons.arrow_back_ios,size: getProportionateScreenWidth(16),color: Colors.grey.shade600,)),)
                  ],),
                ),
              )
            ],
          ),
        ) ,
      ),
    );
  }
}
