import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:pets_ecommerce/services/http_requests_service.dart';

import '../../../../loading_screen.dart';

class PBody extends StatefulWidget {
  int id;
  PBody(this.id);
  @override
  _PBodyState createState() => _PBodyState();
}

class _PBodyState extends State<PBody> {



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
    return loading?LoadingScreen():Container(
        padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(16),
    vertical: getProportionateScreenHeight(8)),
    child:  SingleChildScrollView(
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Column(
    children: [
    ...List<Widget>.generate(
    products.length,
    (index)=>index%2==0?Container(
    margin: EdgeInsets.symmetric(vertical: 10),

    child:  StoreProductCard(products[index]),
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

    child:  StoreProductCard(products[index]),
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
