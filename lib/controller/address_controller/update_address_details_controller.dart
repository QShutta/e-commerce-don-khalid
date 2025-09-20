import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/address_details_data.dart';
import 'package:e_commerce_halfa/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateAddressDetailsController extends GetxController {
  StautusRequest stautusRequest = StautusRequest.none;
  //Will recive the lat,lang from the prevoius page

  //نحن حنعمل update بناء علي ال
  //addressid فقط
  int? addressId;
  String? lat;
  String? long;
  TextEditingController? addressName;
  TextEditingController? addressCity;
  TextEditingController? addressStreet;
  MyServices myServices = Get.find();
  FocusNode? nameFocus;
  FocusNode? cityFocus;
  FocusNode? streetFocus;
  GlobalKey<FormState> addressDetailsForm = GlobalKey();
  AddressDetailsData addressDetailsData = AddressDetailsData(Get.find());
  AddressModel? addressModel;

  @override
  void onInit() {
    // أولاً: تهيئة الـControllers
    addressName = TextEditingController();
    addressCity = TextEditingController();
    addressStreet = TextEditingController();

    // ثانياً: استلام الـarguments
    addressModel = Get.arguments["addressDetails"];
    // ثالثاً: تعبئة الـControllers بالقيم القديمة
    addressName!.text = addressModel?.addressName ?? '';
    addressCity!.text = addressModel?.addressCity ?? '';
    addressStreet!.text = addressModel?.addressStreet ?? '';

    // رابعاً: تخزين lat و long
    lat = addressModel?.addressLat?.toString();
    long = addressModel?.addressLang?.toString();
    addressId = addressModel!.addressId;

    print("---------------------------------------------------------------");
    print("the address before of the update is :$lat and the long is $long");
    print("---------------------------------------------------------------");
    super.onInit();
  }

  goToUpdateAddressDetailsMap() async {
    final result = await Get.toNamed(
      AppRoutes.updateAddressDetailsMap,
      arguments: {"lat": lat, "long": long},
    );

    lat = result['lat'].toString();
    long = result['long'].toString();
    print("---------------------------------------------------------------");
    print("the address after of the update is :$lat and the long is $long");
    print("---------------------------------------------------------------");
  }

  updateAddressDetails() async {
    if (addressDetailsForm.currentState!.validate()) {
      stautusRequest = StautusRequest.loading;
      update();

      var response = await addressDetailsData.updateAddressDetailsData(
        addressId.toString(),
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
          Get.offAllNamed(AppRoutes.home);
        } else {
          Get.defaultDialog(
            title: "Error",
            middleText:
                "To update you have to enter new data not the old data.",
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
