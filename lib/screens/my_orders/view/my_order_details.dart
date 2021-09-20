import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:pets/screens/orders/views/order_details_screen.dart';

import '../../../main.dart';
import 'translations/my_order_details.i18n.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/doctors/view/doctor_details.dart';
import 'package:pets/screens/home/view/components/social_media_components.dart';
import 'package:pets/screens/my_orders/controller/my_orders_details_controller.dart';
import 'package:pets/screens/my_orders/view/edit_order_screen.dart';
import 'package:pets/screens/orders/model/all_orders_model.dart';
import 'package:pets/screens/stores/view/store_details_id.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:http/http.dart' as http;
import 'package:pets/screens/notifications/view/notification_button.dart';

import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:get/get.dart';

class MyOrderDetailsScreen extends StatefulWidget {
  int id;

  MyOrderDetailsScreen(this.id);

  @override
  _MyOrderDetailsScreenState createState() => _MyOrderDetailsScreenState();
}

class _MyOrderDetailsScreenState extends State<MyOrderDetailsScreen> {
  Order order;
  bool loading = true;
  bool error = false;
  var orderType = "animal".obs;

  Future<bool> addAnswer(String answer) async {
    try {
      // consolePrint("product id" + productId.toString());
      var url = Uri.parse("${Api.baseUrl}/answer/order/${order.id.toString()}");
      consolePrint("before add answer print");
      consolePrint("try to post on " + url.path);

      final h = await HttpService().getHeaders();
      final apiResult =
          await http.post(url, headers: h, body: {"answer": answer});
      consolePrint("after add to favorite print");

      if (apiResult.statusCode == 200) {
        consolePrint("statusCode==200");
        // var j = jsonDecode(apiResult.body);

        await fetchData();

        return true;
      } else {
        consolePrint("statusCode!=200");

        loading = false;
        setState(() {});
        return false;
      }
    } catch (e) {
      consolePrint(e.toString());

      loading = false;
      setState(() {});
      return false;
    }
  }

  fetchData() async {
    consolePrint("fetch data");
    loading = true;
    setState(() {});

    try {
      var url = Uri.parse("${Api.baseUrl}/show/order/${widget.id}");
      final h = await HttpService().getHeaders();
      final apiResult = await http.get(url, headers: h);
      if (apiResult.statusCode == 200) {
        var d = json.decode(apiResult.body);
        consolePrint(d["order"].toString());
        order = Order.fromJson(d["order"]);
        orderType.value = order.orderType;
      } else {
        error = true;
      }

      loading = false;
      setState(() {});
    } catch (e) {
      error = true;
      loading = false;
      setState(() {});
      consolePrint(e.toString());
    }
  }

  bool answer;

  canAnswer() async {
    try {
      await fetchData();
      UserModel user = await AuthServices.getCurrentUser();
      if (((user.user.role == "user") ||
              (user.user.role == "doctor" && order.orderType == "vat") ||
              (user.user.role == "provider" && order.orderType != "vat")) &&
          (user.user.id != order.userId)) {
        answer = true;
      } else
        answer = false;
    } catch (e) {
      e.toString();
    }
  }

  @override
  void initState() {
    canAnswer();
    myOrdersDetailsController = Get.put(MyOrdersDetailsController(widget.id));
    // TODO: implement initState
    super.initState();
    consolePrint("initial state of get productas ");
  }

