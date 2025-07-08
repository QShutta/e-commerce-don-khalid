import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/reset_password_data/reset_password_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late String email;
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confitmPasswordCont = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode passwordFocus = FocusNode();
  FocusNode confitmPasswordFocus = FocusNode();
  StautusRequest stautusRequest = StautusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  void onInit() {
    email = Get.arguments['email'];
    print("-------------------------------------");
    print("You'r email is :$email");
    super.onInit();
  }

  @override
  dispose() {
    passwordCont.dispose();
    confitmPasswordCont.dispose();
    passwordFocus.dispose();
    confitmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  resetPassword() async {
    if (formKey.currentState!.validate()) {
      stautusRequest = StautusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email, passwordCont.text);
      stautusRequest = handlingStatusRequest(response);
      update();
      if (stautusRequest == StautusRequest.success) {
        if (response["status"] == "success") {
          print("valid");
          Get.toNamed(AppRoutes.passwordResetSuccess);
          // Get.delete<ResetPasswordControllerImp>();
        } else {
          stautusRequest = StautusRequest.failure;
          //الفشل بحصل فقط في حال انو الايميل هو كانمسجل مسبقا .
          Get.defaultDialog(title: "65".tr, middleText: "46".tr);
        }
      }
    } else {
      print("not valid");
    }
  }
}
