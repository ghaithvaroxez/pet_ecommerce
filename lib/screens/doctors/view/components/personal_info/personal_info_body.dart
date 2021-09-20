import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/auth/view/splash/login_or_register.dart';
import 'package:pets/screens/doctor_app/model/doctor.dart';
import 'package:pets/screens/home/view/components/social_media_components.dart';
import 'package:pets/screens/maps/view/map_screen.dart';
import 'package:pets/screens/stores/view/components/about/review_card.dart';
import 'package:get/get.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:rating_dialog/rating_dialog.dart';

// import 'package:rating_dialog/rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../../../model/review_model.dart';
import 'translations/personal_info_body.i18n.dart';
import 'package:intl/intl.dart';

class DoctorPersonalInfoBody extends StatefulWidget {
  Doctor doctor;

  DoctorPersonalInfoBody(this.doctor);

  @override
  _DoctorPersonalInfoBodyState createState() => _DoctorPersonalInfoBodyState();
}

class _DoctorPersonalInfoBodyState extends State<DoctorPersonalInfoBody> {
  GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  int more = 2;

  String utcTo12HourFormat(String bigTime) {
    // DateTime tempDate = DateFormat("hh:mm").parse(bigTime);
    // var dateFormat = DateFormat("h:mm a"); // you can change the format here
    // var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    // var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
    // String createdDate = dateFormat.format(DateTime.parse(localDate));
    print("------------$bigTime");
    String temp = '';
    var first = bigTime.substring(0, 2);
    var second = bigTime.substring(3);
    consolePrint(first);
    consolePrint(second);
    if (int.parse(first) == 12) {
      temp = first + ":" + second + " PM";
    } else if (int.parse(first) == 00) {
      temp = "12" + ":" + second + " AM";
    } else if (int.parse(first) > 12) {
      int t = (int.parse(first) - 12);
      temp = t.toString() + ":" + second + " PM";
    } else {
      temp = first + ":" + second + " AM";
    }
    return temp;
  }

  setMore() {
    setState(() {
      more = 10;
    });
  }

  removeMore() {
    setState(() {
      more = 2;
    });
  }

  bool loading = false;
  bool error = false;
  ReviewModel reviewModel;

  getReviews() async {
    error = false;
    loading = true;
    setState(() {});
    consolePrint("befor get ");
    final h = await HttpService().getHeaders();
    try {
      final apiResult = await http.get(
          Api.baseUrl + Api.getDoctorReview + widget.doctor.id.toString(),
          headers: h);
      consolePrint("after get ");
      if (apiResult.statusCode == 200)
        reviewModel = reviewModelFromJson(apiResult.body);
      else
        error = true;
    } catch (e) {
      consolePrint(e.toString());
      loading = false;
      setState(() {});
      error = true;
    }
    loading = false;
    setState(() {});
  }

  addReview(String comment, int rate) async {
    loading = true;
    setState(() {});
    consolePrint("befor add ");
    final h = await HttpService().getHeaders();
    var m = {
      "rate": rate.toString(),
      "comment": comment.toString(),
      "doctor_id": widget.doctor.id.toString(),
    };
    // FormData formData=FormData({
    //
    // });
    var j = jsonEncode(m);
    final apiResult = await http.post(Api.baseUrl + Api.addDoctorReview,
        body: {
          "rate": rate.toString(),
          "comment": comment.toString(),
          "doctor_id": widget.doctor.id.toString(),
        } //+ '/' + widget.id.toString()
        ,
        headers: h);
    consolePrint("after add ");
    consolePrint(apiResult.statusCode.toString());
    consolePrint(apiResult.body);
    if (apiResult.statusCode == 200) {
      await getReviews();
    }
    // doctorModel= doctorModelFromJson(apiResult.body);

    else
      error = true;

    loading = false;
    setState(() {});
  }

  int currentUserId = -1;

