import 'package:e_commerce_halfa/controller/address_controller/add_address_details_controller.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddAddressDetails extends StatelessWidget {
  AddAddressDetails({super.key});
  final AddAddressDetailsController addAddressDetailsController = Get.put(
    AddAddressDetailsController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        searchTextTitle: "Address Details",
        textColor: Colors.black,
      ),
    );
  }
}
