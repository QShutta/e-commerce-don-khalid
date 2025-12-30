import 'package:e_commerce_halfa/controller/address_controller/add_address_details_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/view/widgets/address/add_address_details/add_address_form_fields.dart';
import 'package:e_commerce_halfa/view/widgets/address/add_address_details/address_details_button.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  AddAddressDetails({super.key});
  final AddAddressDetailsController addAddressDetailsController = Get.put(
    AddAddressDetailsController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(searchTextTitle: "601".tr, textColor: Colors.black),
      body: GetBuilder<AddAddressDetailsController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: addAddressDetailsController.stautusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: addAddressDetailsController.addressDetailsForm,
                child: Column(
                  children: [
                    AddAddressFormFields(),
                    const SizedBox(height: 20),
                    AddressDetailsButton(
                      onButtonPressed: () {
                        addAddressDetailsController.addAddress();
                      },
                      buttonText: '602'.tr,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
