import 'package:e_commerce_halfa/core/class/stautus_request.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/functions/handling_status_request.dart';
import 'package:e_commerce_halfa/data/data_source/remote/auth/sign_up_otp_data.dart';
import 'package:e_commerce_halfa/view/widgets/auth/warring_alert.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class EmailOtpCont extends GetxController {
  checkCode();
  resendCode();
  goToSuccessSignUpPage();
}

class EmailOtpControllerImp extends EmailOtpCont {
  SignUpOtpData signUpOtpData = SignUpOtpData(Get.find());
  late String varfyCode;
  late String email;
  //The error could be herer because of the statusRequest has not been initlized yet ...xxxxxxxxxxxxx
  StautusRequest stautusRequest = StautusRequest.none;
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void checkCode() async {
    stautusRequest = StautusRequest.loading;
    update();
    var response = await signUpOtpData.postData(email, varfyCode);
    stautusRequest = handlingStatusRequest(response);
    update();
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        goToSuccessSignUpPage();
      } else {
        stautusRequest = StautusRequest.failure;
        //الفشل بحصل فقط في حال انو الايميل هو كانمسجل مسبقا .
        showWarningAlert(titleKey: "65", messageKey: "76");
      }
    }
  }

  @override
  goToSuccessSignUpPage() {
    Get.toNamed(AppRoutes.successSignUp);
  }

  @override
  resendCode() async {
    stautusRequest = StautusRequest.loading;
    update();
    var response = await signUpOtpData.resendVerfyCode(email);
    stautusRequest = handlingStatusRequest(response);
    update();
    if (stautusRequest == StautusRequest.success) {
      if (response["status"] == "success") {
        Get.snackbar(
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          "Success",
          "A new verification code has been sent to your email. Please check your inbox or spam folder.",
        );
      } else {
        stautusRequest = StautusRequest.failure;
        //الفشل بحصل فقط في حال انو الايميل هو كانمسجل مسبقا .
        Get.snackbar(
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          "Failure",
          "We couldn’t send the verification code at the moment. Please check your internet connection and try again.",
        );
      }
    }
  }
}
