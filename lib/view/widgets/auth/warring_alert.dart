import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showWarningAlert({String? titleKey, String? messageKey}) {
  Get.defaultDialog(
    title: titleKey!.tr,
    middleText: messageKey!.tr,
    titleStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
    ),
    middleTextStyle: const TextStyle(fontSize: 16, color: Colors.black87),
    backgroundColor: Colors.white,
    radius: 15,
    textConfirm: "62".tr,
    confirmTextColor: Colors.white,
    onConfirm: () {
      Get.back();
    },
    buttonColor: Colors.redAccent,
  );
}
