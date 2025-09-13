import 'package:e_commerce_halfa/controller/address_controller/add_address_details_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/functions/valid_input.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/text_form_field_auth.dart';
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
      appBar: CustomeAppBar(
        searchTextTitle: "Address Details",
        textColor: Colors.black,
      ),
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
                    CustomTextFormField(
                      suffixIcon: Icon(Icons.abc),
                      label: 'Enter the name',
                      focusNode: addAddressDetailsController.nameFocus,
                      onFieldSubmitted: (value) {
                        FocusScope.of(
                          context,
                        ).requestFocus(addAddressDetailsController.cityFocus);
                      },
                      hint: 'Home , Office , Appartment',
                      validator: (String? val) {
                        return validInput(val!, 3, 100, "name");
                      },
                      textcontroller: addAddressDetailsController.addressName!,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      suffixIcon: Icon(Icons.location_city_rounded),
                      focusNode: addAddressDetailsController.cityFocus,
                      label: 'Enter the city',
                      onFieldSubmitted: (value) {
                        FocusScope.of(
                          context,
                        ).requestFocus(addAddressDetailsController.streetFocus);
                      },
                      hint: 'Enter the city',
                      validator: (String? val) {
                        return validInput(val!, 3, 100, "name");
                      },
                      textcontroller: addAddressDetailsController.addressCity!,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      suffixIcon: Icon(Icons.streetview_outlined),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      focusNode: addAddressDetailsController.streetFocus,
                      label: 'Enter the street',
                      hint: 'Enter the street',
                      validator: (String? val) {
                        return validInput(val!, 3, 100, "name");
                      },
                      textcontroller:
                          addAddressDetailsController.addressStreet!,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        addAddressDetailsController.addAddress();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
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