  MyOrdersDetailsController myOrdersDetailsController;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(() =>
              EditOrderScreen(order, myOrdersDetailsController, fetchData));
        },
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/profile/edit_icon.png")),
          ),
          // child: FloatingActionButton(

          // backgroundColor: Colors.transparent,
          // onPressed: null,
          // tooltip: 'Inbox',
          // child: Image.asset(
          //   "assets/images/profile/edit_icon.png",
          //   fit: BoxFit.fill,
          // ),
          // ),
        ),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: loading
            ? LoadingScreen()
            : Builder(
                builder: (context) => SingleChildScrollView(
                  child: Column(
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
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
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
                                      child: AutoSizeText(
                                        "تفاصيل الطلب".i18n,
                                        style: h5_21pt,
                                        minFontSize: 8,
                                      )),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Colors.grey.shade50,
                                      child: Directionality(
                                          textDirection: appLocal == "ar"
                                              ? TextDirection.ltr
                                              : TextDirection.rtl,
                                          child: Center(
                                              child: Icon(
                                            Icons.arrow_back_ios,
                                            color: Color(0xFF707070),
                                            size: 20,
                                          ))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(24),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(22)),
                        width: getProportionateScreenWidth(345),
                        height: getProportionateScreenHeight(350),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // boxShadow: shadow,

                            ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: getProportionateScreenWidth(345),
                                  height: getProportionateScreenHeight(198),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      color: Colors.white),
                                  child:
                                      order.image == null || order.image == ""
                                          ? Container(
                                              child: Center(
                                                child: AutoSizeText(
                                                  "Image",
                                                  style: h5_24pt,
                                                ),
                                              ),
                                            )
                                          : ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                              child: Image.network(
                                                Api.imagePath + order.image,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                )),
                            Positioned(
                              top: getProportionateScreenHeight(192),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(10),
                                    vertical: getProportionateScreenHeight(10)),
                                // height: getProportionateScreenHeight(75),
                                width: getProportionateScreenWidth(345),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(
                                      12,
                                    ),
                                    bottomRight: Radius.circular(
                                      12,
                                    ),
                                  ),
                                  color: Color(0xFFE4F2F6),
                                ),

                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: getProportionateScreenHeight(10),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenHeight(35),
                                          width:
                                              getProportionateScreenWidth(220),
                                          // alignment: Alignment.centerRight,
                                          child: AutoSizeText(
                                            order.title,
                                            style: body3_18pt,
                                            minFontSize: 9,
                                          ),
                                        ),
                                        Container(
                                          height:
                                              getProportionateScreenHeight(22),
                                          width:
                                              getProportionateScreenWidth(100),
                                          // alignment: Alignment.centerRight,
                                          child: AutoSizeText(
                                            // "السعر المتوقع: "+
                                            order.price.toString() + " \$ ",
                                            style: body3_18pt,
                                            minFontSize: 6,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: getProportionateScreenHeight(10),),
                                    Container(
                                      // height: getProportionateScreenHeight(75),
                                      child: Container(
                                          height: 30,
                                          width:
                                              getProportionateScreenWidth(320),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              appLocal == "ar"
                                                                  ? Alignment
                                                                      .bottomRight
                                                                  : Alignment
                                                                      .bottomLeft,

                                                          // color: Colors.red,
                                                          // alignment: Alignment.centerRight,
                                                          height: 12,
                                                          child: Image.asset(
                                                            "assets/images/drawer/drawer_icons/category_icon.png",
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        //
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              15),
                                                    ),
                                                    Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                          alignment:
                                                              appLocal == "ar"
                                                                  ? Alignment
                                                                      .centerRight
                                                                  : Alignment
                                                                      .centerLeft,
                                                          height: 25,
                                                          child: AutoSizeText(
                                                            order.orderType
                                                                        .toString() ==
                                                                    "animal"
                                                                ? "حيوانات".i18n
                                                                : "استطباب"
                                                                    .i18n,
                                                            style:
                                                                darkGrayText_14pt,
                                                            maxLines: 1,

                                                            // minFontSize: 9,
                                                            // textDirection: TextDirection.rtl
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                alignment: Alignment.center,
                                                child: AutoSizeText(
                                                  order.categoryName,
                                                  style: body2_14pt,
                                                ),
                                              )),
                                              Expanded(
                                                  child: Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            Container(
                                                              alignment: appLocal ==
                                                                      "ar"
                                                                  ? Alignment
                                                                      .bottomRight
                                                                  : Alignment
                                                                      .bottomLeft,
                                                              height: 12,
                                                              child: Image.asset(
                                                                  "assets/images/home/clock_icon.png"),
                                                            ),
                                                          ],
                                                        )),
                                                    SizedBox(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              5),
                                                    ),
                                                    Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 3),
                                                          alignment:
                                                              appLocal == "ar"
                                                                  ? Alignment
                                                                      .centerRight
                                                                  : Alignment
                                                                      .centerLeft,
                                                          height: 25,
                                                          child: AutoSizeText(
                                                            order.date
                                                                .toString(),
                                                            style:
                                                                darkGrayText_13pt,
                                                            minFontSize: 5,
                                                            // textDirection: TextDirection.rtl
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              )),
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(345),
                                      // height: getProportionateScreenHeight(50),
                                      child: AutoSizeText(
                                        order.question,
                                        style: darkGrayText_14pt,
                                        minFontSize: 9,
                                      ),
                                    ),
                                    // SizedBox(height: getProportionateScreenHeight(8),),
                                  ],
                                ),
                              ),
                            ),
                            // Positioned(
                            //   top: getProportionateScreenHeight(192),
                            //   child:  Container(
                            //     padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
                            //     // height: getProportionateScreenHeight(75),
                            //     width: getProportionateScreenWidth(345),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.only(topRight:  Radius.circular(12),
                            //         topLeft: Radius.circular(12,),bottomRight: Radius.circular(12,),),
                            //
                            //       color: Color(0xFFE4F2F6), ),
                            //
                            //     child: Column(
                            //       children: [
                            //         SizedBox(height: getProportionateScreenHeight(10),),
                            //         Row(
                            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Container(
                            //               height: getProportionateScreenHeight(35),
                            //               width: getProportionateScreenWidth(220),
                            //               alignment: Alignment.centerRight,
                            //               child: AutoSizeText(
                            //                 order.title,//+"mdfpm dspf mdspfmpd smfpd smfpds mfpmdslfp ms dplfm dfdsfdsf f dsf ds fds f fs df dfdfdfdf",
                            //                 style: body3_18pt,
                            //                 minFontSize: 9,
                            //                 maxLines: 2,
                            //               ),
                            //             ),
                            //             Container(
                            //               height: getProportionateScreenHeight(22),
                            //               width: getProportionateScreenWidth(100),
                            //               alignment: Alignment.centerRight,
                            //               child: AutoSizeText(
                            //                 // "السعر المتوقع: "+
                            //                     order.price.toString()+" \$ ",
                            //                 style: body3_18pt,
                            //                 minFontSize: 6,
                            //               ),
                            //             ),
                            //
                            //           ],
                            //         ),
                            //         // SizedBox(height: getProportionateScreenHeight(10),),
                            //         Container(
                            //
                            //           // height: getProportionateScreenHeight(75),
                            //           child:  Container(
                            //               height: getProportionateScreenHeight(30),
                            //               width: getProportionateScreenWidth(320),
                            //               alignment: Alignment.center,
                            //               child: Row(
                            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //
                            //                   Expanded(child: Container(child: Row(
                            //                     children: [
                            //                       Container(
                            //                         // color: Colors.red,
                            //                         alignment: Alignment.centerRight,
                            //                         height: getProportionateScreenHeight(12),
                            //                         child: Image.asset(
                            //                           "assets/images/drawer/drawer_icons/category_icon.png",fit: BoxFit.fitHeight,),
                            //                       ),
                            //                       SizedBox(width: getProportionateScreenWidth(15),),
                            //                       Expanded(
                            //                           flex: 3,
                            //                           child: Container(
                            //                             alignment: Alignment.centerRight,
                            //                             height: getProportionateScreenHeight(getProportionateScreenHeight(25)),
                            //                             child: Obx(()=>
                            //                               AutoSizeText(orderType.value=="animal"?"حيوانات".i18n:"استطباب".i18n,
                            //                                   style: darkGrayText_14pt,
                            //                                   // minFontSize: 9,
                            //                                   textDirection: TextDirection.rtl),
                            //                             ),
                            //                           )),
                            //
                            //                     ],
                            //                   ),)),
                            //                   Expanded(child:  Container(child: AutoSizeText(order.categoryName,style: body2_14pt,),)),
                            //                   Expanded(child:  Container(child:  Row(
                            //                     children: [
                            //                       Expanded(
                            //                           flex: 1,
                            //                           child: Container(
                            //                             height: getProportionateScreenHeight(12),
                            //                             child: Image.asset(
                            //                                 "assets/images/home/clock_icon.png"),
                            //                           )),
                            //                       SizedBox(width: getProportionateScreenWidth(5),),
                            //                       Expanded(
                            //                           flex: 3,
                            //                           child: Container(
                            //                             height: getProportionateScreenHeight(20),
                            //                             child: AutoSizeText(order.date.toString(),
                            //                                 style: darkGrayText_11pt,
                            //                                 minFontSize: 5,
                            //                                 textDirection: TextDirection.rtl),
                            //                           )),
                            //
                            //                     ],
                            //                   ),)),
                            //                 ],
                            //               )
                            //           ),
                            //         ),
                            //         SizedBox(height: getProportionateScreenHeight(5),),
                            //         Container(width: getProportionateScreenWidth(345),
                            //           // height: getProportionateScreenHeight(50),
                            //           child: AutoSizeText(order.question,style: darkGrayText_14pt,minFontSize: 9,),),
                            //         // SizedBox(height: getProportionateScreenHeight(8),),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
// SizedBox(height: getProportionateScreenHeight(24),),
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Container(
                        height: getProportionateScreenHeight(30),
                        width: getProportionateScreenWidth(345),
                        alignment: Alignment.centerRight,
                        child: AutoSizeText(
                          "الردود".i18n,
                          style: body3_18pt,
                        ),
                      ),
//                   !answer?Container(width: 0,height: 0,):
//                   GestureDetector(
//                     onTap: ()async{
//                       // final ratingDialog= RatingDialog(
//                       //       // your app's name?
//                       //       title: storeModel.store.name,
//                       //       ratingColor: Color(0xFF49C3EA).withOpacity(0.8),
//                       //       // encourage your user to leave a high rating?
//                       //       message:
//                       //       'ماهو تقيمك لهذا الطبيب  ؟',
//                       //       commentHint: 'اخبرنا برئيك عن هذا الطبيب',
//                       //       // your app's logo?
//                       //       // image: Container(
//                       //       //   color: ,
//                       //       // ),
//                       //       submitButton: 'متابعة',
//                       //       onCancelled: () => Get.back(),
//                       //       onSubmitted: (response) async{
//                       //         print('rating: ${response.rating}, comment: ${response.comment}');
//                       //         await addReview(response.comment, response.rating);
//                       //       },
//                       //     );
//                       String ans;
//                       // Get.dialog(
//                       //     AlertDialog(
//                       //         content:Column(
//                       //           mainAxisSize: MainAxisSize.min,
//                       //           children: [
//                       //             Container(alignment: Alignment.center,height: getProportionateScreenHeight(40),width: getProportionateScreenWidth(250),
//                       //             child: AutoSizeText("ادخل ردك على هذا الطلب",style: body1_16pt_bold,),),
//                       //           Container(width: getProportionateScreenWidth(250),height: getProportionateScreenHeight(60),child: TextField(
//                       //             onChanged: (v){
//                       //               ans=v;
//                       //               print(ans);
//                       //             },
//                       //           ),),
//                       //             Container(width:getProportionateScreenWidth(250),child: Row(
//                       //               children: [
//                       //                 RaisedButton(
//                       //                   child: Text('نشر الرد',),
//                       //                   onPressed: ()async{
//                       //                     bool k=await addAnswer(ans);
//                       //                     if(!k)
//                       //                     {
//                       //                       Get.rawSnackbar(message: "حدثت مشكلة حاول مجدداً",backgroundColor: Colors.red);
//                       //                     }
//                       //                   },
//                       //                   // ** result: returns this value up the call stack **
//                       //                 ),
//                       //                 SizedBox(width: 5,),
//                       //                 RaisedButton(
//                       //                   child: Text('العودة'),
//                       //                   onPressed: () => Get.back(
//                       //                   ),
//                       //                 ),
//                       //               ],
//                       //             ))
//                       //           ],
//                       //         )
//                       //     )
//                       // );
// // ));
//                       showDialog(
//                           context: context,
//                           builder: ((context) => AlertDialog(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(5)),
//                             title:  Text(
//                               'ادخل ردك على هذا الطلب',
//                               textDirection: TextDirection.rtl,
//                               style: body3_18pt,
//                             ),
//                             content:
//                             Container(width: getProportionateScreenWidth(250),height: getProportionateScreenHeight(60),child: TextField(
//                               onChanged: (v){
//                                 ans=v;
//                                 print(ans);
//                               },
//                             ),),
//                             actions: [
//                               TextButton(
//                                 child: Text('العودة',style: GoogleFonts.tajawal(color: Colors.red.withOpacity(0.6)),),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                   // Navigator.pop(context);
//                                 },
//                               ),
//                               TextButton(
//                                 child:  Text(
//                                   'نشر الرد',style: GoogleFonts.tajawal(
//                                     color: Colors.blue.withOpacity(0.6)
//                                 ),
//                                 ),
//                                 onPressed: () async{
//                                   Get.back();
//                                   bool k=await addAnswer(ans);
//                                   if(!k)
//                                   {
//                                     Get.rawSnackbar(message: "حدثت مشكلة حاول مجدداً",backgroundColor: Colors.red);
//                                   }
//                                 },
//
//                                 // language.changeLanguage();
//                                 // Navigator.of(context).pop();
//                                 // await  LocalStorageService.prefs.clear();
//                                 // Get.offAll(SplashScreen());
//                                 // Navigator.popUntil(context, ModalRoute.withName('/'));
//                               ),
//
//                             ],
//                           )));
//                       //     showDialog(context: context, builder: (context)=>ratingDialog);
//
//                     },
//                     child: Container(
//                       width: getProportionateScreenWidth(345),
//                       height: getProportionateScreenHeight(110),
//                       margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Color(0xFFF9F9F9),
//                           boxShadow: shadow
//                       ),
//                       child: Center(
//                         child: Column(
//
//                           children: [
//                             Icon(Icons.add,color: Color(0xFFE4F2F6) ,),
//                             AutoSizeText("انقر لإضافة ردك ",style: darkGrayText_14pt,)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
                      order.answers.length == 0
                          ? Container(
                              alignment: Alignment.center,
                              width: getProportionateScreenWidth(250),
                              height: getProportionateScreenHeight(250),
                              child: AutoSizeText(
                                "لا يوجد عناصر لعرضها حالياً".i18n,
                                style: body1_16pt,
                              ),
                            )
                          : Column(
                              children: [
                                ...List<Widget>.generate(
                                  order.answers.length,
                                  (index) => AnswerCard(
                                      order.answers[index], false, () async {}),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
