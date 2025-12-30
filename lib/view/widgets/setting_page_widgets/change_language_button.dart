import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.language),
      title: Text("419".tr),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            0xffEEF2F6,
          ), // Make button background transparent
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Keep the rounded corners
          ),
        ),
        child: const Text(
          "English",
          style: TextStyle(
            color: Color(0xff084699),
            fontSize: 18, // Customize font size
            fontWeight: FontWeight.bold, // Customize font weight
          ),
        ),
      ),
    );
  }
}
