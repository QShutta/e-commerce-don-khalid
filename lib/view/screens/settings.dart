import 'package:e_commerce_halfa/controller/settings_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/change_language_button.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/disable_notification_switch.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/ligh_dark_switch.dart';
import 'package:e_commerce_halfa/view/widgets/setting_page_widgets/custome_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Before of try to handle the issue of arabic/english,dark/light theme.
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
          //حاوقف الميزة بتاعت رفع الصورة لية ؟
          //It contain bug and i have to fix it .but the amount of time that is availbe to me in the day about 2 ,3 h is not
          //enough to engage with the error.
          //so i will stop the feture temporary and return to it back in the future.
          // UserProfileImage(),
          // صورة المستخدم
          // SizedBox(height: 20),
          // EditButton(),
          ChangeLanguageButton(),
          LighDarkSwitch(),
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
            titleText: "232".tr,
            leadingIcon: Icons.info_outline,
            onListTileClicked: () {},
          ),
          CustomeListTile(
            titleText: "233".tr,
            leadingIcon: Icons.location_on_outlined,
            onListTileClicked: () {
              Get.toNamed(AppRoutes.viewAddress);
            },
          ),
          SizedBox(height: 10),
          CustomeListTile(
            titleText: '234'.tr,
            leadingIcon: Icons.support_agent,
            onListTileClicked: () {},
          ),
          SizedBox(height: 10),

          CustomeListTile(
            titleText: "235".tr,
            leadingIcon: Icons.key_outlined,
            onListTileClicked: () {},
          ),
          SizedBox(height: 10),
          CustomeListTile(
            titleText: "236".tr,
            leadingIcon: Icons.logout_outlined,
            onListTileClicked: () {
              Get.defaultDialog(
                //this is to discard from the default title of the dialog.
                title: "",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.redAccent,
                          size: 28,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "236".tr,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "237".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                            settingController.logout();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "238".tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "63".tr,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
