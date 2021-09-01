

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/stores/model/custoer_store_offer.dart';
import 'file:///C:/Users/Varoxez/AndroidStudioProjects/pets/lib/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets/screens/stores/view/components/offers/store_offer_card.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:http/http.dart' as http;

class AllOffersScreen extends StatefulWidget {
  @override
  _AllOffersScreenState createState() => _AllOffersScreenState();
}

class _AllOffersScreenState extends State<AllOffersScreen> {


  List<Offer> offers;
  bool loading =false;
  bool error=false;
  fetchData()async
  {
    loading=true;
    setState(() {

    });
    var url=Uri.parse("http://pets.sourcecode-ai.com/api/all/offers");
    final h=await HttpService().getHeaders();
    consolePrint("try to get  offdmbpfb  lvlfdbfl,lmgk mfv , fv,; bbfd");
    final apiResult =await http.get(url,headers: h);
    if(apiResult.statusCode==200)
    {
      var j=jsonDecode(apiResult.body);
      offers= List<Offer>.from(j["offers"].map((x) => Offer.fromJson(x)));
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
      consolePrint("offer id" + offerId.toString());
      var url = Uri.parse(
          "http://pets.sourcecode-ai.com/api/addToFavourite/$offerId/offer");
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
    return  Scaffold(

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Builder(
            builder: (context)=>Column(
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
                            Container(height:getProportionateScreenHeight(28),child: AutoSizeText("العروض",style: h5_21pt,minFontSize: 8,)),
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

                Expanded(
                  child: error?Container(
                    margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                    child: AutoSizeText("عذرا حدثت مشكلة الرجاء المحاولة مجددا"),
                  ):loading?LoadingScreen():Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(24),
                        vertical: getProportionateScreenHeight(26)),
                    child:offers.length==0? Container(
                      height: getProportionateScreenHeight(400),
                      width: getProportionateScreenWidth(350),
                      alignment: Alignment.center,
                      child: AutoSizeText("لا يوجد عناصر لعرضها حاليا",style: body3_18pt,),
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

                                  },false),
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
                                  },false),
                                ):Container(height: 0,),

                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
