import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class UpdateAddressDetailsMapController extends GetxController {
  // للتحكم بالخريطة
  MapController mapController = MapController();
  //لتخزين موقع المستخدم
  // هنا بنخزن الموقع الكامل للمستخدم كنقطة
  //(latitude + longitude)
  //في متغير واحد من نوع
  //LatLng
  // بدل ما نمسك كل واحد في متغير لوحده
  //هو دة مجرد تنظيم للكود.
  LatLng? userLocation;
  StautusRequest stautusRequest = StautusRequest.none;

  List<Marker> markerList = [];
  //شوف يا مكتب السان دة عمل شنو ؟
  //عرف متغيرين lat,long
  //بس شنو ما اداهم قيمة ؟طيب القيمة حتجي بتين ؟
  //when the user click on any place in the map the are going to be initlized
  //with there values.
  //Where did we are going to use these var?
  //We are going to use them in the addAddressDetails page.we will pass them as arguments to the
  //next page
  double? lat;
  double? long;

  @override
  void onInit() {
    //converted the values to double because the map widget (like LatLng in flutter_map or Google Maps)
    //expects the coordinates (latitude and longitude) to be in double format, not String or int.
    lat = double.parse(Get.arguments["lat"]);
    long = double.parse(Get.arguments["long"]);

    print("---------------------------------------------------------------");
    print("the address before of the update is :$lat and the long is $long");
    print("---------------------------------------------------------------");
    userLocation = LatLng(lat!, long!);

    //To put the marker at the location that the user select previously:
    markerList.add(
      Marker(
        width: 80,
        height: 80,
        point: userLocation!,
        child: Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
    );
    //This to refresh the UI with the new location.
    update();
    super.onInit();
  }

  // method to change marker when user taps new location
  void changeMarker(LatLng newPoint) {
    markerList.clear();
    markerList.add(
      Marker(
        width: 80,
        height: 80,
        point: newPoint,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
    );
    lat = newPoint.latitude;
    long = newPoint.longitude;
    userLocation = LatLng(lat!, long!);
    print("---------------------------------------------------------------");
    print("the address before of the update is :$lat and the long is $long");
    print("---------------------------------------------------------------");
    update();
  }
}
