import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/categories/view/catgory_stores.dart';
import 'package:pets/screens/corner/model/corner_model.dart';
import 'package:pets/screens/home/view/components/search_bar_component.dart';
import 'package:pets/screens/stores/view/components/vertical_store_list_card.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'package:pets/screens/corner/view/components/vertical_corner_card.dart';
import 'package:http/http.dart' as http;
import 'package:pets/services/http_requests_service.dart';
class SelectCornerView extends StatefulWidget {
  @override
  _SelectCornerViewState createState() => _SelectCornerViewState();
}

class _SelectCornerViewState extends State<SelectCornerView> {
  bool loading=false;
  bool error=false;
  CornersModel cornersModel;
  fetchData()async{
    loading=true;
    setState(() {
      
    });
   try {
     consolePrint("before corners requests");
     var url=Uri.parse("${Api.baseUrl}/corners",);
     final apiResult =
          await http.get(url,headers: await HttpService().getHeaders());
      consolePrint("corners statusCode"+apiResult.statusCode.toString());
      if (apiResult.statusCode == 200) {
        cornersModel = cornersModelFromJson(apiResult.body);
        consolePrint(apiResult.statusCode.toString());
      } else {
        error = true;
      }
      loading = false;
      setState(() {});
    }catch(e)
   {
     loading = false;
     error = true;
     setState(() {});
     consolePrint("Corners error:"+e.toString());
   }
    consolePrint("after corners requests");

  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    consolePrint("in int state");
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: error?ErrorScreen():loading?LoadingScreen():
      Container(
          margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
          child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
              itemCount: cornersModel.corners.length,
              itemBuilder: (context, index) => index == 0
                  ? Column(
                children: [
                  SearchBar(),
                  VerticalCornerListCard(cornersModel.corners[index])],
              )
                  : VerticalCornerListCard(cornersModel.corners[index]))),
    );
  }
}
