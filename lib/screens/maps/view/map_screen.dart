import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
import 'package:pets_ecommerce/screens/doctors/model/all_doctors.dart';
import 'package:pets_ecommerce/screens/maps/controller/directions_repository.dart';
import 'package:pets_ecommerce/screens/maps/model/directions_model.dart';

// import 'package:bitmap/bitmap.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';

// import 'package:image/image.dart' ;
import 'package:http/http.dart' as http;
import 'package:pets_ecommerce/screens/stores/model/all_stores.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
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

    try {
      var url = Uri.parse("http://pets.sourcecode-ai.com/api/stores/stores");
      consolePrint("before print");
      final h = await HttpService().getHeaders();
      final apiResult = await http.get(url, headers: h);
      consolePrint("after print");

      if (apiResult.statusCode == 200) {
        Stores = allStoresFromJson(apiResult.body);
        for(int i=0;i<Stores.stores.length;i++)
        {
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
    }
    loading = false;
    setState(() {

    });
  }

  getDoctors() async
  {
    loading = true;
    setState(() {});
    try {
      var url = Uri.parse("http://pets.sourcecode-ai.com/api/doctors");
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
List<Marker> markers=[

];

  addDoctorMarker(Doctor doctor)
  async{
    var icon1 = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
        "assets/images/vendor_app/location_marker.png");
if(doctor.lat==-1||doctor.long==-1)
  return ;

markers.add(
    Marker(
  markerId: MarkerId('doctor${doctor.id}'),
  // infoWindow: const InfoWindow(title: 'Origin'),
  icon: icon1,
  position: LatLng(doctor.lat,doctor.long),
  onTap: () {
    _customInfoWindowController.addInfoWindow(
      Column(
        children: [
          Container(
            
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(7),
            ),
            child:Column(
              children: [
                Container(
                  height: getProportionateScreenHeight(70),
                  width: getProportionateScreenWidth(171),
                  child: ClipRRect(
                    child: Image.network(doctor.image),
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(87),
                  width: getProportionateScreenWidth(171),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AutoSizeText(doctor.firstName),
                          SizedBox(width: getProportionateScreenWidth(3),),
                          AutoSizeText(doctor.lastName),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/home/location_icon.png",
                            height: getProportionateScreenHeight(12),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Container(
                            height: getProportionateScreenHeight(18),
                            width: getProportionateScreenWidth(120),
                            child: AutoSizeText(
                              doctor.district,
                              style: body3_18pt,
                              minFontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            width: getProportionateScreenWidth(171),
            height: getProportionateScreenHeight(157),
          ),
          // Triangle.isosceles(
          //   edge: Edge.BOTTOM,
          //   child: Container(
          //     color: Colors.blue,
          //     width: 20.0,
          //     height: 10.0,
          //   ),
          // ),
        ],
      ),
      LatLng(doctor.lat,doctor.long),
    );
  },
),
);

  }

addStoreMarker(Store store)async
{
  var icon1 = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
      "assets/images/vendor_app/location_marker.png");
  if(store.lat==-1||store.long==-1)
    return ;

  markers.add(
    Marker(
      markerId: MarkerId('store${store.id}'),
      // infoWindow: const InfoWindow(title: 'Origin'),
      icon: icon1,
      position: LatLng(store.lat,store.long),
      onTap: () {
        _customInfoWindowController.addInfoWindow(
          Column(
            children: [
              Container(

                decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(7),
                ),
                child:Column(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(70),
                      width: getProportionateScreenWidth(171),
                      child: ClipRRect(
                        child: Image.network(store.image),
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(87),
                      width: getProportionateScreenWidth(171),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              AutoSizeText(store.name),
                              // SizedBox(width: getProportionateScreenWidth(3),),
                              // AutoSizeText(doctor.lastName),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(5),),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/home/location_icon.png",
                                height: getProportionateScreenHeight(12),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Container(
                                height: getProportionateScreenHeight(18),
                                width: getProportionateScreenWidth(120),
                                child: AutoSizeText(
                                  store.district,
                                  style: body3_18pt,
                                  minFontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                width: getProportionateScreenWidth(171),
                height: getProportionateScreenHeight(157),
              ),
              // Triangle.isosceles(
              //   edge: Edge.BOTTOM,
              //   child: Container(
              //     color: Colors.blue,
              //     width: 20.0,
              //     height: 10.0,
              //   ),
              // ),
            ],
          ),
          LatLng(store.lat,store.long),
        );
      },
    ),
  );
}

addLocationMarker()async{
  var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
      "assets/images/vendor_app/my_location_marker.png");

  LocationPermission  permission = await Geolocator.checkPermission();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  LatLng userLocation = LatLng(position.latitude, position.longitude);


  markers.add(
    Marker(
      markerId: MarkerId('my location'),
      // infoWindow: const InfoWindow(title: 'Origin'),
      icon: icon,
      position: LatLng(userLocation.latitude,userLocation.longitude),
      // onTap: () {
      //   _customInfoWindowController.addInfoWindow(
      //     Column(
      //       children: [
      //         Container(
      //
      //           decoration: BoxDecoration(
      //             // color: Colors.blue,
      //             borderRadius: BorderRadius.circular(7),
      //           ),
      //           child:Column(
      //             children: [
      //               Container(
      //                 height: getProportionateScreenHeight(70),
      //                 width: getProportionateScreenWidth(171),
      //                 child: ClipRRect(
      //                   child: Image.network(store.image),
      //                 ),
      //               ),
      //               Container(
      //                 height: getProportionateScreenHeight(87),
      //                 width: getProportionateScreenWidth(171),
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       children: [
      //                         AutoSizeText(store.name),
      //                         // SizedBox(width: getProportionateScreenWidth(3),),
      //                         // AutoSizeText(doctor.lastName),
      //                       ],
      //                     ),
      //                     SizedBox(height: getProportionateScreenHeight(5),),
      //                     Row(
      //                       children: [
      //                         Image.asset(
      //                           "assets/images/home/location_icon.png",
      //                           height: getProportionateScreenHeight(12),
      //                         ),
      //                         SizedBox(
      //                           width: getProportionateScreenWidth(10),
      //                         ),
      //                         Container(
      //                           height: getProportionateScreenHeight(18),
      //                           width: getProportionateScreenWidth(120),
      //                           child: AutoSizeText(
      //                             store.district,
      //                             style: body3_18pt,
      //                             minFontSize: 10,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //           width: getProportionateScreenWidth(171),
      //           height: getProportionateScreenHeight(157),
      //         ),
      //         // Triangle.isosceles(
      //         //   edge: Edge.BOTTOM,
      //         //   child: Container(
      //         //     color: Colors.blue,
      //         //     width: 20.0,
      //         //     height: 10.0,
      //         //   ),
      //         // ),
      //       ],
      //     ),
      //     LatLng(store.lat,store.long),
      //   );
      // },
    ),
  );
}

  var stores = RxBool(false);
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addLocationMarker();
    getStores();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        // SizedBox(
                        //   width: getProportionateScreenWidth(24),
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Scaffold.of(context).openEndDrawer();
                        //   },
                        //   child: CircleAvatar(
                        //     radius: 24,
                        //     backgroundColor: Colors.grey.shade50,
                        //     child: Image.asset(
                        //       "assets/images/home/menu_icon.png",
                        //       height: 24,
                        //       width: 20,
                        //     ),
                        //   ),
                        // ),
                        Spacer(),
                        Container(height: getProportionateScreenHeight(28),
                            child: AutoSizeText(
                              "الخريطة", style: h5_21pt, minFontSize: 8,)),
                        Spacer(),
                        // CircleAvatar(
                        //   radius: 24,
                        //   backgroundColor: Colors.grey.shade50,
                        //   child: Image.asset(
                        //     "assets/images/home/notification_icon.png",
                        //     height: 24,
                        //     width: 20,
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: getProportionateScreenWidth(24),
                        // ),
                      ],
                    )),
              ),
            ),
            Expanded(
              child: loading?LoadingScreen():Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(top: getProportionateScreenHeight(16),
                      height: getProportionateScreenHeight(35),
                      child: Container(
                        width: getProportionateScreenWidth(390),
                        child: Row(
                          children: [
                            SizedBox(width: getProportionateScreenWidth(80),),
                            Container(width: getProportionateScreenWidth(105),
                              height: getProportionateScreenHeight(35),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: stores.value ? Colors.white:Color(0xFFE4F2F6)),
                              child: AutoSizeText(
                                "أطباء", style: body1_16pt_blue,
                                minFontSize: 9,),),
                            SizedBox(width: getProportionateScreenWidth(32),),
                            Container(width: getProportionateScreenWidth(105),
                              height: getProportionateScreenHeight(35),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: !stores.value ? Colors.white:Color(0xFFE4F2F6)),
                              child: AutoSizeText(
                                "متاجر", style: body1_16pt_blue,
                                minFontSize: 9,),),
                            SizedBox(width: getProportionateScreenWidth(80),),
                          ],
                        ),
                      )),
                  GoogleMap(
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition: _initialCameraPosition,

                    onTap: (position) {
                      _customInfoWindowController.hideInfoWindow();
                    },
                    onCameraMove: (position) {
                      _customInfoWindowController.onCameraMove();
                    },
                    onMapCreated: (GoogleMapController controller) async {
                      _googleMapController = controller;
                      _customInfoWindowController.googleMapController =
                          controller;
                    },
                    markers: {
                      if (_origin != null) _origin,
                      if (_destination != null) _destination
                    },
                    polylines: {
                      if (_info != null)
                        Polyline(
                          polylineId: PolylineId('overview_polyline'),
                          color: Colors.red,
                          width: 5,
                          points: _info.polylinePoints
                              .map((e) => LatLng(e.latitude, e.longitude))
                              .toList(),
                        ),
                    },
                    onLongPress: _addMarker,
                  ),
                  if (_info != null)
                    Positioned(
                      top: 20.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
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
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  CustomInfoWindow(
                    controller: _customInfoWindowController,
                    height: 75,
                    width: 150,
                    offset: 50,
                  ),
                ],
              ),
            ),
          ],
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

  void _addMarker(LatLng pos) async {
    var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
        "assets/images/vendor_app/my_location_marker.png");
    var icon1 = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,
        "assets/images/vendor_app/location_marker.png");
    LocationPermission  permission = await Geolocator.checkPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng userLocation = LatLng(position.latitude, position.longitude);
    if (_origin == null || (_origin != null && _destination != null)) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
          markerId: MarkerId('origin'),
          // infoWindow: const InfoWindow(title: 'Origin'),
          icon: icon,
          position: userLocation,
          onTap: () {
            _customInfoWindowController.addInfoWindow(
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "I am here",
                              style:
                              Theme
                                  .of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      color: Colors.blue,
                      width: 20.0,
                      height: 10.0,
                    ),
                  ),
                ],
              ),
              pos,
            );
          },
        );
        // Reset destination
        _destination = null;

        // Reset info
        _info = null;
      });
    } else {
      // Origin is already set
      // Set destination
      setState(() {
        _destination = Marker(
          markerId: MarkerId('destination'),
          // infoWindow: const InfoWindow(title: 'Destination'),
          // icon: BitmapDescriptor.defaultMarker,//BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          icon: icon1,
          //BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });

      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions);
    }
  }

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

