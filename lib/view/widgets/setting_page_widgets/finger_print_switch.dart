import 'package:e_commerce_halfa/controller/settings_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FingerPrintSwitch extends StatelessWidget {
  FingerPrintSwitch({super.key});

  final SettingController settingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (controller) {
        return ListTile(
          leading: Icon(Icons.fingerprint_rounded),
          title: Text("421".tr),
          trailing: Switch(
            activeTrackColor: AppColor.primaryColor,
            activeThumbColor: Colors.white,
            inactiveTrackColor: Color(0xffDAE0E7),
            inactiveThumbColor: Colors.white,
            value:
                controller.myServices.sharedPreferences.getBool(
                          "fingerPrint",
                        ) ==
                        null
                    ? false
                    : controller.switchFingerPrint,
            onChanged: (v) {
              controller.enableFingerPrint(!v);
            },
          ),
        );
      },
    );
  }
}
