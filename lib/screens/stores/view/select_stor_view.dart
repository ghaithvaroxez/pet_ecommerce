import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'components/offers/translations/offers_body.i18n.dart';

class SelectStoreView extends StatefulWidget {
  @override
  _SelectStoreViewState createState() => _SelectStoreViewState();
}

class _SelectStoreViewState extends State<SelectStoreView> {
bool loading =false;
AllStores Stores;
AllStores refreshedStores;
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



refreshData()async{
bool refresh=false;
  var url=Uri.parse("${Api.baseUrl}/stores/stores");
  consolePrint("before print");
  final h=await HttpService().getHeaders();
  final apiResult=await http.get(url,headers: h);
  consolePrint("after print");

  if(apiResult.statusCode==200)
  {
    refreshedStores =allStoresFromJson(apiResult.body);
    for(int i=0;i<refreshedStores.stores.length;i++)
      {
        bool contains=true;

        for(int j=0;j<Stores.stores.length;j++) {
          if (Stores.stores[j].id == refreshedStores.stores[i].id) {
            contains = false;
          }
        }
         if(contains)
           {
             refresh=true;
             Stores.stores.insert(0, refreshedStores.stores[i]);

           }


      }
  }
  if(refresh) {
    setState(() {

    });
    Fluttertoast.showToast(
        msg: "new stores has been added",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
      // Get.rawSnackbar(message: "new stores has been added");
    }
  }

Timer _timer;
_startTimer(){
  _timer=Timer.periodic(Duration(seconds: 2), (timer) {
refreshData();
  });
}
_cancelTimer(){
  _timer.cancel();
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
  _startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cancelTimer();
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
          child:Stores.stores.length==0?Container(width: getProportionateScreenWidth(410),child: Container(
              width: getProportionateScreenWidth(370),
              height: getProportionateScreenHeight(400),
              child: Center(child: AutoSizeText("لا يوجد عناصر حاليا".i18n,style: body1_16pt,)))):ListView.builder(
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

