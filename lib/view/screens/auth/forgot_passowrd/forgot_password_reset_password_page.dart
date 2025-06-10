import 'package:e_commerce_halfa/controller/auth_controller/forgot_password_controllers/reset_password_controller.dart';
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
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SingleChildScrollView(
        // السطر دا بيخلي الكيبورد يقفل (يختفي) لما المستخدم يسحب (يسكرول) في الشاشة،
        // بدل ما يفضل الكيبورد مفتوح ويغطي المحتوى.
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            children: [
              // الجزء العلوي (الخلفية الملونة)
              ResetPasswordHeader(
                imagePath: ImageAssets.resetPassowrd,

                backgroundColor: AppColor.primaryColor,
                height:
                    MediaQuery.of(context).size.height *
                    0.3, // 40% of screen height
              ),

              // الجزء السفلي (نموذج تسجيل الدخول)
              ResetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
