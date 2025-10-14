import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


requestPermistionNotification() async {
  await FirebaseMessaging.instance.requestPermission(provisional: true);
}


fcmConfig() {
  //دي شغلها تستمتمع لي الاشعارات كان في اي شعار جاي حتقوم تعرض لينا الاشعار داخل التطبيق بتاعنا .
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print("----------------------------------------------------");
    print("You'r message title is :${remoteMessage.notification!.title}");
    print("------------------------------------------------");

    // ✅ Use WidgetsBinding to ensure it's shown in the UI thread
    //لية عملنا دة ؟
    //When the notfication come and the app is in the forground not in the backeground
    //We have to dispaly this notfication to the user.
    //To do that we impelemnt this code.
    //The widgetsBidngin.instnace.addPostFrameCallback
    //Will ensure that ui is ready.

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //The job of this condition is that if any dialog,snackbar will be tak ed out before of dispaly the new one
      if (Get.isOverlaysOpen) {
        // If there's already an overlay
        Get.back(closeOverlays: true);
      }
      FlutterRingtonePlayer().play(
      android: AndroidSounds.notification,
      ios: IosSounds.glass,
      looping: false, // Android only - API >= 28
      volume: 0.1, // Android only - API >= 28
      asAlarm: false, // Android only - all APIs
);
      //Then display the new notfication
      //that sound good know what else? 
      Get.snackbar(
        remoteMessage.notification?.title ?? 'Notification',
        remoteMessage.notification?.body ?? '',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.whiteBackground,
        colorText: Colors.black,
        duration: const Duration(seconds: 3),
      );
    });
  });
}
