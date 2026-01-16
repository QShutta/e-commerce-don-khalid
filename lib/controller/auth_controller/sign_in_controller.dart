import 'package:e_commerce_halfa/core/class/crud.dart';
import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/signin_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SignInController extends GetxController {
  signIn();
  goToSignUp();
  goToForgetPassword();
  signInWithGoogle();
  signInWithFacebook();
}

class SignInControllerImp extends SignInController {
  late FocusNode passwordFocusNode;
  late FocusNode emailFocusNode;
  Crud crud = Get.put(Crud());
  late TextEditingController emailCont;
  late TextEditingController passwordCont;
  StautusRequest stautusRequest = StautusRequest.none;
  MyServices myServices = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignInData signInData = SignInData(Get.find());
  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((token) {
      print("----------------------------------------");
      print("Firebase Token: $token");
      print("----------------------------------------");
    });
    passwordFocusNode = FocusNode();
    emailFocusNode = FocusNode();

    emailCont = TextEditingController();
    passwordCont = TextEditingController();

    super.onInit();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgotPasswordEmail);
  }

  @override
  goToSignUp() {}

  @override
  signIn() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      stautusRequest = StautusRequest.loading;
      update();
      var response = await signInData.postData(
        emailCont.text,
        passwordCont.text,
      );
      stautusRequest = handlingStatusRequest(response);
      update();
      if (stautusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          myServices.sharedPreferences.setString(
            "user_id",
            response["data"]["user_id"].toString(),
          );
          myServices.sharedPreferences.setString(
            "user_name",
            response["data"]["user_name"].toString(),
          );
          myServices.sharedPreferences.setString(
            "user_email",
            response["data"]["user_email"].toString(),
          );
          await myServices.sharedPreferences.setBool("isLoggedIn", true);
          // Subscribe the user to a topic to be able to send notifcaitno to him.
          //This will be used in case of that we want to send notification to all of the users that registered in
          //our applciationp.
          FirebaseMessaging.instance.subscribeToTopic('users');

          //The course instructor want to allow the user to subscrbe to his own topic.so that each user has his own topic
          //What is the benfit of this thing?
          //هو عمل كدة عشان نحنا نقدر انو نرسل اشعار فقط للمستخدم المحدد يعني مثلا هو طلب اوردر معين من غير المنطق ان
          //نرسل اشعارات لجميع المستخدمين الموجودين في التطبيق انو الاوردر بتاع فلان وصل فهمتة ؟
          String userId =
              myServices.sharedPreferences.getString("user_id").toString();
          FirebaseMessaging.instance.subscribeToTopic('users$userId');

          Get.offAllNamed(AppRoutes.home);
        } else {
          stautusRequest = StautusRequest.failure;
          Get.defaultDialog(
            title: "65".tr, // "تحذير" أو "Warning"
            titleStyle: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            middleText: "64".tr, // "البريد الإلكتروني أو كلمة المرور غير صحيحة"
            middleTextStyle: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            backgroundColor: Colors.white,
            radius: 10,
            confirm: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("OK"),
            ),
          );
        }
      }
    } else {
      print("Form is not valid");
    }
  }

  @override
  signInWithFacebook() {
    throw UnimplementedError();
  }

  @override
  signInWithGoogle() async {
    try {
      stautusRequest = StautusRequest.loading;
      update();

      final GoogleSignIn signIn = GoogleSignIn.instance;
      await signIn.initialize(
        clientId: 'YOUR_WEB_CLIENT_ID', // استبدلها بـ clientId للويب
        // serverClientId: 'YOUR_SERVER_CLIENT_ID', // إذا كنت تستخدم خادم
      );

      // محاولة تسجيل الدخول التلقائي
      GoogleSignInAccount? user =
          await signIn.attemptLightweightAuthentication();

      // إذا لم ينجح التسجيل التلقائي، نفّذ تسجيل يدوي
      user ??= await signIn.authenticate();

      await myServices.sharedPreferences.setBool("isLoggedIn", true);

      await myServices.sharedPreferences.setString("google_id", user.id);
      await myServices.sharedPreferences.setString(
        "google_name",
        user.displayName ?? "No Name",
      );
      await myServices.sharedPreferences.setString("google_email", user.email);

      stautusRequest = StautusRequest.success;
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      stautusRequest = StautusRequest.failure;
      Get.defaultDialog(
        title: "66".tr, // "خطأ" أو "Error"
        titleStyle: const TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        middleText: "67".trParams({"error": e.toString()}),
        middleTextStyle: const TextStyle(fontSize: 16, color: Colors.black87),
        backgroundColor: Colors.white,
        radius: 10,
      );
    }
    update();
  }
}
