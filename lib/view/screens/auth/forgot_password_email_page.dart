import 'package:e_commerce_halfa/core/constants/color_app.dart';
import 'package:e_commerce_halfa/core/constants/image_assets.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/email_header.dart';
import 'package:e_commerce_halfa/view/widgets/auth/forgot_passord_email_page_widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';

class ForgotPasswordEmailPage extends StatelessWidget {
  const ForgotPasswordEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primaryColor, // Match top Container's color
      body: SingleChildScrollView(
        // السطر دا بيخلي الكيبورد يقفل (يختفي) لما المستخدم يسحب (يسكرول) في الشاشة،
        // بدل ما يفضل الكيبورد مفتوح ويغطي المحتوى.
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Column(
                  children: [
                    // الجزء العلوي (الخلفية الملونة)
                    EmailHeader(
                      imagePath: ImageAssets.forgotPasswordEmailImage,
                      height: 350,
                      imageHight: 300,
                      imageWidth: 300,
                      backgroundColor: AppColor.primaryColor,
                    ),

                    // الجزء السفلي (نموذج تسجيل الدخول)
                    EmailForm(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
