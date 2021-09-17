import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/size_config.dart';

import 'package:pets/screens/main_screen/model/main_screen_model.dart';
import 'custom_bottom_bar.i18n.dart';
class CustomBottomBar extends StatefulWidget {
  final TabController controller;

  const CustomBottomBar({Key key, this.controller}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    home = aHome;
    orders = naOrders;
    doctors = naDoctors;
    stores = naStores;
    corners=naCorners;

    homeStyle = activeTextStyle;
    storesStyle = notActiveTextStyle;
    ordersStyle = notActiveTextStyle;
    doctorsStyle = notActiveTextStyle;
    cornersStyle=notActiveTextStyle;
    bottomTabController.addListener(() {
      switch (bottomTabController.index) {
        case 0:
          {
            setState(() {
              stores = naStores;
              home = aHome;
              doctors = naDoctors;
              orders = naOrders;
              storesStyle = notActiveTextStyle;
              homeStyle = activeTextStyle;
              doctorsStyle = notActiveTextStyle;
              ordersStyle = notActiveTextStyle;
              cornersStyle = notActiveTextStyle;
              corners=naCorners;
              customTitle.updateTitle("الرئيسية".i18n);
            });
          }
          break;

        case 1:
          {
            setState(() {
              stores = naStores;
              home = naHome;
              doctors = aDoctors;
              orders = naOrders;
              storesStyle = notActiveTextStyle;
              homeStyle = notActiveTextStyle;
              doctorsStyle = activeTextStyle;
              ordersStyle = notActiveTextStyle;
              cornersStyle = notActiveTextStyle;
              corners=naCorners;
              customTitle.updateTitle("الاطباء".i18n);
            });
          }
          break;
        case 2:
          {
            setState(() {
              stores = naStores;
              home = naHome;
              doctors = naDoctors;
              orders = aOrders;
              storesStyle = notActiveTextStyle;
              homeStyle = notActiveTextStyle;
              doctorsStyle = notActiveTextStyle;
              ordersStyle = activeTextStyle;
              cornersStyle = notActiveTextStyle;
              corners=naCorners;
              customTitle.updateTitle("الطلبات".i18n);
            });
          }
          break;
        case 3:
          {
            setState(() {
              stores = aStores;
              home = naHome;
              doctors = naDoctors;
              orders = naOrders;
              storesStyle = activeTextStyle;
              homeStyle = notActiveTextStyle;
              doctorsStyle = notActiveTextStyle;
              ordersStyle = notActiveTextStyle;
              cornersStyle = notActiveTextStyle;
              corners=naCorners;
              customTitle.updateTitle("المتاجر".i18n);
            });
          }
          break;
        case 4:
          {

            setState(() {
              corners=aCorners;
              stores = naStores;
              home = naHome;
              doctors = naDoctors;
              orders = naOrders;
              cornersStyle = activeTextStyle;
              storesStyle = notActiveTextStyle;
              homeStyle = notActiveTextStyle;
              doctorsStyle = notActiveTextStyle;
              ordersStyle = notActiveTextStyle;
              customTitle.updateTitle("الزوايا".i18n);
            });
          }
          break;

        default:
          {
            setState(() {
              stores = naStores;
              home = aHome;
              doctors = naDoctors;
              orders = naOrders;
              storesStyle = notActiveTextStyle;
              homeStyle = activeTextStyle;
              doctorsStyle = notActiveTextStyle;
              ordersStyle = notActiveTextStyle;
              customTitle.updateTitle( "الرئيسية".i18n);
            });
            bottomTabController.animateTo(0);
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(70),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18),
          topLeft: Radius.circular(18),
        ),
        color: Colors.white,
        boxShadow: shadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: (){                  widget.controller.animateTo(0, curve: Curves.easeInCubic);
            },
            child: Container(
              height: getProportionateScreenHeight(60),
              child:
              // IconButton(
              //   icon:
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      height: getProportionateScreenHeight(17),
                      // width: getProportionateScreenWidth(20),
                      child: Image.asset(
                        home,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(25),
                      child: AutoSizeText(
                        "الرئيسية".i18n,
                        minFontSize: 4,
                        style: homeStyle,
                        // textDirection: TextDirection.rtl,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              //   onPressed: () {
              //     widget.controller.animateTo(0, curve: Curves.easeInCubic);
              //   },
              // ),
            ),
          ),
          GestureDetector(
            onTap: (){
              widget.controller.animateTo(1, curve: Curves.bounceIn);
            },
            child: Container(
              height: getProportionateScreenHeight(60),
              child:
              // IconButton(
              //   icon:
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      height: getProportionateScreenHeight(17),
                      // width: getProportionateScreenWidth(20),
                      child: Image.asset(
                        doctors,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        height: getProportionateScreenHeight(25),
                        child: AutoSizeText(
                          "الاطباء".i18n,
                          minFontSize: 4,
                          style: doctorsStyle,
                          // textDirection: TextDirection.rtl,
                        )),
                    Spacer(),
                  ],
                ),
              //   onPressed: () {
              //     widget.controller.animateTo(1, curve: Curves.bounceIn);
              //   },
              // ),
            ),
          ),
          GestureDetector(
            onTap: (){widget.controller.animateTo(2, curve: Curves.bounceIn);},
            child: Container(
              height: getProportionateScreenHeight(60),
              child:
              // IconButton(
              //   icon:
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      height: getProportionateScreenHeight(17),
                      // width: getProportionateScreenWidth(20),
                      child: Image.asset(
                        orders,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        height: getProportionateScreenHeight(25),
                        child: AutoSizeText(
                          "الطلبات".i18n,
                          minFontSize: 4,
                          style: ordersStyle,
                          // textDirection: TextDirection.rtl,
                        )),
                    Spacer(),
                  ],
                ),
              //   onPressed: () {
              //     widget.controller.animateTo(2, curve: Curves.bounceIn);
              //   },
              // ),
            ),
          ),
          GestureDetector(
            onTap: (){  widget.controller.animateTo(3, curve: Curves.bounceIn);},
            child: Container(
              height: getProportionateScreenHeight(60),
              child:
              // IconButton(
                // iconSize: getProportionateScreenHeight(35),
                // icon:
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      height: getProportionateScreenHeight(17),
                      // width: getProportionateScreenWidth(20),
                      child: Image.asset(
                        stores,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        height: getProportionateScreenHeight(25),
                        child: AutoSizeText(
                          "المتاجر".i18n,
                          minFontSize: 4,
                          style: storesStyle,
                          // textDirection: TextDirection.rtl,
                        )),
                    Spacer(),
                  ],
                ),
                // onPressed: () {

                // },
              // ),
            ),
          ),
          GestureDetector(
            onTap: (){  widget.controller.animateTo(4, curve: Curves.bounceIn);},
            child: Container(
              height: getProportionateScreenHeight(60),
              child:
              // IconButton(
                // iconSize: getProportionateScreenHeight(35),
                // icon:
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                      height: getProportionateScreenHeight(17),
                      // width: getProportionateScreenWidth(20),
                      child: Image.asset(
                        corners,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        height: getProportionateScreenHeight(25),
                        child: AutoSizeText(
                          "الزوايا".i18n,
                          minFontSize: 4,
                          style: cornersStyle,
                          // textDirection: TextDirection.rtl,
                        )),
                    Spacer(),
                  ],
                ),
                // onPressed: () {

                // },
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
