// import 'package:e_commerce_halfa/controller/settings_controller.dart';
// import 'package:e_commerce_halfa/core/constants/color_app.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class LighDarkSwitch extends StatelessWidget {
//   LighDarkSwitch({super.key});
//   SettingController settingController = Get.put(SettingController());
//   @override
//   Widget build(BuildContext context) {
//     return Switch(
//       activeTrackColor: AppColor.primaryColor,
//       activeColor: Colors.white,
//       inactiveTrackColor: Color(0xffDAE0E7),
//       inactiveThumbColor: Colors.white,
//       value: settingController.switchDarkLigh,
//       onChanged: settingController.onLighDarkSwithchClicked,
//     );
//   }
// }
import 'package:e_commerce_halfa/controller/settings_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisableNotificationSwitch extends StatelessWidget {
  DisableNotificationSwitch({super.key});

  SettingController settingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (controller) {
        return ListTile(
          leading: Icon(Icons.notifications_off_outlined),
          title: Text("Disable Notification"),
          trailing: Switch(
            activeTrackColor: AppColor.primaryColor,
            activeColor: Colors.white,
            inactiveTrackColor: Color(0xffDAE0E7),
            inactiveThumbColor: Colors.white,
            value: controller.switchNotification,
            onChanged: controller.onDisableNotification,
          ),
        );
      },
    );
  }
}
