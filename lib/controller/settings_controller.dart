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

class SettingController extends GetxController {
  Crud crud = Get.put(Crud());
  // Crud crud = Get.find();
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
    getData();

    print(
      "------------------------------------End of getData------------------------------",
    );
    super.onInit();
    // print("${AppLinkApi.usersImage}/${userImageUrl!}");
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
 logout()async{
   myServices.sharedPreferences.setBool(
                "isLoggedIn",
                false,
              );

   Get.offAllNamed(AppRoutes.signIn);
   String userId=myServices.sharedPreferences.getString("user_id").toString();
  await   FirebaseMessaging.instance.unsubscribeFromTopic("users"); 
  await   FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");  
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
    switchDarkLigh = value;
    update();
  }

  onDisableNotification(value) {
    switchNotification = value;
    update();
  }

  Future<void> uploadProfileImage(File image, {String? fileName}) async {
    print(
      "----------------------------------inside of the uploadPrfoleImage---------------------------------------",
    );
    fileName ??= basename(image.path);
    print("--------------------------------------------------------------");
    print("before of postRequestWithFile");
    var response = await crud.postRequestWithFile(
      "${AppLinkApi.serverUrl}/uploade_user_image.php",
      {
        "user_id": myServices.sharedPreferences.getString("user_id").toString(),
        // "user_id": "81",
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
}
