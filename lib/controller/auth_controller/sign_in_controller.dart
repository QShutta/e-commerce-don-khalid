import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ✅ استخدمنا
//abstract class
//علشان نحدد شكل الدوال اللي لازم تتنفذ في الكلاس الأساسي
// ✅ ده بيساعدنا نفصل بين تعريف الوظائف
//(interface)
//وبين التطبيق الفعلي
//(implementation)
// ✅ بنكتب الدوال في
//abstract class
//بدون تفاصيل، وبعدين ننفذها داخل الكلاس اللي بيورث منها
// ✅ الطريقة دي بتنظم الكود أكثر، وبتسهل التوسعة أو التعديل في المشاريع الكبيرة
// ✅ كمان بتفيد في كتابة اختبارات
//(Testing)
//أو في حالة حبينا نغير الكود لاحقًا بدون ما نأثر على الباقي

abstract class SignInController extends GetxController {
  signIn();
  goToSignUp();
  goToForgetPassword();
  signInWithGoogle();
  signInWithFacebook();
}

class SignInControllerImp extends SignInController {
  late FocusNode passwordFocusNode;
  late FocusNode emailFocus;
  late FocusNode userNameFocus;
  late FocusNode confirmPasswordFocus;

  late TextEditingController userNameCont;
  late TextEditingController emailCont;
  late TextEditingController passwordCont;
  late TextEditingController confitPasswordCont;
  //When did the statusRequest will be initlized?xxxxxxxxxxxxxxxx
  late StautusRequest stautusRequest;
  List data = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignUpData signUpData = SignUpData(Get.find());
  @override
  void onInit() {
    passwordFocusNode = FocusNode();
    emailFocus = FocusNode();
    emailCont = TextEditingController();
    passwordCont = TextEditingController();
    userNameCont = TextEditingController();
    confitPasswordCont = TextEditingController();
    userNameFocus = FocusNode();
    confirmPasswordFocus = FocusNode();

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
      // ✅ لو التحقق تم بنجاح

      stautusRequest = StautusRequest.loading;
      update();
      var response = await signUpData.postData(
        userNameCont.text,
        emailCont.text,
        passwordCont.text,
      );
      stautusRequest = handlingStatusRequest(response);
      if (stautusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          data.addAll(response['data']);
          Get.offNamed(AppRoutes.signUpOtp);
        } else {
          //في حالة الفشل ؟بتين بحصل فشل ؟في حالة واحدة فقط انو الايميل يكون موجود مسبقا .
          //So we are going to display to him a message tell him that the email is alredy exist.
          Get.defaultDialog(
            title: "Warning",
            confirm: Text("Email already Exist"),
          );
          stautusRequest = StautusRequest.failure;
        }
      }
      update(); //This will update the UI

      MyServices myServices = Get.find();
      await myServices.sharedPreferences.setBool("isLoggedIn", true);

      // ✅ يروح على الهوم
      Get.offAllNamed(AppRoutes.home);
    } else {
      print("Form is not valid");
    }
  }

  @override
  signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
