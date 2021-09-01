import 'dart:convert';

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
import 'package:pets/screens/widgets/text_field.dart';
import 'package:pets/services/http_requests_service.dart';
import '../model/all_stores.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class SelectStoreView extends StatefulWidget {
  @override
  _SelectStoreViewState createState() => _SelectStoreViewState();
}

class _SelectStoreViewState extends State<SelectStoreView> {
bool loading =false;
AllStores Stores;
bool failed=false;
fetchData()async
{
  loading=true;
  setState(() {

  });

var url=Uri.parse("${Api.baseUrl}/stores/stores");
consolePrint("before print");
final h=await HttpService().getHeaders();
  final apiResult=await http.get(url,headers: h);
  consolePrint("after print");

  if(apiResult.statusCode==200)
  {
    Stores =allStoresFromJson(apiResult.body);
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
    return failed?Column(mainAxisSize: MainAxisSize.max,children: [
      Container(height:getProportionateScreenHeight(600),width: getProportionateScreenWidth(370),child: Center(child: Text("حدثت مشكلة ما ",style: body3_18pt,),),),
    ],):loading?LoadingScreen():Container(
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
        child:RefreshIndicator(
          onRefresh: ()async{
            await fetchData();
          },
          child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: Stores.stores.length,
              itemBuilder: (context, index) => index == 0
                  ? Column(
                      children: [
                        SearchBar(),
                        VerticalStoreListCard(store:Stores.stores[index],addToFav: ()async{
                          bool k=  await addToFavorite(Stores.stores[index].id);
                          return k;
                        },)],
                    )
                  : VerticalStoreListCard(store:Stores.stores[index],addToFav: ()async{
              bool k=  await addToFavorite(Stores.stores[index].id);
              return k;
              },)),
        ));
  }
}

