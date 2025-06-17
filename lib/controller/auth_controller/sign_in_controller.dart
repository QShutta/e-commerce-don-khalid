import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/core/services/services.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/sign_up_data.dart';
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
      MyServices myServices = Get.find();
      await myServices.sharedPreferences.setBool("isLoggedIn", true);
      Get.offAllNamed(AppRoutes.home);
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
