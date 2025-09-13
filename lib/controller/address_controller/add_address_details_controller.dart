import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  //Will recive the lat,lang from the prevoius page
  String? lat;
  String? long;

  initalData() {
    lat = Get.arguments["lat"];
    long = Get.arguments['long'];
  }

  @override
  void onInit() {
    initalData();
    print("----------------------------------------------------");
    print("you'r current lat,lang is :$lat,$long");
    print("----------------------------------------------------");
    super.onInit();
  }
}
