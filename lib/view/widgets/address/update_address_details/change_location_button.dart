import 'package:e_commerce_halfa/controller/address_controller/update_address_details_controller.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:flutter/material.dart';

class ChangeLocationButton extends StatelessWidget {
  final UpdateAddressDetailsController controller;
  final MyServices mySer;
  const ChangeLocationButton({
    super.key,
    required this.controller,
    required this.mySer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: mySer.sharedPreferences.getString("lang") == "ar" ? 20 : 0,
        right: mySer.sharedPreferences.getString("lang") == "ar" ? 0 : 20,
      ),
      child: Center(
        child: TextButton.icon(
          onPressed: () {
            controller.goToUpdateAddressDetailsMap();
          },
          icon: Icon(Icons.location_on_outlined, color: Colors.blue),
          label: Text(
            'Change Location',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
