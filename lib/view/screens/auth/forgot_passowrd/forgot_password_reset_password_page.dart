import 'package:e_commerce_halfa/controller/auth_controller/forgot_password_controllers/reset_password_controller.dart';
import 'package:e_commerce_halfa/core/class/handling_data_view.dart';
import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/reset_password_header/reset_password_form.dart';
import 'package:e_commerce_halfa/view/widgets/auth/reset_password_header/reset_password_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordResetPassowrdPage extends StatelessWidget {
  const ForgotPasswordResetPassowrdPage({super.key});
  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp resetPasswordControllerImp = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor,
      body: GetBuilder<ResetPasswordControllerImp>(
        builder:
            (controller) => HandlingDataRequest(
              stautusRequest: resetPasswordControllerImp.stautusRequest,
              widget: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: SafeArea(
                  child: Column(
                    children: [
                      ResetPasswordHeader(
                        imagePath: ImageAssets.resetPassowrd,
                        backgroundColor: AppColor.primaryColor,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      ResetPasswordForm(),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
