

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
import 'package:pets_ecommerce/screens/stores/model/custoer_store_offer.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets_ecommerce/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/stores/view/components/offers/store_offer_card.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
import 'package:http/http.dart' as http;

class FavoriteOffersBody extends StatefulWidget {
  @override
  _FavoriteOffersBodyState createState() => _FavoriteOffersBodyState();
}

class _FavoriteOffersBodyState extends State<FavoriteOffersBody> {


  List<Offer> offers;
  bool loading =false;
  bool error=false;
  fetchData()async
  {
    loading=true;
    setState(() {

    });
    try{
      var url =
          Uri.parse("${Api.baseUrl}/myFavourites/offers");
      final h = await HttpService().getHeaders();
      consolePrint("try to get  offdmbpfb  lvlfdbfl,lmgk mfv , fv,; bbfd");
      final apiResult = await http.get(url, headers: h);
      consolePrint(apiResult.statusCode.toString());
      consolePrint(apiResult.body.toString());
      if (apiResult.statusCode == 200) {
        var j = jsonDecode(apiResult.body);
        offers =
            List<Offer>.from(j["my Favourites"].map((x) => Offer.fromJson(x)));
      } else {
        error = true;
      }

      loading = false;
      setState(() {});
    }catch(e){
      consolePrint(e.toString());
      loading = false;
      setState(() {});
    }

  }


  Future<bool> addToFavorite(int offerId) async {
   try {
      consolePrint("offer id" + offerId.toString());
      var url = Uri.parse(
          "${Api.baseUrl}/addToFavourite/$offerId/offer");
      consolePrint("before add to favorite print");
      consolePrint("try to post on " + url.path);

      final h = await HttpService().getHeaders();
      var apiResult;
      try {
        apiResult = await http.post(url, headers: h);
      } catch (e) {
        consolePrint(e.toString());
        return false;
      }
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
    SizeConfig.init(context);
    return  error? Container(
      height: getProportionateScreenHeight(400),
      width: getProportionateScreenWidth(350),
      alignment: Alignment.center,
      child: AutoSizeText("عذرا حدثت مشكلة الرجاء المحاولة مجددا",style: body3_18pt,),
    ):loading?LoadingScreen():Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenHeight(26)),
      child:offers.length==0? Container(
        height: getProportionateScreenHeight(400),
        width: getProportionateScreenWidth(350),
        alignment: Alignment.center,
        child: AutoSizeText("لا يوجد عناصر في المفضلة",style: body3_18pt,),
      ):
      SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ...List<Widget>.generate(
                offers.length,
                      (index)=>index%2==0&&offers[index].visible=="visible"?Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    child:         StoreOfferCard(offers[index],()async{

                    }),
                  ):Container(height: 0,),

                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                ...List<Widget>.generate(
                  offers.length,
                      (index)=>index%2==1&&offers[index].visible=="visible"?Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    child:         StoreOfferCard(offers[index],()async{
                      bool k=await addToFavorite(offers[index].id);
                      return k;
                    }),
                  ):Container(height: 0,),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
