import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/success_reset_passowrd/success_reset_header.dart';
import 'package:e_commerce_halfa/view/widgets/auth/success_reset_passowrd/success_reset_pass_form.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSuccess extends StatelessWidget {
  const ForgotPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
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
              SuccessResetHeader(
                imagePath: ImageAssets.successResetPass,
                backgroundColor: AppColor.primaryColor,
                height:
                    MediaQuery.of(context).size.height *
                    0.5, // 40% of screen height
              ),

              // الجزء السفلي (نموذج تسجيل الدخول)
              SuccessResetPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}
