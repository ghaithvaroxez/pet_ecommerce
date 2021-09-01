import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:pets/services/http_requests_service.dart';

import '../../../../loading_screen.dart';

class PBody extends StatefulWidget {
  int id;
  PBody(this.id);
  @override
  _PBodyState createState() => _PBodyState();
}

class _PBodyState extends State<PBody> {

  Future<bool> addToFavorite(int productId) async {
   try {
      consolePrint("product id" + productId.toString());
      var url = Uri.parse(
          "http://pets.sourcecode-ai.com/api/addToFavourite/$productId/product");
      consolePrint("before add to favorite print");
      consolePrint("try to post on " + url.path);

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

  List<StoreProduct> products=[];
  bool loading =true;
  bool error=false;
  fetchData()async
  {
    consolePrint("fetch data");
    loading=true;
    setState(() {

    });

    var url=Uri.parse("http://pets.sourcecode-ai.com/api/store/${widget.id}");
    final h=await HttpService().getHeaders();
    final apiResult =await http.get(url,headers: h);
    if(apiResult.statusCode==200)
    {
      var d= json.decode(apiResult.body);
      consolePrint(d["store"]["store_products"].toString());
      products= List<StoreProduct>.from(d["store"]["store_products"].map((x) => StoreProduct.fromJson(x)));
    }

    else
    {
      error=true;
    }

    loading=false;
    setState(() {

    });


  }
  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
    consolePrint("initial state of gproductas boud tgg screvnn ffdmfk dfdkmdkfmfdfldsomf ddmksdmkvmm vkds dokfdokm;ksidk;m;;kodfsdm n ds");
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return loading?LoadingScreen():products.length==0?Container(
      width: getProportionateScreenWidth(390),
      height: getProportionateScreenHeight(350),
      child: Center(child: AutoSizeText("لا يوجد عناصر حاليا",style: body1_16pt,)),
    ):Container(
        padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16),
    vertical: getProportionateScreenHeight(8)),
    child:  RefreshIndicator(
      onRefresh: ()async{
        await fetchData();
      },
      child: ListView(
      children:[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ...List<Widget>.generate(
                  products.length,
                      (index)=>index%2==0?Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    child:  StoreProductCard(products[index],()async{
                      bool k=await addToFavorite(products[index].id);
                      if(k==true)
                        return true;
                      else return false;
                    },true),
                  ):Container(height: 0,),

                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                ...List<Widget>.generate(
                  products.length,
                      (index)=>index%2==1?Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    child:  StoreProductCard(products[index],()async{
                      bool k=await addToFavorite(products[index].id);
                      if(k==true)
                        return true;
                      else return false;
                    },true),
                  ):Container(height: 0,),

                ),
              ],
            ),
          ],
        ),
      ]

      ),
    ),
    );
  }
}
