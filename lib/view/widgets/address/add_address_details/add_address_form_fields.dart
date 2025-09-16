import 'package:e_commerce_halfa/controller/address_controller/add_address_details_controller.dart';
import 'package:e_commerce_halfa/core/functions/valid_input.dart';
import 'package:e_commerce_halfa/view/widgets/auth/sign_in_widgets/text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressFormFields extends StatelessWidget {
  AddAddressFormFields({super.key});
  final AddAddressDetailsController addAddressDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          suffixIcon: Icon(Icons.abc),
          label: 'Enter the Name',
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
          // suffixIcon: Icon(Icons.streetview_outlined),
          suffixIcon: Icon(Icons.map_outlined),
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          focusNode: addAddressDetailsController.streetFocus,
          label: 'Enter the street',
          hint: 'Enter the street',
          validator: (String? val) {
            return validInput(val!, 3, 100, "name");
          },
          textcontroller: addAddressDetailsController.addressStreet!,
        ),
      ],
    );
  }
}
