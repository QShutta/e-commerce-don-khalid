import 'package:e_commerce_halfa/controller/address_controller/update_address_details_controller.dart';
import 'package:e_commerce_halfa/core/functions/valid_input.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UpdateDetailsForm extends StatelessWidget {
  UpdateDetailsForm({super.key});
  final UpdateAddressDetailsController updateAddressDetailsController =
      Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          suffixIcon: Icon(Icons.abc),
          label: 'Enter the Name',
          focusNode: updateAddressDetailsController.nameFocus,
          onFieldSubmitted: (value) {
            FocusScope.of(
              context,
            ).requestFocus(updateAddressDetailsController.cityFocus);
          },
          hint: 'Home , Office , Appartment',
          validator: (String? val) {
            return validInput(val!, 3, 100, "name");
          },
          textcontroller: updateAddressDetailsController.addressName!,
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          suffixIcon: Icon(Icons.location_city_rounded),
          focusNode: updateAddressDetailsController.cityFocus,
          label: 'Enter the city',
          onFieldSubmitted: (value) {
            FocusScope.of(
              context,
            ).requestFocus(updateAddressDetailsController.streetFocus);
          },
          hint: 'Enter the city',
          validator: (String? val) {
            return validInput(val!, 3, 100, "name");
          },
          textcontroller: updateAddressDetailsController.addressCity!,
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          // suffixIcon: Icon(Icons.streetview_outlined),
          suffixIcon: Icon(Icons.map_outlined),
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          focusNode: updateAddressDetailsController.streetFocus,
          label: 'Enter the street',
          hint: 'Enter the street',
          validator: (String? val) {
            return validInput(val!, 3, 100, "name");
          },
          textcontroller: updateAddressDetailsController.addressStreet!,
        ),
      ],
    );
  }
}
