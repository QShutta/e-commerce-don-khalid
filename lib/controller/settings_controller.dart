import 'dart:io';
import 'dart:math';

import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/user_data.dart';
import 'package:e_commerce_halfa/data/model/users_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  Crud crud = Get.put(Crud());
  // Crud crud = Get.find();
  bool switchFingerPrint = false;
  bool switchDarkLigh = false;
  UsersModel? userData;
  bool switchNotification = false;
  MyServices myServices = Get.find();
  UsersData usersData = UsersData(Get.find());
  File? image;
  StautusRequest? stautusRequest;
  // هنا حتجيب الصورة من الـ
  //DB (مثلاً url)
  String userImageUrl = "";
  final ImagePicker picker = ImagePicker();
  List titles = ["Change Language", "Light/Dark Mode", "Disable Notification"];
  List leadingIcons = [
    Icons.language,
    Icons.wb_sunny_outlined,
    Icons.notifications_off_outlined,
  ];

  // التقط صورة من الكاميرا
  @override
  void onInit() {
    print(
      "------------------------------------getData------------------------------",
    );
    // Load saved fingerprint preference (use consistent key "fingerPrint")

    switchFingerPrint =
        myServices.sharedPreferences.getBool("fingerPrint") ?? false;
    update();
    getData();

    print(
      "------------------------------------End of getData------------------------------",
    );
    super.onInit();
    // print("${AppLinkApi.usersImage}/${userImageUrl!}");
  }

  Future<void> enableFingerPrint(bool state) async {
    switchFingerPrint = !state;
    print(switchFingerPrint);
    // If enabling fingerprint, require that a user is already signed in
    if (switchFingerPrint == true) {
      String? userId = myServices.sharedPreferences.getString("user_id");
      print(userId);
      if (userId == null || userId.isEmpty) {
        Get.defaultDialog(
          title: 'Notice',
          middleText: 'Please sign in first before enabling fingerprint login.',
          textConfirm: 'OK',
          onConfirm: () => Get.back(),
        );
        return;
      }
    }
    await myServices.sharedPreferences.setBool(
      "fingerPrint",
      switchFingerPrint,
    );
    // persist which user enabled fingerprint so we can re-associate on biometric login
    if (switchFingerPrint) {
      final String? uid = myServices.sharedPreferences.getString('user_id');
      print("useruid:$uid");
      await myServices.sharedPreferences.setString('fingerPrint_user_id', uid!);
    } else {
      await myServices.sharedPreferences.remove('fingerPrint_user_id');
    }
    update();
  }

  addImageFromCamera() async {
    var cameraPickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (cameraPickedImage != null) {
      image = File(cameraPickedImage.path);
      update();
      stautusRequest = StautusRequest.loading;
      update();

      await uploadProfileImage(image!);

      stautusRequest = StautusRequest.success;
      update();
    }
  }

  logout() async {
    // Clear login state but keep fingerprint preference so user can login later with biometrics
    myServices.sharedPreferences.setBool("isLoggedIn", false);

    // Unsubscribe from topics using current user id (if any)
    final String? currentUserId = myServices.sharedPreferences.getString(
      "user_id",
    );
    await FirebaseMessaging.instance.unsubscribeFromTopic("users");
    if (currentUserId != null && currentUserId.isNotEmpty) {
      await FirebaseMessaging.instance.unsubscribeFromTopic(
        "users$currentUserId",
      );
    }

    // Remove only session-specific data; keep fingerprint prefs so biometric login remains possible
    myServices.sharedPreferences.remove('user_id');
    // Note: we intentionally DO NOT call sharedPreferences.clear() to preserve fingerprint settings
    Get.offAllNamed(AppRoutes.signIn);
    //Why did they use this?
    //To ensure that all user-related data is removed upon logout, enhancing security and privacy.
    //why?
    // If we don't clear the shared preferences, sensitive information like user IDs, tokens, and settings could remain on the device after logout. This could lead to unauthorized access if someone else uses the app on the same device.
    //By clearing the shared preferences, we ensure that all user-related data is removed, enhancing security and privacy.
    myServices.sharedPreferences.clear();
  }

  // اختر صورة من المعرض
  addImageFromGallery() async {
    var gellaryPickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (gellaryPickedImage != null) {
      image = File(gellaryPickedImage.path);

      // الصور المختارة من المعرض قد يكون لها نفس الاسم.
      // لضمان عدم حدوث تداخل أو استبدال عند رفعها، نقوم بإنشاء اسم فريد.
      var pickedImageName = basename(gellaryPickedImage.name);

      update();
      var random = Random().nextInt(10000);
      pickedImageName = "$random$pickedImageName";
      stautusRequest = StautusRequest.loading;
      update();
      await uploadProfileImage(image!, fileName: pickedImageName);
      stautusRequest = StautusRequest.success;
      update();
    }
  }

  onLighDarkSwithchClicked(value) {
    switchDarkLigh = !value;

    update();
  }

  onDisableNotification(value) {
    switchNotification = value;
    update();
  }

  Future<void> uploadProfileImage(File image, {String? fileName}) async {
    stautusRequest = StautusRequest.loading;
    update();
    print(
      "----------------------------------inside of the uploadPrfoleImage---------------------------------------",
    );
    fileName ??= basename(image.path);
    print("--------------------------------------------------------------");
    print("before of postRequestWithFile");
    var response = await crud.postRequestWithFile(
      "${AppLinkApi.serverUrl}/uploade_user_image.php",
      {
        "user_id": myServices.sharedPreferences.getString("user_id"),
        // include previous image name so server code doesn't warn about missing key
        "old_image_name": userImageUrl,
      },
      image,
      fileName: fileName, // ← مرر الاسم هنا
    );
    print("--------------------------------------------------------------");
    print("after of postRequestWithFile");

    if (response != null && response['success'] == true) {
      userImageUrl = response['image_url'];
      print("--------------------------------------------------------------");
      print("Upload successful: $userImageUrl");
      print("--------------------------------------------------------------");
      stautusRequest = StautusRequest.success;
      update();
    } else {
      print("--------------------------------------------------------------");
      print("Upload failed: ${response?['message']}");
      print("--------------------------------------------------------------");
    }
  }

  getData() async {
    // print removed
    stautusRequest = StautusRequest.loading;
    update();
    var response = await usersData.getData(
      "81",
      // myServices.sharedPreferences.getString("user_id")!,
    );
    stautusRequest = handlingStatusRequest(response);
    // print removed
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        userData = UsersModel.fromJson(response['data']);
        userImageUrl = userData?.userImageUrl ?? "";
        print("---------------------inside of getData----------------------");
        print(userImageUrl);
      } else {
        stautusRequest = StautusRequest.failure;
      }
    }
    update(); //This will update the UI
  }

  openWhatsAppNumber() async {
    final Uri phone = Uri.parse("https://wa.me/249909054928");

    try {
      await launchUrl(phone);
    } catch (e) {
      throw "Could not Lanuch WhatsApp $e";
    }
  }

  callSupport() async {
    //In the path will put the number that we want to call there.
    final Uri phoneNumber = Uri(scheme: 'tel', path: '0909054928');
    //بنفحص اذا التطبيق بتعنا قادر يفتح التطبيق بتاع المكالامات او لا
    if (await canLaunchUrl(phoneNumber)) {
      await launchUrl(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
