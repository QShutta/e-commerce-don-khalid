import 'package:e_commerce_halfa/controller/search_controller.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/address_details_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  //Will recive the lat,lang from the prevoius page
  String? lat;
  String? long;
  //Why are these variables initialized in onInit instead of directly?
  //Initializing them directly would allocate memory upfront, even if the values are not immediately needed.
  //By initializing them in onInit, we delay the memory allocation until the page is ready and the values are available,
  //which can improve app performance and reduce memory consumption, especially for complex pages.
  TextEditingController? addressName;
  TextEditingController? addressCity;
  TextEditingController? addressStreet;
  MyServices myServices = Get.find();
  StautusRequest stautusRequest = StautusRequest.none;
  FocusNode? nameFocus;
  FocusNode? cityFocus;
  FocusNode? streetFocus;
  GlobalKey<FormState> addressDetailsForm = GlobalKey();
  AddressDetailsData addressDetailsData = AddressDetailsData(Get.find());
  initalData() {
    addressCity = TextEditingController();
    addressName = TextEditingController();
    addressStreet = TextEditingController();

    nameFocus = FocusNode();
    cityFocus = FocusNode();
    streetFocus = FocusNode();

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

  addAddress() async {
    if (addressDetailsForm.currentState!.validate()) {
      stautusRequest = StautusRequest.loading;
      update();

      var response = await addressDetailsData.addAddressDetailsData(
        myServices.sharedPreferences.getString("user_id"),
        addressName!.text,
        addressCity!.text,
        addressStreet!.text,
        lat,
        long,
      );

      stautusRequest = handlingStatusRequest(response);
      update();

      if (stautusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
        } else {
          Get.defaultDialog(
            title: "Error",
            middleText: "Failed to add the address. Please try again later.",
            titleStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
            middleTextStyle: TextStyle(fontSize: 16, color: Colors.black87),
            backgroundColor: Colors.white,
            radius: 15,
            textConfirm: "OK",
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            },
            buttonColor: Colors.redAccent,
          );
        }
      }
    }
  }
}
