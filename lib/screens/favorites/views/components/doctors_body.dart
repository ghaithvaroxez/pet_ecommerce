import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/doctors/model/all_doctors.dart';
import 'package:pets_ecommerce/screens/home/view/components/doctor_card.dart';
import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';

import '../../../loading_screen.dart';
import 'package:http/http.dart' as http;
import '../components/cards/doctor_favorite_card.dart';
class FavoriteDoctorsBody extends StatefulWidget {
  @override
  _FavoriteDoctorsBodyState createState() => _FavoriteDoctorsBodyState();
}

class _FavoriteDoctorsBodyState extends State<FavoriteDoctorsBody> {
  bool loading =false;
  List<Doctor> doctors;

  bool failed=false;
  fetchData()async
  {
    loading=true;
    setState(() {
    });

    var url=Uri.parse("http://pets.sourcecode-ai.com/api/myFavourites/doctors");
    consolePrint("before print");
    final apiResult=await http.get(url,headers: await HttpService().getHeaders());
    consolePrint("after print");
consolePrint(apiResult.body);
    if(apiResult.statusCode==200)
    {
      var j=jsonDecode(apiResult.body);
      doctors =List<Doctor>.from(j["my Favourites"].map((x) => Doctor.fromJson(x)));
    }
    else {
      failed=true;
    }
    loading=false;
    setState(() {

    });

  }

  Future<bool> addToFavorite(int doctorId) async {
   try {
      consolePrint("store id" + doctorId.toString());
      var url = Uri.parse(
          "http://pets.sourcecode-ai.com/api/addToFavourite/$doctorId/doctor");
      consolePrint("before add to favorite print");
      final h = await HttpService().getHeaders();
      final apiResult = await http.post(url, headers: h);
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



    return failed?Column(mainAxisSize: MainAxisSize.max,children: [
      Container(height:getProportionateScreenHeight(300),width: getProportionateScreenWidth(370),child: Center(child: Text("حدثت مشكلة ما ",style: body3_18pt,),),),
    ],):loading?LoadingScreen():
        doctors.length==0? Container(
          height: getProportionateScreenHeight(400),
          width: getProportionateScreenWidth(350),
          alignment: Alignment.center,
          child: AutoSizeText("لا يوجد عناصر في المفضلة",style: body3_18pt,),
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
                  doctors.length,
                      (index)=>index%2==0?Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child:  DoctorFavoriteCard(doctors[index],()async{
                      bool k=await addToFavorite(doctors[index].id);
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
                  doctors.length,
                      (index)=>index%2==1?Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    child:   DoctorFavoriteCard(doctors[index],()async{
                      bool k=await addToFavorite(doctors[index].id);
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
    );
  }
}
