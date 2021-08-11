import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/corner/view/select_corner.dart';

import 'package:pets_ecommerce/screens/doctors/view/select_doctor_view.dart';
import 'package:pets_ecommerce/screens/filter/view/filtter_bottom_sheet.dart';
import 'package:pets_ecommerce/screens/home/view/home_view.dart';
import 'package:pets_ecommerce/screens/main_screen/controller/title_controller.dart';
import 'package:pets_ecommerce/screens/main_screen/model/main_screen_model.dart';
import 'package:pets_ecommerce/screens/stores/view/select_stor_view.dart';
import 'package:pets_ecommerce/screens/widgets/custom_app_bar.dart';
import 'package:pets_ecommerce/screens/widgets/drawer/components/drawer_item.dart';
import 'package:pets_ecommerce/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets_ecommerce/screens/widgets/navigation_bar/custom_bottom_bar.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';
import 'package:pets_ecommerce/screens/main_screen/controller/title_controller.dart';
import 'package:pets_ecommerce/screens/orders/views/select_order_view.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/profile/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomTabController = TabController(length: 5, vsync: this);
    customTitle=new CustomTitle();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
// floatingActionButton: FloatingActionButton(
//   onPressed: (){
//       Get.bottomSheet(
//         CustomBottomSheet(),
//         barrierColor: Colors.grey.withOpacity(0.2),
//         backgroundColor: Colors.white,
//       );
//   },
// ),
    endDrawer:CustomDrawer(home: true,),
      body:   Builder(
       builder: ((context) =>Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.8,
                  child: Container(
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "assets/images/home/custom_background.png"),
                        )),
                  ),
                ),

                ///background
                Positioned(
                  top: 0,
                  left: 0,
                  child: CustomAppBar(open_drawer:(){ Scaffold.of(context).openEndDrawer();}),
                ),
                Positioned(
                  top: getProportionateScreenHeight(95),
                  height: getProportionateScreenHeight(754),
                  width: SizeConfig.screenWidth,
                  child: TabBarView(
                    controller: bottomTabController,
                    children: [
                     HomeScreen(),
                      SelectDoctorView(),
                      SelectOrderView(),
                      SelectStoreView(),
                      SelectCornerView(),
                    ],
                  ),
                ),
                Positioned(bottom:0,left:0,child:  CustomBottomBar(controller: bottomTabController,)),
              ],
            ),
          ),
        )
    )
    ),
    );
  }
}
