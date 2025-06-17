import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/sign_up_data.dart';
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
  late FocusNode usernameFocusNode;
  late TextEditingController usernameCont;
  List data = [];
  late TextEditingController emailCont;
  late TextEditingController passwordCont;
  late StautusRequest stautusRequest;
  SignUpData signUpData = SignUpData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    usernameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    emailCont = TextEditingController();
    usernameCont = TextEditingController();
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
      var response = await signUpData.postData(
        usernameCont.text,
        emailCont.text,
        passwordCont.text,
      );
      stautusRequest = handlingStatusRequest(response);
      update();
      if (stautusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          data.addAll(response['data']);
          Get.offNamed(AppRoutes.signUpOtp);
          // ✅ لو التحقق تم بنجاح
          MyServices myServices = Get.find();
          await myServices.sharedPreferences.setBool("isLoggedIn", true);
        } else {
          stautusRequest = StautusRequest.failure;
          //بتين ال خطا بحصل ؟في حالة انو يكون البريد مسجل مسبقا ؟في الحالة دي نحنا بس حنعرض ليهو رسالة بتوريهو
          //انو البريد مسجل مسبقا .
          Get.defaultDialog(
            title: "Warning",
            middleText: "The email is already exist...",
          );
        }
      }
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
