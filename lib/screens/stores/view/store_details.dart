import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/configuration/themes/colors.dart';

class StoreDetailsPage extends StatefulWidget {
  @override
  _StoreDetailsPageState createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage>with SingleTickerProviderStateMixin {

  @override

  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(400),
                child: Container(
                  child: Image.asset(
                    "assets/images/home/shop_image.png",
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(400),
                child: Container(
                  child: Image.asset(
                    "assets/images/home/shop_image.png",
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: getProportionateScreenHeight(400),
                child: Container(
                  child: Image.asset(
                    "assets/images/store/black_layer.png",
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
              top: getProportionateScreenHeight(34),
              left: getProportionateScreenWidth(24),
              child: Container(
                width: getProportionateScreenWidth(48),
                height: getProportionateScreenHeight(48),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 14,
                  ),
                ),
              ),
            ),
            Positioned(
                top: getProportionateScreenHeight(240),
                right: getProportionateScreenWidth(10),
                width: getProportionateScreenWidth(190),
                height: getProportionateScreenHeight(80),
                child: Container(
                  child:   Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: getProportionateScreenHeight(30),width: getProportionateScreenWidth(150),child: AutoSizeText("Pets carnival",style: blueButton_25pt,),),



                      Row(
mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(height: getProportionateScreenHeight(20),width: getProportionateScreenWidth(80),child: AutoSizeText("صباحا - 9 مساء",style: blueButton_14pt,minFontSize: 10,maxLines: 1,),),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Image.asset("assets/images/home/clock_icon.png",height: getProportionateScreenHeight(12),),

                        ],
                      ),

                      Row(

                        children: [
                          Container(height: getProportionateScreenHeight(20),width: getProportionateScreenWidth(80),child: AutoSizeText(
                            "فلسطين رام الله ",style: blueButton_14pt,minFontSize: 10,maxLines: 1,),),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Image.asset("assets/images/home/location_icon.png",height: getProportionateScreenHeight(12),),


                        ],
                      ),
                    ],
                  ),
                ),
            ),
            Positioned(top: getProportionateScreenHeight(380),left: 0,right: 0,child: TabBar(
              // controller: _tabController,
              tabs: [
              Tab(icon:Expanded(child: Container(  decoration: BoxDecoration(color: Colors.grey),)),),
              Tab(icon: Expanded(child: Container( decoration: BoxDecoration(color: Colors.grey),)),),
              Tab(icon: Expanded(child: Container( decoration: BoxDecoration(color: Colors.grey),)),),
              Tab(icon: Expanded(child: Container( decoration: BoxDecoration(color: Colors.grey),)),),
            ],),)
          ],
        ),
      ),
    );
  }
}
