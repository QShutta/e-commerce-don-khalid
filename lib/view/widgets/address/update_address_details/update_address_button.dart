import 'package:e_commerce_halfa/controller/address_controller/update_address_details_controller.dart';
import 'package:flutter/material.dart';

class UpdateAddressButton extends StatelessWidget {
  final UpdateAddressDetailsController controller;
  const UpdateAddressButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.updateAddressDetails();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: const Text("Update", style: TextStyle(color: Colors.white)),
    );
  }
}
