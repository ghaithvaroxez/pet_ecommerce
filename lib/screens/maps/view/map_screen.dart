import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/doctors/model/all_doctors.dart';
import 'package:pets/screens/doctors/view/doctor_details.dart';
import 'package:pets/screens/maps/controller/directions_repository.dart';
import 'package:pets/screens/maps/model/directions_model.dart';

// import 'package:bitmap/bitmap.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';

// import 'package:image/image.dart' ;
import 'package:http/http.dart' as http;
import 'package:pets/screens/stores/model/all_stores.dart';
import 'package:pets/screens/stores/view/store_details.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:get/get.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {




  bool loading = false;
  bool failed = false;
  AllStores Stores;
  AllDoctors doctors;

getStores() async
  {
    loading = true;
    setState(() {

    });
markers.clear();
    _info=null;
    await addLocationMarker();
    try {
      var url = Uri.parse("${Api.baseUrl}/all/stores");
      consolePrint("before print");
      final h = await HttpService().getHeaders();
      final apiResult = await http.get(url, headers: h);
      consolePrint("after print");
consolePrint("response body :"+apiResult.body);
consolePrint("response code :"+apiResult.statusCode.toString());
      if (apiResult.statusCode == 200) {
        Stores = allStoresFromJson(apiResult.body);
        consolePrint(Stores.stores.length.toString());
        for(int i=0;i<Stores.stores.length;i++)
        {
          consolePrint("i="+i.toString());
          await addStoreMarker(Stores.stores[i]);
        }
      } else {
        failed = true;
      }
    } catch (e) {
      failed = true;
      loading = false;
      setState(() {

      });
      consolePrint(e.toString());
    }
    loading = false;
    setState(() {

    });
  }

getDoctors() async {
    loading = true;
    setState(() {});
    try {
      markers.clear();
      _info=null;
      await addLocationMarker();
      var url = Uri.parse("${Api.baseUrl}/doctors");
      consolePrint("before print");
      final apiResult =
      await http.get(url, headers: await HttpService().getHeaders());
      consolePrint("after print");

      if (apiResult.statusCode == 200) {
        doctors = allDoctorsFromJson(apiResult.body);
        for(int i=0;i<doctors.doctors.length;i++)
          {
            await addDoctorMarker(doctors.doctors[i]);
          }
      } else {
        failed = true;
      }
    } catch (e) {
      failed = true;
      loading = false;
      setState(() {

      });
    }
    loading = false;
    setState(() {

    });
  }
Map<MarkerId, Marker> markers=<MarkerId, Marker>{};
addDoctorMarker(Doctor doctor) async{
    var icon1 = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
        "assets/images/vendor_app/location_marker.png");
if(doctor.lat==-1.01||doctor.long==-1.01)
  return ;

markers[MarkerId('doctor${doctor.id}')]=
    Marker(
  markerId: MarkerId('doctor${doctor.id}'),
  // infoWindow: const InfoWindow(title: 'Origin'),
  icon: icon1,
  position: LatLng(doctor.lat,doctor.long),
  onTap: () async {
    _customInfoWindowController.addInfoWindow(
      Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: DoctorCard(doctor),
              width: double.infinity,
              height: double.infinity,
            ),
          ),

        ],
      ),
      LatLng(doctor.lat,doctor.long),
    );
    if(directions){
          final directions = await DirectionsRepository().getDirections(
              origin: _origin.position,
              destination: LatLng(doctor.lat, doctor.long));
          setState(() => _info = directions);
        }
      },

);

  }
