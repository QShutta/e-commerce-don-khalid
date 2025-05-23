import 'package:e_commerce_halfa/controller/auth_controller/forgot_password_controllers/forgot_password_verfy_code_controller.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/state_manager.dart';

class OtpTextFormField extends GetView<ForgotPasswordVerfyCodeControllerImp> {
  const OtpTextFormField({super.key, required this.onSubmit});
  final void Function(String)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      borderRadius: BorderRadius.circular(15),
      fillColor: Colors.black,

      numberOfFields: 6,
      borderColor: AppColor.primaryColor,
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      textStyle: TextStyle(fontFamily: "playFair", color: Colors.black),

      //runs when every textfield is filled
      onSubmit: onSubmit,

      // (String verificationCode) {
      //   controller.goToResetPassowrd();
      // }, // end onSubmit
    );
  }
}
