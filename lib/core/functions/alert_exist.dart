import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExit() {
  Get.defaultDialog(
    title: "60".tr,
    titleStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    middleText: "61".tr,
    middleTextStyle: TextStyle(fontSize: 16),
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      onPressed: () {
        exit(0);
      },
      child: Text("62".tr, style: TextStyle(color: Colors.white)),
    ),
    cancel: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
      onPressed: () {
        Get.back();
      },
      child: Text("63".tr, style: TextStyle(color: Colors.white)),
    ),
  );
}