addStoreMarker(Store store)async {
  consolePrint("lat"+store.lat.toString()+"long:"+store.long.toString());
  var icon1 = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
      "assets/images/vendor_app/location_marker.png");
  consolePrint("lat:"+store.lat.toString()+"long:"+store.long.toString());
  if(store.lat==-1.01||store.long==-1.01)
    return ;

  markers[MarkerId('store${store.id}')]=
    Marker(
      markerId: MarkerId('store${store.id}'),
      // infoWindow: const InfoWindow(title: 'Origin'),
      icon: icon1,
      position: LatLng(store.lat,store.long),
      onTap: () async{
        _customInfoWindowController.addInfoWindow(
            StoreCard(store),
          LatLng(store.lat,store.long),
        );
       if(directions) {
          final directions = await DirectionsRepository().getDirections(
              origin: _origin.position,
              destination: LatLng(store.lat, store.long));
          setState(() => _info = directions);
        }
      },

  );
}
bool directions=true;
addLocationMarker()async{
  var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
      "assets/images/vendor_app/my_location_marker.png");

  LocationPermission  permission = await Geolocator.checkPermission();
  if(permission==LocationPermission.denied) {
    directions=false;
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  LatLng userLocation = LatLng(position.latitude, position.longitude);

_origin= Marker(
  markerId: MarkerId('my location'),
  // infoWindow: const InfoWindow(title: 'Origin'),
  icon: icon,
  position: LatLng(userLocation.latitude,userLocation.longitude),

);
  markers[MarkerId('my location')]=
    Marker(
      markerId: MarkerId('my location'),
      // infoWindow: const InfoWindow(title: 'Origin'),
      icon: icon,
      position: LatLng(userLocation.latitude,userLocation.longitude),

  );
}

  var stores = RxBool(true);
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.510101232568644, 36.23629866416888),
    zoom: 11.5,
  );

  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  Directions _info;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  
  CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  Widget StoreCard(Store doctor)
  {
    return GestureDetector(
      onTap: () {
        Get.to(StoreDetailsPage(doctor));
      },
      child: Container(
        // width: getProportionateScreenWidth(90),
        // height: getProportionateScreenHeight(90),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                // width: getProportionateScreenWidth(90),
                // height: getProportionateScreenHeight(50),
                child: Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                    child: Image.network(Api.imagePath+doctor.image,fit: BoxFit.cover,),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  // width: getProportionateScreenWidth(90),
                  // height: getProportionateScreenHeight(50),
                  padding: EdgeInsets.symmetric(horizontal:getProportionateScreenHeight(8)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            // height: getProportionateScreenHeight(30),
                            // width: getProportionateScreenWidth(115),
                            child: AutoSizeText(
                              doctor.name+" ",
                              style: body3_18pt,
                              maxLines: 1,
                              minFontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/home/location_icon.png",
                              height: getProportionateScreenHeight(12),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Container(
                              // height: getProportionateScreenHeight(18),
                              // width: getProportionateScreenWidth(120),
                              child: AutoSizeText(
                                doctor.district,
                                style: darkGrayText_14pt,
                                minFontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

   Widget DoctorCard(Doctor doctor)
  {
    return GestureDetector(
      onTap: () async{
        Get.to(DoctorDetailsPage(doctor.id));

      },
      child: Container(
        // width: getProportionateScreenWidth(90),
        // height: getProportionateScreenHeight(90),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
color: Colors.white
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                // width: getProportionateScreenWidth(90),
                // height: getProportionateScreenHeight(50),
                child: Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(7),topRight: Radius.circular(7)),
                  child: Image.network(Api.imagePath+doctor.image,fit: BoxFit.cover,),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  // width: getProportionateScreenWidth(90),
                  // height: getProportionateScreenHeight(50),
                  padding: EdgeInsets.symmetric(horizontal:getProportionateScreenHeight(8)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // height: getProportionateScreenHeight(30),
                            // width: getProportionateScreenWidth(115),
                            child: AutoSizeText(
                              doctor.lastName+" ",
                              style: body3_18pt,
                              maxLines: 1,
                              minFontSize: 9,
                            ),
                          ),
                          Container(
                            // height: getProportionateScreenHeight(30),
                            // width: getProportionateScreenWidth(115),
                            child: AutoSizeText(
                              doctor.firstName+" ",
                              style: body3_18pt,
                              maxLines: 1,
                              minFontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/home/location_icon.png",
                              height: getProportionateScreenHeight(12),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Container(
                              // height: getProportionateScreenHeight(18),
                              // width: getProportionateScreenWidth(120),
                              child: AutoSizeText(
                                doctor.district,
                                style: darkGrayText_14pt,
                                minFontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getStores();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      body: Builder(
        builder:(context)=> SafeArea(
          child: Column(
            children: [

              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
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
                              onTap: () {
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
                            Container(
                                height: getProportionateScreenHeight(28),
                                child: AutoSizeText(
                                  "الخريطة",
                                  style: h5_21pt,
                                  minFontSize: 8,
                                )),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.grey.shade50,
                                child: Image.asset(
                                  "assets/images/vendor_app/back_icon.png",
                                  height: 24,
                                  width: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(24),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              Expanded(
                child: loading?LoadingScreen():Stack(
                  alignment: Alignment.center,
                  children: [

                    GoogleMap(
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: false,
                      initialCameraPosition: _initialCameraPosition,

                      onTap: (position) {
                        _customInfoWindowController.hideInfoWindow();
                        _info=null;
                      },
                      onCameraMove: (position) {
                        _customInfoWindowController.onCameraMove();
                        _customInfoWindowController.hideInfoWindow();
                      },
                      onMapCreated: (GoogleMapController controller) async {
                        _googleMapController = controller;
                        _customInfoWindowController.googleMapController =
                            controller;
                      },
                      markers: Set<Marker>.of(markers.values),
                      // {
                      //   if (_origin != null) _origin,
                      //   if (_destination != null) _destination
                      // },
                      polylines: {
                        if (_info != null)
                          Polyline(
                            polylineId: PolylineId('overview_polyline'),
                            color: Color(0xFF49C3EA),
                            width: 5,
                            points: _info.polylinePoints
                                .map((e) => LatLng(e.latitude, e.longitude))
                                .toList(),
                          ),
                      },
                      // onLongPress: _addMarker,
                    ),
                    Positioned(top: getProportionateScreenHeight(16),
                        height: getProportionateScreenHeight(35),
                        child: Container(
                          width: getProportionateScreenWidth(390),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: ()async{
                                  stores.value=!stores.value;
                                  await getStores();
                                },
                                child: Container(width: getProportionateScreenWidth(105),
                                  height: getProportionateScreenHeight(35),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: !stores.value ? Colors.white:Color(0xFFE4F2F6)),
                                  child: Center(
                                    child: AutoSizeText(
                                      "متاجر", style: body1_16pt_blue,
                                      minFontSize: 9,),
                                  ),),
                              ),
                              GestureDetector(
                                  onTap: ()async{

                                    stores.value=!stores.value;
                                    await getDoctors();
                                  },
                                child: Container(width: getProportionateScreenWidth(105),
                                  height: getProportionateScreenHeight(35),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: stores.value ? Colors.white:Color(0xFFE4F2F6)),
                                  child: Center(
                                    child: AutoSizeText(
                                      "أطباء", style: body1_16pt_blue,
                                      minFontSize: 9,),
                                  ),),
                              ),



                            ],
                          ),
                        )),
                    if (_info != null)
                      Positioned(
                        top:getProportionateScreenHeight(55.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ],
                          ),
                          child: Text(
                            '${_info.totalDistance}, ${_info.totalDuration}',
                            style: blueButton_14pt,
                          ),
                        ),
                      ),
                    CustomInfoWindow(
                      controller: _customInfoWindowController,
                      height: getProportionateScreenHeight(140),
                      width: getProportionateScreenWidth(150),
                      offset: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   foregroundColor: Colors.black,
      //   onPressed: () => _googleMapController.animateCamera(
      //     _info != null
      //         ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
      //         : CameraUpdate.newCameraPosition(_initialCameraPosition),
      //   ),
      //   child: const Icon(Icons.center_focus_strong),
      // ),
    );
  }

  // void _addMarker(LatLng pos) async {
  //   var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
  //       "assets/images/vendor_app/my_location_marker.png");
  //   var icon1 = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
  //       "assets/images/vendor_app/location_marker.png");
  //   LocationPermission  permission = await Geolocator.checkPermission();
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   LatLng userLocation = LatLng(position.latitude, position.longitude);
  //   if (_origin == null || (_origin != null && _destination != null)) {
  //     // Origin is not set OR Origin/Destination are both set
  //     // Set origin
  //     setState(() {
  //       _origin = Marker(
  //         markerId: MarkerId('origin'),
  //         // infoWindow: const InfoWindow(title: 'Origin'),
  //         icon: icon,
  //         position: userLocation,
  //         onTap: () {
  //           _customInfoWindowController.addInfoWindow(
  //             Column(
  //               children: [
  //                 Expanded(
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                       color: Colors.blue,
  //                       borderRadius: BorderRadius.circular(4),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Icon(
  //                             Icons.account_circle,
  //                             color: Colors.white,
  //                             size: 30,
  //                           ),
  //                           SizedBox(
  //                             width: 8.0,
  //                           ),
  //                           Text(
  //                             "I am here",
  //                             style:
  //                             Theme
  //                                 .of(context)
  //                                 .textTheme
  //                                 .headline6
  //                                 .copyWith(
  //                               color: Colors.white,
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     width: double.infinity,
  //                     height: double.infinity,
  //                   ),
  //                 ),
  //                 Triangle.isosceles(
  //                   edge: Edge.BOTTOM,
  //                   child: Container(
  //                     color: Colors.blue,
  //                     width: 20.0,
  //                     height: 10.0,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             pos,
  //           );
  //         },
  //       );
  //       // Reset destination
  //       _destination = null;
  //
  //       // Reset info
  //       _info = null;
  //     });
  //   } else {
  //     // Origin is already set
  //     // Set destination
  //     setState(() {
  //       _destination = Marker(
  //         markerId: MarkerId('destination'),
  //         // infoWindow: const InfoWindow(title: 'Destination'),
  //         // icon: BitmapDescriptor.defaultMarker,//BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         icon: icon1,
  //         //BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //         position: pos,
  //       );
  //     });
  //
  //     // Get directions
  //     final directions = await DirectionsRepository()
  //         .getDirections(origin: _origin.position, destination: pos);
  //     setState(() => _info = directions);
  //   }
  // }

// Future<ui.Image> getImageFromPath(String imagePath) async {
//
//   //String fullPathOfImage = await getFileData(imagePath);
//
//   var dataBytes;
//   var request = await http.get(imagePath);
//   var bytes = await request.bodyBytes;
//   dataBytes = bytes;
//   //File imageFile = File(fullPathOfImage);
//   // ByteData bytes = await rootBundle.load(imagePath);
//   Uint8List imageBytes = bytes.buffer.asUint8List();
//   //Uint8List imageBytes = imageFile.readAsBytesSync();
//
//   final Completer<ui.Image> completer = new Completer();
//
//   ui.decodeImageFromList(imageBytes, (ui.Image img) {
//     return completer.complete(img);
//   });
//   //print("COMPLETERR DONE Full path of image is"+imagePath);
//   return completer.future;
// }
// Future<BitmapDescriptor> getMarkerIcon(String imagePath, Size size, String placeName) async {
//   final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//   final Canvas canvas = Canvas(pictureRecorder);
//
//   final Radius radius = Radius.circular(size.width / 2);
//
//   final Paint tagPaint = Paint()..color = Colors.blue;
//   final double tagWidth = 40.0;
//
//   final Paint shadowPaint = Paint()..color = Colors.blue.withAlpha(100);
//   final double shadowWidth = 15.0;
//
//   final Paint borderPaint = Paint()..color = Colors.white;
//   final double borderWidth = 3.0;
//
//   final double imageOffset = shadowWidth + borderWidth;
//
//   // Add shadow circle
//   canvas.drawRRect(
//       RRect.fromRectAndCorners(
//         Rect.fromLTWH(
//             0.0,
//             0.0,
//             size.width,
//             size.height
//         ),
//         topLeft: radius,
//         topRight: radius,
//         bottomLeft: radius,
//         bottomRight: radius,
//       ),
//       shadowPaint);
//
//   // Add border circle
//   canvas.drawRRect(
//       RRect.fromRectAndCorners(
//         Rect.fromLTWH(
//             shadowWidth,
//             shadowWidth,
//             size.width - (shadowWidth * 2),
//             size.height - (shadowWidth * 2)
//         ),
//         topLeft: radius,
//         topRight: radius,
//         bottomLeft: radius,
//         bottomRight: radius,
//       ),
//       borderPaint);
//
//   // Add tag circle
//   canvas.drawRRect(
//       RRect.fromRectAndCorners(
//         Rect.fromLTWH(
//             size.width - tagWidth,
//             0.0,
//             tagWidth,
//             tagWidth
//         ),
//         topLeft: radius,
//         topRight: radius,
//         bottomLeft: radius,
//         bottomRight: radius,
//       ),
//       tagPaint);
//
//   // Add tag text
//   TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
//   textPainter.text = TextSpan(
//     text: placeName,
//     style: TextStyle(fontSize: 20.0, color: Colors.white),
//   );
//
//   textPainter.layout();
//   textPainter.paint(
//       canvas,
//       Offset(
//           size.width - tagWidth / 2 - textPainter.width / 2,
//           tagWidth / 2 - textPainter.height / 2
//       )
//   );
//
//   // Oval for the image
//   Rect oval = Rect.fromLTWH(
//       imageOffset,
//       imageOffset,
//       size.width - (imageOffset * 2),
//       size.height - (imageOffset * 2)
//   );
//
//   // Add path for oval image
//   canvas.clipPath(Path()
//     ..addOval(oval));
//
//   // Add image
//   ui.Image image = await getImageFromPath(imagePath);   // Alternatively use your own method to get the image
//   print("GET MARKER ICON CUSTOMISE CALLED"+image.height.toString());
//   paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.fitWidth);
//
//   // Convert canvas to image
//   final ui.Image markerAsImage = await pictureRecorder.endRecording().toImage(
//       size.width.toInt(),
//       size.height.toInt()
//   );
//
//   // Convert image to bytes
//   final ByteData byteData = await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
//   final Uint8List uint8List = byteData.buffer.asUint8List();
//
//   return BitmapDescriptor.fromBytes(uint8List);
// }
}