  getUser() async {
    UserModel userModel = await AuthServices.getCurrentUser();

    currentUserId = userModel.user.id;
  }

  String fb, wa, ins;
  bool bfb = true, bwa = true, bins = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    for (int i = 0; i < widget.doctor.doctorContacts.length; i++) {
      if (widget.doctor.doctorContacts[i].type == "facebook" && bfb == true) {
        fb = widget.doctor.doctorContacts[i].link;
        bfb = false;
      } else if (widget.doctor.doctorContacts[i].type == "phone" &&
          bwa == true) {
        wa = widget.doctor.doctorContacts[i].link;
        bwa = false;
      } else if (widget.doctor.doctorContacts[i].type == "instagram" &&
          bins == true) {
        ins = widget.doctor.doctorContacts[i].link;
        bins = false;
      }
    }
    getReviews();
    getIcon();
  }

  var icon1;

  getIcon() async {
    icon1 = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
        "assets/images/vendor_app/location_marker.png");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenHeight(26)),
      child: ListView(
        children: [
          Row(
            children: [
              Container(
                height: getProportionateScreenHeight(30),
                width: getProportionateScreenWidth(150),
                child: AutoSizeText(
                  widget.doctor.firstName + " " + widget.doctor.lastName,
                  style: body3_25pt,
                ),
              ),
              Spacer(),
              SocialMedia(
                fb: fb,
                ins: ins,
                wa: wa,
                freez: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/home/clock_icon.png",
                height: getProportionateScreenHeight(12),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Container(
                height: getProportionateScreenHeight(20),
                width: getProportionateScreenWidth(200),
                child: AutoSizeText(
                  widget.doctor.info,
                  style: darkGrayText_14pt,
                  minFontSize: 10,
                  maxLines: 1,
                  // textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Container(
            height: getProportionateScreenHeight(20),
            // width: getPr oportionateScreenWidth(200),
            alignment: Alignment.centerRight,
            // color: Colors.red,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/images/home/location_icon.png",
                  height: getProportionateScreenHeight(12),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Container(
                  // alignment: Alignment.centerRight,
                  height: getProportionateScreenHeight(20),
                  width: getProportionateScreenWidth(200),
                  child: AutoSizeText(
                    widget.doctor.address,
                    style: darkGrayText_14pt,
                    minFontSize: 10,
                    maxLines: 1,
                    // textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Container(
            height: getProportionateScreenHeight(30),
            // alignment: Alignment.centerRight,
            child: AutoSizeText(
              "مواعيد العمل".i18n,
              minFontSize: 14,
              style: body3_18pt,
              maxLines: 1,
            ),
          ),

          ///مواعيد العمل
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),

          for (int i = 0; i < widget.doctor.doctorWorkDays.length; i++)
            Row(
              children: [
                Image.asset(
                  "assets/images/home/clock_icon.png",
                  height: getProportionateScreenHeight(12),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Container(
                  height: getProportionateScreenHeight(20),
                  width: getProportionateScreenWidth(200),
                  child: Row(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(20),
                        width: getProportionateScreenWidth(50),
                        // width: getProportionateScreenWidth(120),
                        child: AutoSizeText(
                          "${widget.doctor.doctorWorkDays[i].day} ",
                          // textDirection: TextDirection.rtl,
                          style: body3_18pt,
                          minFontSize: 10,
                        ),
                      ),
                      Container(
                        height: getProportionateScreenHeight(20),
                        // width: getProportionateScreenWidth(120),
                        child: AutoSizeText(
                          "${utcTo12HourFormat(widget.doctor.doctorWorkDays[i].from)} ",
                          // textDirection: TextDirection.ltr,
                          style: body3_18pt,
                          minFontSize: 10,
                        ),
                      ),
                      Container(
                        height: getProportionateScreenHeight(20),
                        // width: getProportionateScreenWidth(120),
                        child: AutoSizeText(
                          "-",
                          style: body3_18pt,
                          minFontSize: 10,
                        ),
                      ),
                      Container(
                        height: getProportionateScreenHeight(20),
                        // width: getProportionateScreenWidth(120),
                        child: AutoSizeText(
                          "${utcTo12HourFormat(widget.doctor.doctorWorkDays[i].to)} ",
                          // textDirection: TextDirection.ltr ,
                          style: body3_18pt,
                          minFontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(105)),
            width: getProportionateScreenWidth(150),
            height: getProportionateScreenHeight(60),
            alignment: Alignment.center,
            // color: Colors.green,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () async {
                      if (await canLaunch('tel:${widget.doctor.mobile}')) {
                        await launch('tel:${widget.doctor.mobile}');
                      } else {
                        Get.rawSnackbar(
                          message: "الرجاء المحاولة مجدداً !".i18n,
                        );
                      }
                    },
                    child: Container(
                        width: getProportionateScreenWidth(60),
                        height: getProportionateScreenHeight(60),
                        child: Image.asset(
                            "assets/images/store/phone_button_icon.png"))),
                SizedBox(
                  width: getProportionateScreenWidth(12),
                ),
                GestureDetector(
                    onTap: () async {
                      if (widget.doctor.email == null) {
                        Get.rawSnackbar(
                          message: "عذرا الطبيب ليس له بريد الكتروني !".i18n,
                        );
                        return;
                      } else {
                        if (await canLaunch('mailto:${widget.doctor.email}')) {
                          await launch('mailto:${widget.doctor.email}');
                        } else {
                          Get.rawSnackbar(
                            message: "الرجاء المحاولة مجدداً !".i18n,
                          );
                        }
                      }
                    },
                    child: Container(
                        width: getProportionateScreenWidth(60),
                        height: getProportionateScreenHeight(60),
                        child: Image.asset(
                            "assets/images/store/email_buttom_icon.png"))),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: getProportionateScreenHeight(30),
                  child: AutoSizeText(
                    "احدث التقييمات".i18n,
                    style: body3_18pt,
                    minFontSize: 12,
                    maxLines: 1,
                  )),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    if (more == 2)
                      setMore();
                    else
                      removeMore();
                    setState(() {});
                  },
                  child: Container(
                      height: getProportionateScreenHeight(20),
                      child: AutoSizeText(
                        "عرض".i18n +
                            " " +
                            (more == 2 ? "المزيد".i18n : "اقل".i18n),
                        style: body2_14pt,
                        minFontSize: 8,
                      ))),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          currentUserId == widget.doctor.id
              ? Container()
              : GestureDetector(
                  onTap: () async {
                    if (gusetId == 146) {
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                title: Text(
                                  'يجب عليك تسجيل حساب اولاً '.i18n,
                                  // textDirection: TextDirection.rtl,
                                  style: body3_18pt,
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      'العودة'.i18n,
                                      style: GoogleFonts.tajawal(
                                          color: Colors.red.withOpacity(0.6)),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      return;
                                      // Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      'تسجيل حساب'.i18n,
                                      style: GoogleFonts.tajawal(
                                          color: Colors.blue.withOpacity(0.6)),
                                    ),
                                    onPressed: () async {
                                      Get.back();
                                      Get.offAll(LoginOrRegister());
                                      return;
                                    },

                                    // language.changeLanguage();
                                    // Navigator.of(context).pop();
                                    // await  LocalStorageService.prefs.clear();
                                    // Get.offAll(SplashScreen());
                                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                                  ),
                                ],
                              )));
                      return;
                    }

                    final ratingDialog = RatingDialog(
                      // your app's name?
                      title: widget.doctor.firstName +
                          " " +
                          widget.doctor.lastName,
                      initialRating: 0,
                      ratingColor: Color(0xFF49C3EA).withOpacity(0.8),
                      // encourage your user to leave a high rating?
                      message: 'ماهو تقيمك لهذا الطبيب  ؟'.i18n,
                      commentHint: 'اخبرنا برأيك عن هذا الطبيب'.i18n,
                      // your app's logo?
                      // image: Container(
                      //   color: ,
                      // ),
                      submitButton: 'متابعة'.i18n,
                      onCancelled: () {},
                      onSubmitted: (response) async {
                        print(
                            'rating: ${response.rating}, comment: ${response.comment}');
                        addReview(response.comment, response.rating);
                      },
                    );

                    showDialog(
                        context: context, builder: (context) => ratingDialog);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(5)),
                    width: getProportionateScreenWidth(345),
                    height: getProportionateScreenHeight(85),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: offWhite,
                      boxShadow: shadow,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.blue.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),

          error
              ? Container(
                  height: getProportionateScreenHeight(200),
                  width: getProportionateScreenWidth(300),
                  child: AutoSizeText(
                    "عذرا حدثت مشكلة بجلب التقيمات الرجاء المحاولة مجدداً".i18n,
                    style: body1_16pt,
                  ),
                )
              : loading
                  ? Container(
                      height: getProportionateScreenHeight(200),
                      width: getProportionateScreenWidth(300),
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      children: [
                        ...List<Widget>.generate(
                            reviewModel.rates.length,
                            (index) => index > more
                                ? Container(
                                    width: 0,
                                    height: 0,
                                  )
                                : ReviewCad(
                                    reviewModel.rates[index].userComment ==
                                            "null"
                                        ? " "
                                        : reviewModel.rates[index].userComment,
                                    reviewModel.rates[index].ratedStoreName !=
                                            "null"
                                        ? reviewModel
                                            .rates[index].ratedStoreName
                                        : reviewModel.rates[index]
                                                    .userFirstName !=
                                                "null"
                                            ? reviewModel.rates[index]
                                                    .userFirstName +
                                                " " +
                                                reviewModel
                                                    .rates[index].userLastName
                                            : reviewModel.rates[index]
                                                    .doctorFirstName +
                                                " " +
                                                reviewModel.rates[index]
                                                    .doctorLastName,
                                    reviewModel.rates[index].userRate,
                                    reviewModel.rates[index].ratedStoreImage !=
                                            "null"
                                        ? reviewModel
                                            .rates[index].ratedStoreImage
                                        : reviewModel.rates[index].userImage !=
                                                "null"
                                            ? reviewModel.rates[index].userImage
                                            : reviewModel
                                                .rates[index].doctorImage))
                      ],
                    ),

          SizedBox(
            height: getProportionateScreenHeight(25),
          ),

          (widget.doctor.lat == -1.01 || widget.doctor.long == -1.01)
              ? Container(
                  height: 0,
                  width: 0,
                )
              : Container(
                  width: getProportionateScreenWidth(370),
                  height: getProportionateScreenHeight(370),
                  child: Stack(
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(widget.doctor.lat, widget.doctor.long),
                          zoom: 11.5,
                        ),

                        onTap: (position) {
                          Get.to(MapScreen());
                        },
                        onCameraMove: (position) {
                          // _customInfoWindowController.onCameraMove();
                          // _customInfoWindowController.hideInfoWindow();
                        },
                        onMapCreated: (GoogleMapController controller) async {
                          _googleMapController = controller;
                          // _customInfoWindowController.googleMapController =
                          //     controller;
                        },
                        markers: {
                          Marker(
                            markerId: MarkerId('my location'),
                            // infoWindow: const InfoWindow(title: 'Origin'),
                            icon: icon1,
                            position:
                                LatLng(widget.doctor.lat, widget.doctor.long),
                          )
                        },
                        // {
                        //   if (_origin != null) _origin,
                        //   if (_destination != null) _destination
                        // },
                        polylines: {},
                        // onLongPress: _addMarker,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
    ;
  }
}
