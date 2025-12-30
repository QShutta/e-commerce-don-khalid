import 'package:e_commerce_halfa/controller/settings_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/change_language_button.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/custome_list_tile.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/disable_notification_switch.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/edit_button.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/finger_print_switch.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/ligh_dark_switch.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/user_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final SettingController settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20),
          //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          //موضوع الصورة ما تميتو لية؟
          //محتاج ارجع لي
          //course php in the part of adding image and whach the videos to implement this
          UserProfileImage(),
          // صورة المستخدم
          SizedBox(height: 20),
          EditButton(),
          ChangeLanguageButton(),
          LighDarkSwitch(),
          FingerPrintSwitch(),
          DisableNotificationSwitch(),
          SizedBox(height: 20),
          Divider(
            color: Colors.grey, // Adjust the color as needed
            height: 20, // The height of the space the divider occupies
            thickness: 1, // The thickness of the line itself
            indent: 20, // Space before the line starts
            endIndent: 20, // Space after the line ends
          ),
          SizedBox(height: 20),
          CustomeListTile(
            titleText: "423".tr,
            leadingIcon: Icons.info_outline,
            onListTileClicked: () {
              Get.toNamed(AppRoutes.aboutUs);
            },
          ),
          CustomeListTile(
            titleText: "424".tr,
            leadingIcon: Icons.location_on_outlined,
            onListTileClicked: () {
              Get.toNamed(AppRoutes.viewAddress);
            },
          ),
          SizedBox(height: 10),
          CustomeListTile(
            titleText: '425'.tr,
            leadingIcon: Icons.support_agent,
            onListTileClicked: () {
              settingController.callSupport();
            },
          ),
          SizedBox(height: 10),

          CustomeListTile(
            titleText: "426".tr,
            leadingIcon: Icons.key_outlined,
            onListTileClicked: () {},
          ),
          SizedBox(height: 10),
          CustomeListTile(
            titleText: "427".tr,
            leadingIcon: Icons.logout_outlined,
            onListTileClicked: () {
              settingController.logout();
            },
          ),
        ],
      ),
    );
  }
}
