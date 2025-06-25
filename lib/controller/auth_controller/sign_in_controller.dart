import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/signin_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  StautusRequest? stautusRequest; //When did this ver will be initlized?
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignInData signInData = SignInData(Get.find());
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
          MyServices myServices = Get.find();
          await myServices.sharedPreferences.setBool("isLoggedIn", true);
          Get.offAllNamed(AppRoutes.home);
        } else {
          stautusRequest = StautusRequest.failure;
          //الفشل بحصل فقط في حال انو الايميل هو كانمسجل مسبقا .
          Get.defaultDialog(
            title: "Warning",
            middleText: "The email or password is incorrect",
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
  signInWithGoogle() {
    throw UnimplementedError();
  }
}
