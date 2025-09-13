import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  // للتحكم بالخريطة
  MapController mapController = MapController();
  //لتخزين موقع المستخدم
  LatLng? userLocation;
  StautusRequest stautusRequest = StautusRequest.none;
  List<Marker> markerList = [];

  @override
  void onInit() async {
    await getUserLocation();
    super.onInit();
  }

  addMarker(LatLng point) {
    markerList.clear();
    markerList.add(
      Marker(
        width: 80,
        height: 80,
        point: point,
        child: Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
    );
    update();
  }

  getUserLocation() async {
    try {
      stautusRequest = StautusRequest.loading;
      update();
      //عاوزين نفحص اذا خدمة
      //GPS   is enabled or disabled.
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.defaultDialog(
          title: "GPS Disabled",
          middleText: "Please enable GPS to continue.",
          textConfirm: "Open Settings",
          onConfirm: () async {
            Geolocator.openLocationSettings();
            Get.back();
          },
          textCancel: "Cancel",
        );
        return; // نوقف تنفيذ الـ getUserLocation
      }
      //After that we check if the location is enabled or not
      //We have to check if the user give our app the
      //permision to access to his current location.

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar(
            "Permission Denied",
            "Please grant location permission to use this feature",
            snackPosition: SnackPosition.BOTTOM,
          );

          throw 'Location permissions are denied';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.defaultDialog(
          title: "Permission Required",
          middleText:
              "You permanently denied location permission. Please open app settings and allow location access.",
          textConfirm: "Open Settings",
          onConfirm: () {
            Geolocator.openAppSettings(); // Opens app settings
            Get.back();
          },
          textCancel: "Cancel",
        );
        throw 'Location permissions are permanently denied.';
      }
      //لمن المستخدم يصل للسطر دة معناها خدمة ال
      //GPS is enabled and also he enable our application to access
      //to his current location.
      //now we can save his current loc.

      LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        /*الـ distanceFilter 
        هو ببساطة "كم متر لازم المستخدم يتحرك قبل ما التطبيق يحدث الموقع".
معناها:
التطبيق ما حيطلب موقع جديد إلا إذا المستخدم تحرك على الأقل 10 أمتار من آخر موقع تم تسجيله.
لو المستخدم واقف في نفس المكان أو تحرك أقل من 10 أمتار، التطبيق يفضل يستخدم الموقع القديم ولا يحدثه كل لحظة.
🔹 الفائدة:
يقلل استهلاك البطارية.
يقلل عدد الطلبات للموقع.
🔹 لو ما كتبت distanceFilter أصلاً:
التطبيق يجيب الموقع الجديد كل مرة (حتى لو تحرك 1 متر أو أقل).
هل تحب أريك مثال سريع يوضح الفرق بين وجود distanceFilter وعدم و */
        distanceFilter: 10, // المسافة بين التحديثات (اختياري)
      );
      //النتيجة ترجع لنا
      //object
      // من نوع
      //Position
      // فيه خط العرض
      //(latitude)
      // وخط الطول
      //(longitude)
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      userLocation = LatLng(position.latitude, position.longitude);
      print("------------------------------------------------------------");
      print("the user loc is :$userLocation");
      print("------------------------------------------------------------");
      mapController.move(userLocation!, 15);
    } catch (e) {
      print("------------------------------------------------");
      print("Error when try to get location$e");
      print("------------------------------------------------");
    }
    /*1️⃣ معنى finally
    بعد ما نخلص 
    try (العملية اللي ممكن تفشل)
    و catch (التعامل مع الخطأ لو صار)،
    finally
     هو الكود اللي يشتغل دائمًا مهما صار، سواء العملية نجحت أو فشلت. */
    finally {
      //سواء العملية نجحت او فشت يا صحبي وقف ال
      //loading and update the ui.
      stautusRequest = StautusRequest.success;
      update();
    }
  }
}
