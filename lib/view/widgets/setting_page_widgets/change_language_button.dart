import 'package:e_commerce_halfa/controller/settings_controller.dart';
import 'package:e_commerce_halfa/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChangeLanguageButton extends StatelessWidget {
  ChangeLanguageButton({super.key});

  final SettingController settingController = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.language),
      title: Text("225".tr),
      trailing: ElevatedButton(
        onPressed: () {
          settingController.changeLanguage();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            0xffEEF2F6,
          ), // Make button background transparent
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Keep the rounded corners
          ),
        ),
        child: Text(
          settingController.langText!,
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
