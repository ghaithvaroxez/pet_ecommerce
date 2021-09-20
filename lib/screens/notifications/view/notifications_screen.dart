import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';
import '../../../main.dart';
import '../../loading_screen.dart';
import '../model/notifications_model.dart' as nm;
import 'package:http/http.dart' as http;
import 'notification_card.dart';
import 'notifications_screen.i18n.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  nm.NotificationsModel notification;

  filterNotifications() {
    consolePrint("Selected type " + selectedType.toString());
    if (selectedType == 0) {
      viewedNotifications.clear();
      for (int i = 0; i < allNotifications.length; i++)
        viewedNotifications.add(allNotifications[i]);
      setState(() {});
    } else if (selectedType == 1) {
      viewedNotifications.clear();
      for (int i = 0; i < allNotifications.length; i++)
        if (allNotifications[i].type == "New Offer Notification")
          viewedNotifications.add(allNotifications[i]);
      setState(() {});
    } else if (selectedType == 2) {
      consolePrint("all length =" + allNotifications.length.toString());
      viewedNotifications.clear();
      for (int i = 0; i < allNotifications.length; i++) {
        print(allNotifications[i].type);
        if (allNotifications[i].type == "New Store Notification") {
          viewedNotifications.add(allNotifications[i]);
        }
      }
      setState(() {});
    } else if (selectedType == 3) {
      viewedNotifications.clear();

      for (int i = 0; i < allNotifications.length; i++)
        if (allNotifications[i].type == "New Barn Notification")
          viewedNotifications.add(allNotifications[i]);
      setState(() {});
    } else if (selectedType == 4) {
      viewedNotifications.clear();
      for (int i = 0; i < allNotifications.length; i++)
        if (allNotifications[i].type == "New Sieve Notification")
          viewedNotifications.add(allNotifications[i]);
      setState(() {});
    } else if (selectedType == 5) {
      viewedNotifications.clear();
      for (int i = 0; i < allNotifications.length; i++)
        if (allNotifications[i].type == "New Order Notification")
          viewedNotifications.add(allNotifications[i]);
      setState(() {});
    }
    setState(() {});
  }

  int selectedType;

  bool loading = false;
  bool error = false;

  fetchData() async {
    loading = true;
    setState(() {});
    var url = Uri.parse("${Api.baseUrl}/notifications");
    final h = await HttpService().getHeaders();
    consolePrint("try to get  offdmbpfb  lvlfdbfl,lmgk mfv , fv,; bbfd");
    final apiResult = await http.get(url, headers: h);
    if (apiResult.statusCode == 200) {
      notification = nm.notificationsModelFromJson(apiResult.body);
      allNotifications = notification.notifications;
      filterNotifications();
//       for(int i=0;i<notification.notifications.length;i++){
// consolePrint(notification.notifications[i].type);
//       }

    } else {
      error = true;
    }

    loading = false;
    setState(() {});
  }

  List<nm.Notification> allNotifications = [];
  List<nm.Notification> viewedNotifications = [];

  List<String> search_types = [
    "عام".i18n,
    "عروض".i18n,
    "متاجر".i18n,
    "اسطبلات".i18n,
    "مناحل".i18n,
    // "اطباء".i18n,
    "طلبات".i18n,
  ];

  Future _buildBottomSheet(BuildContext context, Function refresh) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              // height: c_height,
              //       duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              // height:
              //     getProportionateScreenHeight(600),
              width: getProportionateScreenWidth(390),
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25),
                  vertical: getProportionateScreenHeight(15)),
              // color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        width: getProportionateScreenWidth(120),
                        height: getProportionateScreenHeight(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                "النوع".i18n,
                                style: body3_18pt,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              height: 0,
                              width: 0,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: appLocal == "ar"
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                    width: 115,
                                    height: getProportionateScreenHeight(45),
                                    padding: EdgeInsets.only(
                                        right: getProportionateScreenWidth(12),
                                        left: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.withOpacity(0.6)),
                                    ),
                                    // padding: EdgeInsets.symmetric(
                                    //     horizontal: 15),

                                    alignment: appLocal == "ar"
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Directionality(
                                      textDirection: appLocal == "ar"
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          // value: controller.storeInfo.address,
                                          // value: _value,
                                          items:
                                              search_types.map((String item) {
                                            return DropdownMenuItem<String>(
                                              value: item,
                                              child: Container(
                                                // width:
                                                // getProportionateScreenWidth(
                                                //     75),
                                                height:
                                                    getProportionateScreenHeight(
                                                        30),
                                                child: AutoSizeText(
                                                  item,
                                                  // textDirection:
                                                  // TextDirection
                                                  //     .rtl,
                                                  style: blackText_14pt,
                                                  minFontSize: 8,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (search_type) async {
                                            print("before");
                                            setState(() {
                                              selectedType //=search_type;
                                                  = search_types
                                                      .indexOf(search_type);
                                              filterNotifications();
                                              refresh();
                                            });
                                            print("after");
                                          },
                                          hint: Container(
                                            width: 60,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: AutoSizeText(
                                              search_types[selectedType],
                                              maxLines: 1,
                                              minFontSize: 9,
                                            ),
                                          ),
                                          elevation: 8,
                                          style: blackText_14pt,
                                          icon: Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      8),
                                              child: RotatedBox(
                                                  quarterTurns: 180,
                                                  child: Icon(
                                                      Icons.arrow_drop_down))),
                                          iconDisabledColor: Colors.black,
                                          iconEnabledColor: Colors.blue,
                                          // isExpanded: true,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 0,
                                width: 0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedType = 0;
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Builder(
          builder: (context) => Column(
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
                                "الاشعارات".i18n,
                                style: h5_21pt,
                                minFontSize: 8,
                              )),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              _buildBottomSheet(context, () {
                                setState(() {});
                              });
                            },
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey.shade50,
                              child: Image.asset(
                                "assets/images/home/filter_icon.png",
                                height: 24,
                                width: 20,
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
              Expanded(
                child: error
                    ? Container(
                        margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: AutoSizeText("الرجاء المحاولة مجددا".i18n),
                      )
                    : loading
                        ? LoadingScreen()
                        : Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(24),
                                vertical: getProportionateScreenHeight(26)),
                            child: viewedNotifications.length == 0
                                ? Container(
                                    height: getProportionateScreenHeight(400),
                                    width: getProportionateScreenWidth(350),
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "لا يوجد عناصر لعرضها حاليا".i18n,
                                      style: body3_18pt,
                                    ),
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(
                                        viewedNotifications.length,
                                        (index) => NotificationCard(
                                            viewedNotifications[index]),
                                      ),
                                    ),
                                  ),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
