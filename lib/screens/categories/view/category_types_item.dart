import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:pets_ecommerce/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';

import '../../loading_screen.dart';





class CategoryTypeItemsScreen extends StatefulWidget {
  int cat_id;
  int type_id;
  CategoryTypeItemsScreen(this.type_id,this.cat_id);
  @override
  _CategoryTypeItemsScreenState createState() => _CategoryTypeItemsScreenState();
}

class _CategoryTypeItemsScreenState extends State<CategoryTypeItemsScreen> {

  Future<bool> addToFavorite(int productId) async {
    try{
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
          await fetchData();
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

    try{
      var url =
      Uri.parse("http://pets.sourcecode-ai.com/api/productsBy/${widget.cat_id}/${widget.type_id}");
      final h = await HttpService().getHeaders();
      final apiResult = await http.get(url, headers: h);
      if (apiResult.statusCode == 200) {
        var d = json.decode(apiResult.body);
        consolePrint(d["items"].toString());
        products = List<StoreProduct>.from(
            d["items"].map((x) => StoreProduct.fromJson(x)));
      } else {
        error = true;
      }

      loading = false;
      setState(() {});
    }catch(e)
    {
      error=true;
      loading = false;
      setState(() {});
      consolePrint(e.toString());
    }
  }
  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
    consolePrint("initial state of get productas ");
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      endDrawer: CustomDrawer(),

      body: SafeArea(child:
      Builder(
        builder: (context)=>Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
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
                          Container(height:getProportionateScreenHeight(28),child: AutoSizeText("المنتجات",style: h5_21pt,minFontSize: 8,)),
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
                child: error?Column(mainAxisSize: MainAxisSize.max,children: [
                  Container(height:getProportionateScreenHeight(300),width: getProportionateScreenWidth(370),child: Center(child: Text("حدثت مشكلة ما ",style: body3_18pt,),),),
                ],):loading?LoadingScreen():products.length==0?Container(
                  height: getProportionateScreenHeight(400),
                  width: getProportionateScreenWidth(350),
                  alignment: Alignment.center,
                  child: AutoSizeText("لا يوجد عناصر لعرضها حالياً",style: body3_18pt,),
                ):
                Container(
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
                                  (index)=>index%2==0&&products[index].visible=="visible"?Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child:  StoreProductCard(products[index],()async{
                                  bool k=await addToFavorite(products[index].id);
                                  if(k==true)
                                    return true;
                                  else return false;
                                }),
                              ):Container(height: 0,),

                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            ...List<Widget>.generate(
                              products.length,
                                  (index)=>index%2==1&&products[index].visible=="visible"?Container(
                                margin: EdgeInsets.symmetric(vertical: 10),

                                child:  StoreProductCard(products[index],()async{
                                  bool k=await addToFavorite(products[index].id);
                                  if(k==true)
                                    return true;
                                  else return false;
                                }),
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
      ),),
    );
  }
}
