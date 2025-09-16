import 'package:e_commerce_halfa/controller/address_controller/update_address_details_map_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UpdateAddressButtonWidget extends StatelessWidget {
  final UpdateAddressDetailsMapController controller;
  const UpdateAddressButtonWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        print(
          "---------------------------------------------------------------",
        );
        print(
          "the address before of the update is :${controller.lat} and the long is ${controller.long}",
        );
        print(
          "---------------------------------------------------------------",
        );
        Get.back(result: {"lat": controller.lat, "long": controller.long});
      },
      icon: Icon(Icons.edit_location_alt, color: Colors.white),
      label: Text("Update Details", style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
      ),
    );
  }
}
