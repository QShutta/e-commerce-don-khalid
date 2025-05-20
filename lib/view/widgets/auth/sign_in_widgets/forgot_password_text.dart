import 'package:e_commerce_halfa/controller/auth_controller/sign_in_controller.dart';
import 'package:e_commerce_halfa/core/constants/app_routes.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordText extends GetView<SignInControllerImp> {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          controller.goToForgetPassword();
        },
        child: Text(
          "24".tr,
          style: TextStyle(
            color: AppColor.greyText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
