import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/categories/view/categories_screen.dart';
import 'package:pets/screens/stores/model/all_stores.dart';
import 'package:pets/screens/stores/view/components/vertical_store_list_card.dart';
import 'package:pets/screens/vendor_app/model/types.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';

import '../../loading_screen.dart';
import 'category_types_item.dart';

import 'translations/category_stores.i18n.dart';
class CategoryStores extends StatefulWidget {
  int id;
  String cat_name;

  CategoryStores(this.id,this.cat_name);
  @override
  _CategoryStoresState createState() => _CategoryStoresState();
}

class _CategoryStoresState extends State<CategoryStores> {
  bool loading =false;
  AllStores Stores;
  bool failed=false;
  List<ProductType> type_items = [

  ];
  fetchData()async
  {
    loading=true;
    setState(() {

    });
    try{
      var url = Uri.parse("${Api.baseUrl}/stores/cat/${widget.id.toString()}");
      var url2 = Uri.parse("${Api.baseUrl}/productTypes");
      consolePrint("before print");
      final h = await HttpService().getHeaders();
      final apiResult = await http.get(url, headers: h);
      final apiResult2 = await http.get(url2, headers: h);

      consolePrint("after print");
    if (apiResult.statusCode == 200&&apiResult2.statusCode == 200) {
        Stores = allStoresFromJson(apiResult.body);

        var j=jsonDecode(apiResult2.body);
        type_items=   List<ProductType>.from(
            j["product_types"].map((x) => ProductType.fromJson(x)));

    } else {
        failed = true;
      }
      loading = false;
      setState(() {});
    }catch(e){
      consolePrint(e.toString());
      failed=true;
      loading = false;
      setState(() {});
    }
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

      body: Builder(

        builder:(context)=> SafeArea(
          child: failed?ErrorScreen():loading?LoadingScreen():Container(
            // margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
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
                              Container(height:getProportionateScreenHeight(28),child: AutoSizeText(widget.cat_name,style: h5_21pt,minFontSize: 8,)),
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
SizedBox(height: getProportionateScreenHeight(35),),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                      child: ListView.builder(itemCount:type_items.length,scrollDirection: Axis.horizontal,itemBuilder: (context,index)=>
                          GestureDetector(
                            onTap: (){
Get.to(CategoryTypeItemsScreen(type_items[index].id,widget.id));
                            },
                            child: Container(
                        height: getProportionateScreenHeight(100),
                        width: getProportionateScreenWidth(90),
margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),

                        decoration: BoxDecoration(
                            // color: Colors.red,
                        ),
                        child: Column(
                            children: [
                              Container(
                                height: getProportionateScreenHeight(76),
                                width: getProportionateScreenWidth(90),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight:Radius.circular(12) ),
                                  color: Colors.white,

                                ),
                                child: ClipRRect(                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight:Radius.circular(12) ),
                                    child: Image.network(Api.imagePath+type_items[index].image,fit: BoxFit.fill,)),

                              ),
                              Container(
                                height: getProportionateScreenHeight(24),
                                width: getProportionateScreenWidth(90),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                    color: Colors.grey.withOpacity(0.7)
                                ),
                                // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                                child: Center(
                                  child: Container(
                                    height: getProportionateScreenHeight(24),
                                    width: getProportionateScreenWidth(75),

                                    child: AutoSizeText(
                                      type_items[index].name,
                                      style: body2_14pt,
                                      minFontSize: 9,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )
                            ],
                        ),
                      ),
                          )),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(40),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)) ,
                    alignment: Alignment.centerRight,
                    child: AutoSizeText("المتاجر".i18n,style: body3_18pt,
                      // textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15),),
                  Expanded(
                    flex: 4,
                    child:Stores.stores.length==0?NoItems(): ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                        itemCount: Stores.stores.length,
                        itemBuilder: (context, index) => index == 0
                            ? Column(
                          children: [
                            VerticalStoreListCard(store:Stores.stores[index],addToFav: ()async{
                              bool k=  await addToFavorite(Stores.stores[index].id);
                              return k;
                            },)],
                        )
                            : VerticalStoreListCard(store:Stores.stores[index],addToFav: ()async{
                          bool k=  await addToFavorite(Stores.stores[index].id);
                          return k;
                        },)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}


class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max,children: [
      Container(height:getProportionateScreenHeight(600),width: getProportionateScreenWidth(370),child: Center(child: Text("الرجاء المحاولة مرة اخرى ".i18n,style: body3_18pt,),),),
    ],);
  }
}
