import 'package:flutter/material.dart';

class AddressDetailsButton extends StatelessWidget {
  const AddressDetailsButton({
    super.key,
    required this.onButtonPressed,
    required this.buttonText,
  });
  final void Function()? onButtonPressed;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      // () {
      //   addAddressDetailsController.addAddress();
      // },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(buttonText!, style: TextStyle(color: Colors.white)),
    );
  }
}
