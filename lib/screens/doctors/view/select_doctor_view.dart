import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/home/view/components/search_bar_component.dart';

import 'package:pets/screens/stores/view/components/vertical_store_list_card.dart';
import 'package:pets/services/http_requests_service.dart';

import '../../loading_screen.dart';
import 'components/vertical_doctor_list_card.dart';
import '../model/all_doctors.dart';
import 'package:http/http.dart' as http;
import 'translations/select_doctor.i18n.dart';

class SelectDoctorView extends StatefulWidget {
  @override
  _SelectDoctorViewState createState() => _SelectDoctorViewState();
}

class _SelectDoctorViewState extends State<SelectDoctorView> {
  bool loading = false;
  AllDoctors doctors;

  bool failed = false;

  fetchData() async {
    loading = true;
    setState(() {});

    var url = Uri.parse("${Api.baseUrl}/doctors");
    consolePrint("before print");
    final apiResult =
        await http.get(url, headers: await HttpService().getHeaders());
    consolePrint("after print");

    if (apiResult.statusCode == 200) {
      doctors = allDoctorsFromJson(apiResult.body);
    } else {
      failed = true;
    }
    loading = false;
    setState(() {});
  }

  Future<bool> addToFavorite(int doctorId) async {
    consolePrint("store id" + doctorId.toString());
    var url = Uri.parse("${Api.baseUrl}/addToFavourite/$doctorId/doctor");
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return failed
        ? Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: getProportionateScreenHeight(600),
                width: getProportionateScreenWidth(370),
                child: Center(
                  child: Text(
                    "الرجاء المحاولة مجدداً".i18n,
                    style: body3_18pt,
                  ),
                ),
              ),
            ],
          )
        : loading
            ? LoadingScreen()
            : Container(
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await fetchData();
                  },
                  child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: doctors.doctors.length,
                      itemBuilder: (context, index) => index == 0
                          ? Column(
                              children: [
                                SearchBar(),
                                VerticalDoctorListCard(doctors.doctors[index],
                                    () async {
                                  bool k = await addToFavorite(
                                      doctors.doctors[index].id);
                                  return k;
                                })
                              ],
                            )
                          : VerticalDoctorListCard(doctors.doctors[index],
                              () async {
                              bool k = await addToFavorite(
                                  doctors.doctors[index].id);
                              return k;
                            })),
                ));
  }
}
