import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
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
  late FocusNode emailFocusNode;
  late TextEditingController emailCont;
  late TextEditingController passwordCont;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
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
      // ✅ لو التحقق تم بنجاح
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
