import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/auth/view/splash/login_or_register.dart';
import 'package:pets/screens/doctors/view/doctor_details.dart';
import 'package:pets/screens/home/view/components/social_media_components.dart';
import 'package:pets/screens/orders/model/all_orders_model.dart';
import 'package:pets/screens/stores/view/store_details_id.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:get/get.dart';
import 'translations/order_details_screen.i18n.dart';

class OrderDetailsScreen extends StatefulWidget {
  int id;

  OrderDetailsScreen(this.id);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  Order order;
  bool loading = true;
  bool error = false;

  deleteAnswer(int answerId) async {
    loading = true;
    setState(() {});
    try {
      var url =
          Uri.parse("${Api.baseUrl}/delete/answer/${answerId.toString()}");
      consolePrint("before add answer print");
      consolePrint("try to post on " + url.path);

      final h = await HttpService().getHeaders();
      final apiResult = await http.get(
        url, headers: h,
        //     body:{
        //   "answer":answer
        // }
      );
      consolePrint("after add to favorite print");
      print("++++++++++++++++++++++++++++++++++++" +
          apiResult.statusCode.toString() +
          "delete ANSWER");
      print("++++++++++++++++++++++++++++++++++++" +
          apiResult.body.toString() +
          "delete ANSWER");

      if (apiResult.statusCode == 200) {
        consolePrint("statusCode==200");
        // var j = jsonDecode(apiResult.body);

        // try{
        await fetchData();
        // }catch(e){
        //         consolePrint(e.toString());
        //       }
        Get.rawSnackbar(
            message: "لقد تم حذف الرد بنجاح".i18n,
            backgroundColor: Colors.green.withOpacity(0.8));
        loading = false;
        setState(() {});
        return;
        // return true;
      } else {
        consolePrint("statusCode!=200");

        loading = false;
        setState(() {});
        Get.rawSnackbar(
            message: "لم نتمكن من حذف ردك الان الرجاء المحاولة لاحقا".i18n,
            backgroundColor: Colors.red.withOpacity(0.8));

        // return false;
      }
    } catch (e) {
      consolePrint(e.toString());
      Get.rawSnackbar(
          message: "لم نتمكن من حذف ردك الان الرجاء المحاولة لاحقا".i18n,
          backgroundColor: Colors.red.withOpacity(0.8));
    }
  }

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

    // try {
    var url = Uri.parse("${Api.baseUrl}/show/order/${widget.id}");
    consolePrint("${Api.baseUrl}/show/order/${widget.id}");
    final h = await HttpService().getHeaders();
    final apiResult = await http.get(url, headers: h);
    if (apiResult.statusCode == 200) {
      var d = json.decode(apiResult.body);
      consolePrint(d["order"].toString());
      order = Order.fromJson(d["order"]);
    } else {
      error = true;
    }

