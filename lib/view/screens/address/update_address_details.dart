import 'package:e_commerce_halfa/controller/address_controller/update_address_details_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/view/widgets/address/update_address_details/change_location_button.dart';
import 'package:e_commerce_halfa/view/widgets/address/update_address_details/update_address_button.dart';
import 'package:e_commerce_halfa/view/widgets/address/update_address_details/update_form.dart';
import 'package:e_commerce_halfa/view/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateAddressDetails extends StatelessWidget {
  UpdateAddressDetails({super.key});
  final UpdateAddressDetailsController updateAddressDetailsController = Get.put(
    UpdateAddressDetailsController(),
  );
  final MyServices mySer = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        searchTextTitle: "Update Address Details",
        textColor: Colors.black,
        showBackButton: false,
      ),
      body: GetBuilder<UpdateAddressDetailsController>(
        builder: (controller) {
          return HnadlingDataView(
            stautusRequest: updateAddressDetailsController.stautusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: updateAddressDetailsController.addressDetailsForm,
                child: Column(
                  children: [
                    UpdateDetailsForm(),

                    const SizedBox(height: 20),

                    ChangeLocationButton(
                      controller: updateAddressDetailsController,
                      mySer: mySer,
                    ),

                    SizedBox(height: 20),
                    UpdateAddressButton(
                      controller: updateAddressDetailsController,
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
