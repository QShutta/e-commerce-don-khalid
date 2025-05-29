import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confitmPasswordCont = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordFocus = FocusNode();
  FocusNode confitmPasswordFocus = FocusNode();

  @override
  dispose() {
    passwordCont.dispose();
    confitmPasswordCont.dispose();
    passwordFocus.dispose();
    confitmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  resetPassword() {
    if (formKey.currentState!.validate()) {
      print("valid");
      Get.toNamed(AppRoutes.passwordResetSuccess);
      Get.delete<ResetPasswordControllerImp>();
    } else {
      print("not valid");
    }
  }
}