    loading = false;
    setState(() {});
    // } catch (e) {
    //   error = true;
    //   loading = false;
    //   setState(() {});
    //   consolePrint("fetch data error "+e.toString());
    // }
  }

  bool answer = false;
  UserModel user;

  canAnswer() async {
    try {
      await fetchData();
      user = await AuthServices.getCurrentUser();
      if (((user.user.role == "user" && gusetId != 146) ||
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

    // TODO: implement initState
    super.initState();
    consolePrint("initial state of get productas ");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: loading
            ? LoadingScreen()
            : error
                ? Container(
                    height: getProportionateScreenHeight(700),
                    width: getProportionateScreenWidth(390),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "الرجاء المحاولة مجدداً".i18n,
                      style: body3_18pt,
                    ),
                  )
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
                                          height:
                                              getProportionateScreenHeight(28),
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
                                          child: RotatedBox(
                                            quarterTurns:
                                                appLocal == "ar" ? 0 : 90,
                                            child: Center(
                                              child: Opacity(
                                                opacity: 0.6,
                                                child: Image.asset(
                                                  "assets/images/vendor_app/back_icon.png",
                                                  height: 24,
                                                  width: 20,
                                                ),
                                              ),
                                            ),
                                          ),
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
                                      child: order.image == null ||
                                              order.image == ""
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
                                        horizontal:
                                            getProportionateScreenWidth(10),
                                        vertical:
                                            getProportionateScreenHeight(10)),
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
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      35),
                                              width:
                                                  getProportionateScreenWidth(
                                                      220),
                                              // alignment: Alignment.centerRight,
                                              child: AutoSizeText(
                                                order.title,
                                                style: body3_18pt,
                                                minFontSize: 9,
                                              ),
                                            ),
                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      22),
                                              width:
                                                  getProportionateScreenWidth(
                                                      100),
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
                                                  getProportionateScreenWidth(
                                                      320),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                              alignment: appLocal ==
                                                                      "ar"
                                                                  ? Alignment
                                                                      .bottomRight
                                                                  : Alignment
                                                                      .bottomLeft,

                                                              // color: Colors.red,
                                                              // alignment: Alignment.centerRight,
                                                              height: 12,
                                                              child:
                                                                  Image.asset(
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
                                                              alignment: appLocal ==
                                                                      "ar"
                                                                  ? Alignment
                                                                      .centerRight
                                                                  : Alignment
                                                                      .centerLeft,
                                                              height: 25,
                                                              child:
                                                                  AutoSizeText(
                                                                order.orderType
                                                                            .toString() ==
                                                                        "animal"
                                                                    ? "حيوانات"
                                                                        .i18n
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
                                                                  child: Image
                                                                      .asset(
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
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          3),
                                                              alignment: appLocal ==
                                                                      "ar"
                                                                  ? Alignment
                                                                      .centerRight
                                                                  : Alignment
                                                                      .centerLeft,
                                                              height: 25,
                                                              child:
                                                                  AutoSizeText(
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
                                          height:
                                              getProportionateScreenHeight(5),
                                        ),
                                        Container(
                                          width:
                                              getProportionateScreenWidth(345),
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
                            // alignment: Alignment.centerRight,
                            child: AutoSizeText(
                              "الردود".i18n,
                              style: body3_18pt,
                            ),
                          ),
                          !answer
                              ? Container(
                                  width: 0,
                                  height: 0,
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    if (gusetId == 146) {
                                      showDialog(
                                          context: context,
                                          builder: ((context) => AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                title: Text(
                                                  'يجب عليك تسجيل حساب اولاً '
                                                      .i18n,
                                                  // textDirection: TextDirection.rtl,
                                                  style: body3_18pt,
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: Text(
                                                      'العودة'.i18n,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                              color: Colors.red
                                                                  .withOpacity(
                                                                      0.6)),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      return;
                                                      // Navigator.pop(context);
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text(
                                                      'تسجيل حساب'.i18n,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                              color: Colors.blue
                                                                  .withOpacity(
                                                                      0.6)),
                                                    ),
                                                    onPressed: () async {
                                                      Get.back();
                                                      Get.offAll(
                                                          LoginOrRegister());
                                                      return;
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
                                    String ans;
                                    showDialog(
                                        context: context,
                                        builder: ((context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              title: Text(
                                                'ادخل ردك على هذا الطلب'.i18n,
                                                // textDirection: TextDirection.rtl,
                                                style: body3_18pt,
                                              ),
                                              content: Container(
                                                width:
                                                    getProportionateScreenWidth(
                                                        250),
                                                height:
                                                    getProportionateScreenHeight(
                                                        60),
                                                child: TextField(
                                                  onChanged: (v) {
                                                    ans = v;
                                                    print(ans);
                                                  },
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: Text(
                                                    'العودة'.i18n,
                                                    style: GoogleFonts.tajawal(
                                                        color: Colors.red
                                                            .withOpacity(0.6)),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    // Navigator.pop(context);
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text(
                                                    'نشر الرد'.i18n,
                                                    style: GoogleFonts.tajawal(
                                                        color: Colors.blue
                                                            .withOpacity(0.6)),
                                                  ),
                                                  onPressed: () async {
                                                    if (ans == "" ||
                                                        ans == null) {
                                                      Get.rawSnackbar(
                                                          message:
                                                              "الرد لا يمكن ان يكون فارغاً"
                                                                  .i18n,
                                                          backgroundColor:
                                                              Colors.red);
                                                      return;
                                                    }
                                                    Get.back();
                                                    bool k =
                                                        await addAnswer(ans);
                                                    if (!k) {
                                                      Get.rawSnackbar(
                                                          message:
                                                              "حدثت مشكلة حاول مجدداً"
                                                                  .i18n,
                                                          backgroundColor:
                                                              Colors.red);
                                                    }
                                                  },

                                                  // language.changeLanguage();
                                                  // Navigator.of(context).pop();
                                                  // await  LocalStorageService.prefs.clear();
                                                  // Get.offAll(SplashScreen());
                                                  // Navigator.popUntil(context, ModalRoute.withName('/'));
                                                ),
                                              ],
                                            )));
                                    //     showDialog(context: context, builder: (context)=>ratingDialog);
                                  },
                                  child: Container(
                                    width: getProportionateScreenWidth(345),
                                    height: getProportionateScreenHeight(110),
                                    margin: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(10)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xFFF9F9F9),
                                        boxShadow: shadow),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: Color(0xFFE4F2F6),
                                          ),
                                          AutoSizeText(
                                            "انقر لإضافة ردك ".i18n,
                                            style: darkGrayText_14pt,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                                                order.answers[index],
                                                order.answers[index]
                                                            .answeredId ==
                                                        user.user.id
                                                    ? true
                                                    : false, () async {
                                              await deleteAnswer(
                                                  order.answers[index].id);
                                            })),
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

class AnswerCard extends StatefulWidget {
  AnswerCard(this.answer, this.canDelete, this.deleteAnswer);

  Answer answer;
  bool canDelete;
  Function deleteAnswer;

  @override
  _AnswerCardState createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  String fb, wa, ins;
  bool bfb = true, bwa = true, bins = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < widget.answer.socials.length; i++) {
      if (widget.answer.socials[i].type == "facebook" && bfb == true) {
        fb = widget.answer.socials[i].link;
        bfb = false;
      } else if (widget.answer.socials[i].type == "phone" && bwa == true) {
        wa = widget.answer.socials[i].link;
        bwa = false;
      } else if (widget.answer.socials[i].type == "instagram" && bins == true) {
        ins = widget.answer.socials[i].link;
        bins = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.answer.answeredType == "Store") {
          Get.to(StoreDetailsById(widget.answer.answeredStoreId));
        } else if (widget.answer.answeredType == "Doctor") {
          Get.to(DoctorDetailsPage(widget.answer.answeredId));
        }
      },
      child: Container(
        width: getProportionateScreenWidth(345),
        height: getProportionateScreenHeight(110),
        margin:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFFF9F9F9),
            boxShadow: shadow),
        child: Row(
          children: [
            Container(
              width: getProportionateScreenWidth(95),
              height: getProportionateScreenHeight(110),
              decoration: BoxDecoration(
                borderRadius: appLocal == "ar"
                    ? BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12))
                    : BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                color: Colors.white,
              ),
              child: ClipRRect(
                  borderRadius: appLocal == "ar"
                      ? BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12))
                      : BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                  child: Image.network(
                    widget.answer.answeredType == "Store"
                        ? Api.imagePath + widget.answer.answeredStoreImage
                        : Api.imagePath + widget.answer.answeredImage,
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(6),
                ),
                Row(
                  children: [
                    Container(
                      width: getProportionateScreenWidth(210),
                      height: getProportionateScreenHeight(20),
                      child: AutoSizeText(
                        widget.answer.answeredType == "Store"
                            ? widget.answer.answeredStoreName
                            : widget.answer.userName.toString(),
                        style: body1_16pt,
                      ),
                    ),
                    // widget.answer.answeredId==user.user.id?
                    widget.canDelete
                        ? Container(
                            height: getProportionateScreenHeight(30),
                            width: getProportionateScreenWidth(30),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            title: Text(
                                              'هل أنت متأكد ؟'.i18n,
                                              // textDirection: TextDirection.rtl,
                                              style: body3_18pt,
                                            ),
                                            content: Text(
                                              'انت على وشك حذف هذا الرد !'.i18n,
                                              // textDirection: TextDirection.rtl,
                                              style: body1_16pt,
                                            ),
                                            actions: [
                                              TextButton(
                                                child: Text(
                                                  'نعم'.i18n,
                                                ),
                                                onPressed: () async {
                                                  // language.changeLanguage();
                                                  Navigator.of(context).pop();
                                                  await widget.deleteAnswer();
                                                  // Navigator.popUntil(context, ModalRoute.withName('/'));
                                                },
                                              ),
                                              TextButton(
                                                child: Text('لا'.i18n),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          )));
                                },
                                child: Image.asset(
                                  "assets/images/vendor_app/trash.png",
                                  fit: BoxFit.fill,
                                )))
                        : Container(
                            width: 0,
                            height: 0,
                          )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(4),
                ),
                Container(
                  width: getProportionateScreenWidth(220),
                  height: getProportionateScreenHeight(36),
                  child: AutoSizeText(
                    widget.answer.answer.toString(),
                    style: darkGrayText_13pt,
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(240),
                  height: getProportionateScreenHeight(34),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          SocialMedia(
                            wa: wa,
                            fb: fb,
                            ins: ins,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(2),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(2),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
