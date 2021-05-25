import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/widgets/navigation_bar/components/navigation_bar_active_icon.dart';
import 'package:pets_ecommerce/screens/widgets/navigation_bar/components/navigation_bar_icon.dart';



class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  int myindex=0;
  Widget build(BuildContext context) {
    return
      BottomNavigationBar(
        backgroundColor:  Colors.black,
        items: [


      BottomNavigationBarItem(activeIcon:
      Container(
        child: Column(
          children: [
            Image.asset(
              "assets/images/bottom_navigation_bar/navigation_selected_store_icon.png",
              width: 16,
              height: 14,
            ),

            // SizedBox(height: 2,),
            AutoSizeText(
              "المتاجر",
              minFontSize: 4,
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),label: "",icon: Container(child: Column(
        children: [
          Image.asset("assets/images/bottom_navigation_bar/navigation_store_icon.png",width: 16,height: 14,),

        // SizedBox(height: 2,),
          AutoSizeText("المتاجر",minFontSize: 4,style: TextStyle(color: Colors.grey),),
        ],
      ),),),

      BottomNavigationBarItem(label: "",activeIcon: Column(
        children: [
          Image.asset("assets/images/bottom_navigation_bar/navigation_selected_oreders_icon.png",width: 16,height: 14,),

          // SizedBox(height: 2,),
          AutoSizeText("الطلبات",minFontSize: 4,style: TextStyle(color: Colors.blue),),
        ],
      ),
        icon: Column(
        children: [
          Image.asset("assets/images/bottom_navigation_bar/navigation_oreders_icon.png",width: 16,height: 14,),

          // SizedBox(height: 2,),
          AutoSizeText("الطلبات",minFontSize: 4,style: TextStyle(color: Colors.grey),),
        ],
      ),),
          BottomNavigationBarItem(label: "blalba",
            activeIcon: Column(
              children: [
                Image.asset("assets/images/bottom_navigation_bar/navigation_selected_doctor_icon.png",width: 16,height: 14,),

                // SizedBox(height: 2,),
                AutoSizeText("الاطباء",minFontSize: 4,style: TextStyle(color: Colors.blue),),
              ],
            ),
            icon: Column(
        children: [
          Image.asset("assets/images/bottom_navigation_bar/navigation_doctor_icon.png",width: 16,height: 14,),

          // SizedBox(height: 2,),
          AutoSizeText("الاطباء",minFontSize: 4,style: TextStyle(color: Colors.grey),),
        ],
      ),),
          BottomNavigationBarItem(label: "blalba",activeIcon: Column(
    children: [
    Image.asset("assets/images/bottom_navigation_bar/navigation_selected_home_icon.png",width: 16,height: 14,),

    // SizedBox(height: 2,),
    AutoSizeText("الرئيسية",minFontSize: 4,style: TextStyle(color: Colors.blue),),
    ],
    ),icon: Column(
        children: [
          Image.asset("assets/images/bottom_navigation_bar/navigation_home_icon.png",width: 16,height: 14,),

          // SizedBox(height: 2,),
          AutoSizeText("الرئيسية",minFontSize: 4,style: TextStyle(color: Colors.grey),),
        ],
      ),),

    ],
    currentIndex: myindex,
    unselectedLabelStyle: TextStyle(color: Colors.black),
    selectedLabelStyle: TextStyle(color: Colors.grey),
    onTap: (index){
          setState(() {
            myindex=index;
          });
    },);
  }
}
