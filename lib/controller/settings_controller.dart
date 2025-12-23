import 'dart:io';
import 'dart:math';

import 'package:e_commerce_halfa/app_link_api.dart';
import 'package:e_commerce_halfa/core/class/crud.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/apptheme.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/localization/locale_controller.dart';
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
  final LocaleController localeController = Get.find<LocaleController>();
  // Crud crud = Get.find();
  bool switchDarkLigh = false;
  UsersModel? userData;
  bool switchNotification = false;
  MyServices myServices = Get.find();
  UsersData usersData = UsersData(Get.find());
  File? image;

  //المتغير دة قيمتو حتتغير حسب اللغة المتختارها المستخدم يعني لو لامستخدم اختار لغة انجليزي النص حيكوenglish
  //and if the languge is arbic the text will be عربي
  String? langText;
  StautusRequest? stautusRequest;
  Locale? lang;

  //دة المتغير  اللى هنستخدمه عشان نغير تصميم التطبيق حسب اللغة
  // لو اللغة عربية هنستخدم تصميم معين، ولو إنجليزي هنستخدم تصميم تاني

  ThemeData appTheme = englishTheme;
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
    // Sync the switch visual state with the actual controller state
    switchDarkLigh = localeController.isDarkmode;
    langText =
        myServices.sharedPreferences.getString("lang") == "ar"
            ? "English"
            : "عربي";
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

  //This function the job of this function is to change the language when the user
  //click on the button if the language is arabic will change it to english and if it's enlish will cange it to arabic.
  changeLanguage() {
    //دي عشان نتحصل علي اللغة الحالية للتطبيق .
    String currentLang = myServices.sharedPreferences.getString("lang")!;
    //دي عشان نعكس اللغة يعني لو اللغة الحالية عربي حنغيرها لي انجلزي ولو انجلزي نبقيها عربي وهكذا .
    String newLang = currentLang == "ar" ? "en" : "ar";
    //هنا بنستدعي الدالة القمنها بي بناءها مسبقا لتغيير اللغة .
    localeController.changeLanguage(newLang);

    //النص القاعد في الزر بتاع تغيير اللغة برضو مفترض يتغير
    langText = newLang == "ar" ? "English" : "عربي";
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
    myServices.sharedPreferences.setBool("isLoggedIn", false);

    Get.offAllNamed(AppRoutes.signIn);
    String userId =
        myServices.sharedPreferences.getString("user_id").toString();
    await FirebaseMessaging.instance.unsubscribeFromTopic("users");
    await FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
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
    // Call the function in LocaleController to apply the change
    localeController.changeThemeMode(value);
    update();
  }

  onDisableNotification(value) {
    switchNotification = value;
    update();
  }

  //{} → تجعل الباراميتر اختياري
  Future<void> uploadProfileImage(File image, {String? fileName}) async {
    fileName ??= basename(image.path); // ← إنشاء اسم افتراضي إذا لم يُمرر

    // ← **التعديل الجديد:** تمرير oldImageName للباك
    var response = await crud.postRequestWithFile(
      "${AppLinkApi.serverUrl}/uploade_user_image.php",
      {"user_id": myServices.sharedPreferences.getString("user_id").toString()},
      image,
      fileName: fileName,
      //userImageUrl دة متغير نحن اصلا معرفنو مسبقا في ال controller
      //String userImageUrl = "";
      //هذا المتغيّر يخزن اسم الصورة الحالية للمستخدم أو رابطها بعد ما تجيب بيانات المستخدم من السيرفر.
      oldImageName: userImageUrl, // ← إرسال اسم الصورة القديمة
    );

    if (response != null && response['success'] == true) {
      userImageUrl = response['image_url']; // ← تحديث الرابط الجديد بعد الرفع
      update(); // تحديث الـ UI
      print("Upload successful: $userImageUrl");
    } else {
      print("Upload failed: ${response?['message']}");
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
