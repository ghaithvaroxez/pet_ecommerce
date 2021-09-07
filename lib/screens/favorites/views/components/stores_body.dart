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
import 'package:pets/screens/favorites/model/stores_model.dart';
import 'package:pets/screens/home/view/components/search_bar_component.dart';
import 'package:pets/screens/stores/view/components/vertical_store_list_card.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'translation.i18n.dart';

class FavoriteStoresBody extends StatefulWidget {
  @override
  _FavoriteStoresBodyState createState() => _FavoriteStoresBodyState();
}

class _FavoriteStoresBodyState extends State<FavoriteStoresBody> {
  bool loading =false;
  FavoriteStoreModel Stores;
  bool failed=false;
  fetchData()async
  {
    loading=true;
    setState(() {

    });
    try{
      var url =
          Uri.parse("${Api.baseUrl}/myFavourites/stores");
      consolePrint("before print");
      final h = await HttpService().getHeaders();
      consolePrint("try to get " + url.path);
      final apiResult = await http.get(url, headers: h);
      consolePrint("body :"+apiResult.body);
      consolePrint("after print");

      if (apiResult.statusCode == 200) {
        Stores = favoriteStoreModelFromJson(apiResult.body);
      } else {
        failed = true;
      }
      loading = false;
      setState(() {});
    }catch(e){
      failed = true;
      loading = false;
      setState(() {});
      consolePrint(e.toString());
    }
  }

  Future<bool> addToFavorite(int storeId) async {
    try{
      consolePrint("store id" + storeId.toString());
      var url = Uri.parse(
          "${Api.baseUrl}/addToFavourite/$storeId/store/store");
      consolePrint("before add to favorite print");
      final h = await HttpService().getHeaders();
      final apiResult = await http.post(url, headers: h);
      consolePrint("after add to favorite print");

      if (apiResult.statusCode == 200) {
        consolePrint("statusCode==200");
        var j = jsonDecode(apiResult.body);
        if (j["favourites"] != null) {
          consolePrint("fav != null");
          await fetchData();
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
    return failed?Column(mainAxisSize: MainAxisSize.max,children: [
      Container(height:getProportionateScreenHeight(300),width: getProportionateScreenWidth(370),child: Center(child: Text("الرجاء المحاولة مجدداً ".i18n,style: body3_18pt,),),),
    ],):loading?LoadingScreen():
    Stores.myFavourites.length==0? Container(
      height: getProportionateScreenHeight(400),
      width: getProportionateScreenWidth(350),
      alignment: Alignment.center,
      child: AutoSizeText("لا يوجد عناصر في المفضلة".i18n,style: body3_18pt,),
    ):Container(
        // margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
      padding: EdgeInsets.only(top: getProportionateScreenHeight(25)),
        child: ListView.builder(
// physics: NeverScrollableScrollPhysics(),
            itemCount: Stores.myFavourites.length,
            itemBuilder: (context, index) => index == 0
                ? Column(
              children: [
                // SearchBar(),
                VerticalStoreListCard(store:Stores.myFavourites[index],addToFav: ()async{
                  bool k=  await addToFavorite(Stores.myFavourites[index].id);
                  return k;
                },)],
            )
                : VerticalStoreListCard(store:Stores.myFavourites[index],addToFav: ()async{
              bool k=  await addToFavorite(Stores.myFavourites[index].id);
              return k;
            },)));
  }
}

