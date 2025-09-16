import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    super.key,
    required this.onButtonClick,
    required this.buttonText,
  });
  final void Function()? onButtonClick;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      // onPressed: () {
      // addAddressCont.goToAddressDetailsPage();
      // },
      icon: Icon(Icons.edit_location_alt, color: Colors.white),
      label: Text(buttonText!, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor, // لون الزر
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // استدارة الحواف
        ),
        elevation: 5, // ظل خفيف
      ),
      onPressed: onButtonClick,
    );
  }
}
