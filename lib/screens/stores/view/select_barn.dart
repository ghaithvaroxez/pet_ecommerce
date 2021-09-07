import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/home/view/components/search_bar_component.dart';
import 'package:pets/screens/stores/view/components/vertical_store_list_card.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'package:pets/services/http_requests_service.dart';
import '../model/all_stores.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'components/offers/translations/offers_body.i18n.dart';


class SelectBarnView extends StatefulWidget {
  @override
  _SelectBarnViewState createState() => _SelectBarnViewState();
}

class _SelectBarnViewState extends State<SelectBarnView> {
  bool loading =false;
  List<Store> Stores;
  bool failed=false;
  fetchData()async
  {
    loading=true;
    setState(() {

    });

    var url=Uri.parse("${Api.baseUrl}/stores/barns");
    consolePrint("before print");
    final h=await HttpService().getHeaders();
    final apiResult=await http.get(url,headers: h);
    consolePrint("after print");

    if(apiResult.statusCode==200)
    {
      var j=jsonDecode(apiResult.body);

      Stores =List<Store>.from(j["barns"].map((x) => Store.fromJson(x)));
    }
    else {
      failed=true;
    }
    loading=false;
    setState(() {

    });

  }

  Future<bool> addToFavorite(int storeId) async {
    try{
      consolePrint("store id" + storeId.toString());
      var url = Uri.parse(
          "${Api.baseUrl}/addToFavourite/$storeId/store/Store");
      consolePrint("before add to favorite print");
      final h = await HttpService().getHeaders();
      final apiResult = await http.post(url, headers: h);
      consolePrint("after add to favorite print");

      if (apiResult.statusCode == 200) {
        consolePrint("statusCode==200");
        var j = jsonDecode(apiResult.body);
        if (j["favourites"] != null) {
          consolePrint("fav != null");
          return true;
        } else {
          consolePrint("fav = null");
          return false;
        }
      } else {
        consolePrint("statusCode!=200");
        return false;
      }
    }catch(e){
      consolePrint(e.toString());
      return false;
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: Builder(
          builder: (context)=>failed?Column(mainAxisSize: MainAxisSize.max,children: [
            Container(height:getProportionateScreenHeight(600),width: getProportionateScreenWidth(370),child: Center(child: Text("حدثت مشكلة ما ",style: body3_18pt,),),),
          ],):loading?LoadingScreen():Column(
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
                            onTap: (){
                              Scaffold.of(context).openEndDrawer();
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
                        Container(height:getProportionateScreenHeight(28),child: AutoSizeText("الاسطبلات",style: h5_21pt,minFontSize: 8,)),
                          Spacer(),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade50,
                            child: Image.asset(
                              "assets/images/home/notification_icon.png",
                              height: 24,
                              width: 20,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(24),
                          ),
                        ],
                      )),
                ),
              ),
              Stores.length==0?Container(width: getProportionateScreenWidth(410),child: Container(
                  width: getProportionateScreenWidth(370),
                  height: getProportionateScreenHeight(400),
                  child: Center(child: AutoSizeText("لا يوجد عناصر حاليا".i18n,style: body1_16pt,)))):Expanded(
                  // margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                      itemCount: Stores.length,
                      itemBuilder: (context, index) => index == 0
                          ? Column(
                        children: [

                          SearchBar(),
                          VerticalStoreListCard(store:Stores[index],addToFav: ()async{
                            bool k=  await addToFavorite(Stores[index].id);
                            return k;
                          },)],
                      )
                          : VerticalStoreListCard(store:Stores[index],addToFav: ()async{
                        bool k=  await addToFavorite(Stores[index].id);
                        return k;
                      },))),
            ],
          ),
        ),
      )
    );
  }
}

