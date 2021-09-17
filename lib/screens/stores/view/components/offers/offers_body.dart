

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets/screens/stores/view/components/offers/store_offer_card.dart';
import 'package:pets/services/http_requests_service.dart';
import '../../../model/custoer_store_offer.dart';
import 'package:http/http.dart' as http;
import 'translations/offers_body.i18n.dart';
class OffersBodyScreen extends StatefulWidget {
  int id;
  OffersBodyScreen(this.id );
  @override
  _OffersBodyScreenState createState() => _OffersBodyScreenState();
}

class _OffersBodyScreenState extends State<OffersBodyScreen> {
  CustomerStoreOffers customerStoreOffers;
  bool loading =false;
bool error=false;
  fetchData()async
  {
    loading=true;
    setState(() {

    });
    var url=Uri.parse("http://pets.ahmadajory.com/api/offers/store/${widget.id.toString()}");
    final h=await HttpService().getHeaders();
    final apiResult =await http.get(url,headers: h);
    if(apiResult.statusCode==200)
      {
        customerStoreOffers=customerStoreOffersFromJson(apiResult.body);
      }
    else
      {
        error=true;
      }

    loading=false;
    setState(() {

    });


  }


  Future<bool> addToFavorite(int offerId) async {
   try {
      consolePrint("product id" + offerId.toString());
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
    return  error?Container(
      margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
      child: AutoSizeText(" الرجاء المحاولة مجددا".i18n,style: body1_16pt,),
    ):loading?LoadingScreen():customerStoreOffers.offers.length==0?Container(
      width: getProportionateScreenWidth(390),
      height: getProportionateScreenHeight(350),
      child: Center(child: AutoSizeText("لا يوجد عناصر حاليا".i18n,style: body1_16pt,)),
    ):Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24),
            vertical: getProportionateScreenHeight(26)),
        child:
        RefreshIndicator(
          onRefresh: ()async{
            await fetchData();
          },
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ...List<Widget>.generate(
                        customerStoreOffers.offers.length,
                            (index)=>index%2==0?Container(
                          margin: EdgeInsets.symmetric(vertical: 10),

                          child:         StoreOfferCard(customerStoreOffers.offers[index],()async{

                          },true),
                        ):Container(height: 0,),

                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      ...List<Widget>.generate(
                        customerStoreOffers.offers.length,
                            (index)=>index%2==1?Container(
                          margin: EdgeInsets.symmetric(vertical: 10),

                              child:         StoreOfferCard(customerStoreOffers.offers[index],()async{
                                bool k=await addToFavorite(customerStoreOffers.offers[index].id);
                                return k;
                              },true),
                        ):Container(height: 0,),

                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
            ///
        // ListView.builder(
        //   itemCount: 30,
        //   itemBuilder: (context, index) => Column(
        //     children: [
        //       Row(
        //         children: [
        //           StoreOfferCard(),
        //           SizedBox(width: getProportionateScreenWidth(15),),
        //           StoreOfferCard(),
        //         ],
        //       ),
        //       SizedBox(height: getProportionateScreenHeight(16),),
        //     ],
        //   ),
        // ),
///
        // child: GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       // mainAxisSpacing: getProportionateScreenHeight(16),
        //       // crossAxisSpacing: getProportionateScreenHeight(16),
        //       // childAspectRatio:1.3
        //       childAspectRatio: 1.19
        //     ),
        //     itemCount: 30,
        //     itemBuilder: (context, index) => StoreProductCard()),
      );
  }
}
