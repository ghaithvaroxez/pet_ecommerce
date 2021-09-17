import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:pets/screens/vendor_app/requests/vendor_app_requests.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';
import '../view/components/category_card.dart';
import '../../loading_screen.dart';
import 'translations/categories_screen.i18n.dart';
import 'package:pets/screens/notifications/view/notification_button.dart';





class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories;
  bool loading =true;
  bool error=false;
  // VendorAppRequests _vendorAppRequests=VendorAppRequests();
  fetchData()async
  {
    consolePrint("fetch data");
    loading=true;
    setState(() {

    });

    try{
      var url =
      Uri.parse("${Api.baseUrl}/categories");
      final h = await HttpService().getHeaders();
      final apiResult = await http.get(url, headers: h);
      if (apiResult.statusCode == 200) {
        var d = json.decode(apiResult.body);
        consolePrint(d["my products"].toString());
        categories = List<Category>.from(d["categories"].map((x) => Category.fromJson(x)));
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
      drawer: CustomDrawer(),

      body: SafeArea(child:
      Builder(
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
                            Scaffold.of(context).openDrawer();
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
                        Container(height:getProportionateScreenHeight(28),child: AutoSizeText("الأصناف".i18n,style: h5_21pt,minFontSize: 8,)),
                        Spacer(),
                       NotificationButton(),
                        SizedBox(
                          width: getProportionateScreenWidth(24),
                        ),
                      ],
                    )),
              ),
            ),

            Expanded(
              child: error?Column(mainAxisSize: MainAxisSize.max,children: [
                Container(height:getProportionateScreenHeight(300),width: getProportionateScreenWidth(370),child: Center(child: Text("الرجاء المحاولة مرة اخرى ".i18n,style: body3_18pt,),),),
              ],):loading?LoadingScreen():categories.length==0?NoItems():
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
                            categories.length,
                                (index)=>index%2==0?Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),

                                  child:  CategoryCard(categories[index]),
                                ):Container(height: 0,),

                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          ...List<Widget>.generate(
                            categories.length,
                                (index)=>index%2==1?Container(
                              margin: EdgeInsets.symmetric(vertical: 10),

                              child:  CategoryCard(categories[index]),
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
      ),),
    );
  }
}


class NoItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(400),
      width: getProportionateScreenWidth(350),
      alignment: Alignment.center,
      child: AutoSizeText("لا يوجد عناصر لعرضها حالياً".i18n,style: body3_18pt,),
    );
  }
}
