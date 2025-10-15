import 'package:e_commerce_halfa/controller/home_with_bottom_nav_bar_controller.dart';
import 'package:e_commerce_halfa/controller/order/order_controller.dart';
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
    // //Will ensure that ui is ready.

    // WidgetsBinding.instance.addPostFrameCallback((_) {
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
    // Show the new snackbar.
    // Using a small future delay can sometimes help ensure the UI is ready.
    //What is the reason that make you add Future.delayed?
    //The reaon is that before of adding the Future.delyed the notfication will not apear unless we move to another page or do
    //some action in the app .and this is the explation of the benfit of the Future.dalpyed
    /*تخيل إن "واجهة المستخدم" 
    (UI)
     في تطبيقك عبارة عن رسام شاطر جداً وسريع، قاعد يرسم الشاشة اللي المستخدم شايفها حالياً (صفحة الطلبات مثلاً).
      الرسام ده عنده مهمة واحدة بس: يفضل يرسم وينفذ الأوامر اللي بتجيله بالترتيب.
الـ FirebaseMessaging.onMessage.listen ده عامل زي "المساعد" بتاع الرسام. أول ما بيوصل إشعار من السيرفر، المساعد ده بيجري فوراً على الرسام ويقوله: "يا رسام! لو سمحت اعرض الرسالة دي فوراً!".
المشكلة كانت فين؟ (قبل التعديل)
المساعد كان مستعجل جداً. الإشعار بيوصل في جزء من الثانية، فالمساعد بيجري على الرسام والرسام بيكون لسه في نص الرسمة بتاعته، ومركز جداً. بيقول للمساعد: "حاضر، بس اديني ثانية أخلص الشخبطة اللي في إيدي دي".
المساعد بيحط الطلب (الـ Snackbar) على جنب، والرسام بينساه لأنه مشغول. الرسام مش هيبص على الطلبات الجديدة دي إلا لما أنت تعمل حركة جديدة في التطبيق (زي إنك تتنقل لصفحة تانية). الحركة دي بتخليه يخلص رسمته الحالية ويبدأ واحدة جديدة، وساعتها بيشوف الطلب القديم بتاع المساعد ويعرضه.
عشان كده الإشعار كان بيظهر متأخر.
الحل كان إيه؟ (بعد التعديل)
إحنا عملنا حاجة بسيطة جداً وذكية. التعديل اللي عملناه بيقول للمساعد: "لما يوصلك إشعار، ماتجريش على الرسام على طول. اهدى شوية".
Future.delayed(const Duration(milliseconds: 100), ...)
الكود ده عامل زي ما نكون بنقول للمساعد: "عد لحد 3 قبل ما تكلم الرسام".
الفترة دي (100 جزء من الثانية) قصيرة جداً لدرجة إن المستخدم مش هيحس بيها أبداً، لكنها كافية جداً للرسام إنه يخلص الشخبطة اللي في إيده ويرفع راسه ويكون مستعد يسمع الأوامر الجديدة.
فلما المساعد بيروح للرسام بعد الـ 100 ميللي ثانية دي، بيكون الرسام خلص اللي في إيده ومستعد تماماً، فبياخد طلب الـ Snackbar ويعرضه في نفس اللحظة. */
    Future.delayed(const Duration(milliseconds: 100), () {
        Get.snackbar(
        remoteMessage.notification?.title ?? 'Notification',
        remoteMessage.notification?.body ?? '',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.whiteBackground,
        colorText: Colors.black,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
        duration: const Duration(seconds: 4), // A little longer to read
      );
    });
    refreshPageNotfication(remoteMessage.data);
  });
}

//We have to do an action that when the message came and we are in the order page the ui should be refreshed when the 
//admin approve the order. or generally the order status is change.
refreshPageNotfication(data){
  print("----------------------page id-------------------------");
  print(data['pageid']);
  print("--------------------------page name---------------------------------");
  print(data['pagename']);
  print("----------------------------------------------");
//First we have to make sure that we are in the order tap.because if we are not in the 
//order tap there will be no need for refreshing the ui
  //We have to make sure that the page
  String pageName=data['pagename']??'';
   //The benfir of this condition is that we will just want to make sure that will update
   //the order page not other pageعاوزين نتاكد اول من انو الاشعار فعلا تابع لي صفحة orders
   //So that we will just update the order tap not all of the taps in the UI.
   if(pageName=="order"){
  //To know which tap that we are currently on we have to use homewithBottomNavigationBarController.
  final HomeWithBottomNavBarControllerImp homeWithBottomNavBarController=Get.find<HomeWithBottomNavBarControllerImp>();
 
    /*the thing that i understand that if i didn't add this condtion if we are in another tap and there is
     a notfication arrive  without of thsi condtion the app will crash because of want to refresh the ui but
      wiht this condtion even if we are in another tap there is no error will occure?
      “Is OrderController already active in memory?”
     ✅ If yes → refresh orders safely
     ❌ If not → skip, no crash, no problem. */
   //make sure that the 
    if(Get.isRegistered<OrderController>()){
           OrderController orderController=Get.find<OrderController>();
           orderController.getOrder();
    }

   }
}