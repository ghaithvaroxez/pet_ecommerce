import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/home/view/components/search_bar_component.dart';

import 'package:pets_ecommerce/screens/stores/view/components/vertical_store_list_card.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';

import '../../loading_screen.dart';
import 'components/vertical_doctor_list_card.dart';
import '../model/all_doctors.dart';
import 'package:http/http.dart' as http;

class SelectDoctorView extends StatefulWidget {
  @override
  _SelectDoctorViewState createState() => _SelectDoctorViewState();
}

class _SelectDoctorViewState extends State<SelectDoctorView> {


  bool loading =false;
  AllDoctors doctors;

  bool failed=false;
  fetchData()async
  {
    loading=true;
    setState(() {

    });

    var url=Uri.parse("http://pets.sourcecode-ai.com/api/doctors");
    consolePrint("before print");
    final apiResult=await http.get(url,headers: await HttpService().getHeaders());
    consolePrint("after print");

    if(apiResult.statusCode==200)
    {
      doctors =allDoctorsFromJson(apiResult.body);
    }
    else {
      failed=true;
    }
    loading=false;
    setState(() {

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return
      failed?Column(mainAxisSize: MainAxisSize.max,children: [
        Container(height:getProportionateScreenHeight(600),width: getProportionateScreenWidth(370),child: Center(child: Text("حدثت مشكلة ما ",style: body3_18pt,),),),
      ],):loading?LoadingScreen():
      Container(
          margin:  EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
          child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
          itemCount: doctors.doctors.length,itemBuilder:(context,index)=>index==0?Column(children: [
            SearchBar(),
            VerticalDoctorListCard(doctors.doctors[index])],):VerticalDoctorListCard(doctors.doctors[index]) ));

  }
}