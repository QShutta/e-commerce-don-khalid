import 'package:e_commerce_halfa/controller/settings_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditButton extends StatelessWidget {
  EditButton({super.key});

  final SettingController settingController = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          Container(
            padding: EdgeInsets.all(10),
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    settingController.addImageFromCamera();
                    Get.back();
                  },
                  child: Column(children: [Icon(Icons.camera), Text("Camera")]),
                ),
                SizedBox(width: 150),
                InkWell(
                  onTap: () {
                    settingController.addImageFromGallery();
                    Get.back();
                  },
                  child: Column(
                    children: [
                      Icon(Icons.photo_library_outlined),
                      Text("Gellary"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          textAlign: TextAlign.center,
          "Edit",
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
